// ztrk_svg_diagram_conventions
// 
// Canvas: dark bg #1a1b1e
// Patcher frame: #25262a fill, #4a4c52 stroke, rounded 3px
// Boxes: #d8d8d8 fill, #333 stroke, rounded 3px, 24px tall, font 11px Menlo
// Dark/highlight boxes: #3a3a3e fill, #888 stroke (for message boxes with muid)
// Ports: #444 filled circles, r=3
//   - single inlet/outlet: at x=8 (small margin from left edge)
//   - multiple: leftmost at x=8, rightmost at x=(width-8), evenly spaced
// Inlets: on TOP edge (cy=0)
// Outlets: on BOTTOM edge (cy=height)
// Cables: bezier (M x1 y1 C cx1 cy1, cx2 cy2, x2 y2)
//   - message-rate: #b0b0b0, 1.2px
//   - control/rebind: #d0a050, 1.2px
//   - audio: 1.2px, same family
// Labels inside boxes: 11px Menlo, #1a1a1a on light boxes, #e0e0e0 on dark
// Subtitles/annotations: 11px, #7d7f86
// Titles: 13px, #c8c8ce, 600 weight
// Faint grid: #2a2c32, 0.5px, 40px spacing, optional
// Max canvas coordinates: +20,+40 for patcher frame inside the SVG