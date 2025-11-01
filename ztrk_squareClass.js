// ztrk_squareClass.js

function Square(rect){
	this.topLeft = [rect[0], rect[1]];
	this.width = rect[2];
	this.height = rect[3];
	this.isClicked = false;

	this.GetRect = function(){
		return [this.topLeft[0], this.topLeft[1], this.width, this.height];
	}
	this.SetWidthHeight = function(width, height){
        this.width = width;
        this.height = height;
	}
	this.CheckIfIsClicked = function (mX, mY) {
		if (mX > this.topLeft[0] && mX < this.topLeft[0] + this.width &&
			mY > this.topLeft[1] && mY < this.topLeft[1] + this.height){
			this.isClicked = true;
		    return true;
		}
		else{
			this.isClicked = false;
			return false;
		}
	}
	this.ResetIsClicked = function(){ this.isClicked = false; }
}