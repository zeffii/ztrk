Here's a minimal but solid architecture that many modern 3D sites use. It separates the viewer from the model metadata, making it easy to add new models without changing any code.

```
site/
│
├── index.html
├── viewer.html?id=bearing-block
│
├── models/
│      bearing-block.glb
│      bearing-block.json
│      gearbox.glb
│      gearbox.json
│
├── hdr/
│      studio.hdr
│
├── thumbnails/
│
├── js/
│      viewer.js
│      gallery.js
│      dimensions.js
│      camera.js
│
└── css/
       style.css
```

---

# Example metadata

`bearing-block.json`

```json
{
    "title": "Bearing Block",

    "description": "Split pillow block for 6204 bearing.",

    "model": "models/bearing-block.glb",

    "camera": {
        "position": [2.4,1.8,2.1],
        "target": [0,0,0]
    },

    "features":[

        {
            "name":"Bearing Bore",
            "type":"diameter",

            "value":"Ø20 mm",

            "center":[0,0,0],

            "camera":[0.8,0.2,0.6],

            "highlight":[
                "Cylinder001"
            ]
        },

        {
            "name":"Mounting Hole",

            "type":"diameter",

            "value":"Ø8 mm",

            "center":[0.6,-0.3,0],

            "camera":[1.1,-0.2,0.5],

            "highlight":[
                "Hole02"
            ]
        },

        {
            "name":"Fillet",

            "type":"radius",

            "value":"R3",

            "center":[0.15,0.4,0.2],

            "camera":[0.5,0.5,0.5],

            "highlight":[
                "Fillet07"
            ]
        }
    ]
}
```

Notice there are **no dimensions baked into the mesh**.

Everything lives in JSON.

---

# Viewer

```javascript
import * as THREE from "three";

import {GLTFLoader}
from "three/examples/jsm/loaders/GLTFLoader.js";

const scene=new THREE.Scene();

const camera=new THREE.PerspectiveCamera(
45,
window.innerWidth/window.innerHeight,
0.1,
100
);

camera.position.set(3,2,3);

const renderer=new THREE.WebGLRenderer({
antialias:true
});

renderer.setSize(
window.innerWidth,
window.innerHeight
);

renderer.shadowMap.enabled=true;

document.body.appendChild(renderer.domElement);
```

---

# HDR Lighting

```javascript
import {RGBELoader}
from "three/examples/jsm/loaders/RGBELoader.js";

const pmrem=new THREE.PMREMGenerator(renderer);

new RGBELoader()

.load("hdr/studio.hdr",(hdr)=>{

scene.environment=

pmrem.fromEquirectangular(hdr).texture;

});
```

That single block makes the model look dramatically better.

---

# Load Model

```javascript
const loader=new GLTFLoader();

loader.load(

metadata.model,

(gltf)=>{

scene.add(gltf.scene);

});
```

---

# Orbit Controls

```javascript
import {OrbitControls}

from "three/examples/jsm/controls/OrbitControls.js";

const controls=

new OrbitControls(

camera,

renderer.domElement

);

controls.enableDamping=true;
```

---

# Animate

```javascript
function animate(){

requestAnimationFrame(animate);

controls.update();

renderer.render(scene,camera);

}

animate();
```

---

# Feature List

```html
<div id="sidebar">

</div>
```

```javascript
const sidebar=document.getElementById("sidebar");

metadata.features.forEach(feature=>{

const button=document.createElement("button");

button.innerText=

feature.name;

button.onclick=()=>{

focusFeature(feature);

};

sidebar.appendChild(button);

});
```

---

# Camera Animation

```javascript
function focusFeature(feature){

camera.position.set(

...feature.camera

);

controls.target.set(

...feature.center

);

}
```

Normally you'd animate this with GSAP:

```javascript
gsap.to(camera.position,{
    duration:1.5,
    x:feature.camera[0],
    y:feature.camera[1],
    z:feature.camera[2]
});
```

The result feels much more professional.

---

# Highlight Geometry

When exporting from Blender or FreeCAD, ensure parts have stable names.

```javascript
const mesh=

scene.getObjectByName(

feature.highlight[0]

);

mesh.material=

highlightMaterial;
```

You can also pulse the emissive color.

---

# Hotspots

```html
<div class="hotspot">

Ø20

</div>
```

Every frame

```javascript
const pos=new THREE.Vector3(
...feature.center
);

pos.project(camera);

hotspot.style.left=

((pos.x*.5+.5)*window.innerWidth)+"px";

hotspot.style.top=

((-pos.y*.5+.5)*window.innerHeight)+"px";
```

Now the label follows the model.

---

# Dimension Overlay

Rather than drawing lines in WebGL, draw them in SVG.

```html
<svg>

<line>

<text>

</svg>
```

Advantages:

* crisp at every zoom
* easy styling
* printable
* animated
* no z-fighting

Professional CAD viewers often use a mix of WebGL for the model and SVG or HTML overlays for annotations.

---

# Search

```javascript
const results=

metadata.features.filter(f=>

f.name

.toLowerCase()

.includes(searchText)

);
```

Selecting a search result jumps directly to the feature.

---

## Future enhancements

Once the basics are in place, you can layer on features without changing the overall architecture:

* **Exploded views**: Store an `explodeOffset` vector per part and animate between assembled and exploded states.
* **Section cuts**: Use Three.js clipping planes to let users inspect internal geometry.
* **Measurement mode**: Let users click two points to create temporary dimensions while still showing your authored annotations.
* **Assembly tree**: Populate a sidebar from the GLB scene graph so users can isolate or hide components.
* **Revision comparisons**: Load two models and toggle visibility or highlight changed parts.
* **Parametric data**: Read spreadsheet values exported from FreeCAD and display design parameters alongside geometric measurements.
* **Markdown notes**: Allow each feature to include rich documentation, formulas, images, or manufacturing guidance.

## If I were building this today

I'd use:

* **Vite** for the project scaffold.
* **Three.js** for rendering.
* **React Three Fiber** for scene management (it keeps the codebase much cleaner as the project grows).
* **GSAP** for camera and annotation animations.
* **Tailwind CSS** for the UI.
* **GLTF + Meshopt compression** for efficient model delivery.
* A **JSON schema** describing models, features, dimensions, hotspots, camera bookmarks, and downloads.

That combination gives you something that scales from a dozen parts to hundreds without becoming difficult to maintain, and it supports exactly the kind of interactive engineering documentation you're envisioning.
