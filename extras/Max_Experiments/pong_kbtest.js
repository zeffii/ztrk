inlets = 2;

autowatch = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ----------------------------------------------------
// PONG
// ----------------------------------------------------

var W = 640;
var H = 360;

var paddleW = 12;
var paddleH = 80;
var paddleMargin = 25;

var playerY = H / 2 - paddleH / 2;
var playerSpeed = 7;

var p2Y = H / 2 - paddleH / 2;
var p2Amplitude = 110;
var p2Speed = 0.055;
var p2Phase = 0;

var ballX = W / 2;
var ballY = H / 2;
var ballSize = 10;

var ballVX = 5;
var ballVY = 2.5;

var score1 = 0;
var score2 = 0;

var up = false;
var down = false;

var running = true;


// ----------------------------------------------------
// INIT
// ----------------------------------------------------

function loadbang()
{
    reset();
}

function reset()
{
    playerY = H / 2 - paddleH / 2;

    p2Phase = 0;
    p2Y = H / 2 - paddleH / 2;

    ballX = W / 2;
    ballY = H / 2;

    ballVX = 5;
    ballVY = 2.5;

    score1 = 0;
    score2 = 0;

    running = true;

    mgraphics.redraw();
}


// ----------------------------------------------------
// RESIZE
// ----------------------------------------------------

function onresize(w, h)
{
    W = w;
    H = h;

    playerY = clamp(playerY, 0, H - paddleH);
    p2Y = clamp(p2Y, 0, H - paddleH);

    mgraphics.redraw();
}


// ----------------------------------------------------
// GAME TICK
//
// Every paint() call advances the game one frame.
// ----------------------------------------------------

function paint()
{
    // Background
    mgraphics.set_source_rgb(0.02, 0.02, 0.025);
    mgraphics.rectangle(0, 0, W, H);
    mgraphics.fill();

    if (running)
        update();

    draw();

    // Ask Max to redraw again only if YOU are
    // triggering paint externally.
}


// ----------------------------------------------------
// UPDATE
// ----------------------------------------------------

function update()
{
    // Player 1
    if (up)     playerY -= playerSpeed;
    if (down)   playerY += playerSpeed;
    playerY = clamp(playerY, 0, H - paddleH);

    // Player 2 = sine wave
    p2Phase += p2Speed;
    var centre = (H - paddleH) / 2;
    p2Y = centre + Math.sin(p2Phase) * p2Amplitude;
    p2Y = clamp(p2Y, 0, H - paddleH);

    // Ball
    ballX += ballVX;
    ballY += ballVY;

    // Top / bottom walls
    if (ballY <= 0) {
        ballY = 0;
        ballVY *= -1;
    }

    if (ballY + ballSize >= H) {
        ballY = H - ballSize;
        ballVY *= -1;
    }

    // Player 1 collision
    var p1X = paddleMargin;

    if (
        ballX <= p1X + paddleW &&
        ballX + ballSize >= p1X &&
        ballY + ballSize >= playerY &&
        ballY <= playerY + paddleH &&
        ballVX < 0
    )
    {
        ballX = p1X + paddleW;
        ballVX *= -1;

        // Add some vertical angle based on where
        // the ball hits the paddle.
        var hit = (ballY + ballSize / 2) - (playerY + paddleH / 2);

        ballVY = hit * 0.12;
    }


    // Player 2 collision
    var p2X = W - paddleMargin - paddleW;

    if (
        ballX + ballSize >= p2X &&
        ballX <= p2X + paddleW &&
        ballY + ballSize >= p2Y &&
        ballY <= p2Y + paddleH &&
        ballVX > 0
    )
    {
        ballX = p2X - ballSize;
        ballVX *= -1;
        var hit2 = (ballY + ballSize / 2) - (p2Y + paddleH / 2);
        ballVY = hit2 * 0.12;
    }

    // Player 2 scores
    if (ballX < -ballSize) {
        score2++;
        resetBall(-1);
    }

    // Player 1 scores
    if (ballX > W + ballSize) {
        score1++;
        resetBall(1);
    }
}


// ----------------------------------------------------
// BALL RESET
// ----------------------------------------------------

function resetBall(direction){
    ballX = W / 2;
    ballY = H / 2;
    ballVX = 5 * direction;
    ballVY = (Math.random() * 4) - 2;
}


// ----------------------------------------------------
// DRAW
// ----------------------------------------------------

function draw(){
    // Centre line
    mgraphics.set_source_rgba(1, 1, 1, 0.15);

    for (var y = 0; y < H; y += 24)    {
        mgraphics.rectangle(W / 2 - 1, y, 2, 12);
        mgraphics.fill();
    }

    // Player 1
    mgraphics.set_source_rgb(1, 1, 1);
    mgraphics.rectangle(paddleMargin, playerY, paddleW, paddleH);
    mgraphics.fill();

    // Player 2
    mgraphics.rectangle(W - paddleMargin - paddleW, p2Y, paddleW, paddleH);
    mgraphics.fill();

    // Ball
    mgraphics.rectangle(ballX, ballY, ballSize, ballSize);
    mgraphics.fill();

    // Score
    drawText(String(score1), W * 0.25, 50, 32);
    drawText(String(score2), W * 0.75, 50, 32);
}


// ----------------------------------------------------
// TEXT
// ----------------------------------------------------

function drawText(text, x, y, size){
    mgraphics.select_font_face("Arial", "normal", "normal");
    mgraphics.set_font_size(size);
    mgraphics.set_source_rgba(1, 1, 1, 0.8);
    mgraphics.move_to(x, y);
    mgraphics.show_text(text);
}


// ----------------------------------------------------
// KEYBOARD
// ----------------------------------------------------

function keydown(key){
    // W
    if (key == 119 || key == 87)
        up = true;

    // S
    if (key == 115 || key == 83)
        down = true;

    // Arrow up
    if (key == 38)
        up = true;

    // Arrow down
    if (key == 40)
        down = true;

    // Space = pause
    if (key == 32)
        running = !running;

    // R = reset
    if (key == 114 || key == 82)
        reset();
}


function keyup(key)
{
    if (key == 119 || key == 87 || key == 38)    up = false;
    if (key == 115 || key == 83 || key == 40)    down = false;
}


// ----------------------------------------------------
// MAX MESSAGES
// ----------------------------------------------------

function start(){   running = true;}
function stop(){    running = false;}
function pause(){   running = false;}
function bang(){    mgraphics.redraw();}
function tick(){    mgraphics.redraw();}


function clamp(v, min, max){   return Math.max(min, Math.min(max, v));}