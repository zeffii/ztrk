
outlets = 3;
inlets = 4;

var mstr = `
<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="40" fill="blue" />
</svg>
`;

mgraphics.init()
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

function paint(){
	mgraphics.svg_render(mstr);

}