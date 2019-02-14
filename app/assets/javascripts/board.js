document.addEventListener("turbolinks:load", function(){

class whiteboardObject {

	constructor(canvas) {
		this.down = false; //Class Variable to track is mouse is down
		this.canvas = canvas;
		canvas.width = window.innerWidth; //set the Canvas width and Height
		canvas.height = window.innerHeight;
		this.context = this.canvas.getContext("2d");
		this.canvas.addEventListener("mousedown", function(e){
			whiteboard.down = true; //set the class variable to down
		});
		this.xPrev = null;
		this.yPrev = null;
		this.canvas.addEventListener("mousemove", function(e){ //Mouse moved
			if(whiteboard.down) { //If mouse is down
				if(whiteboard.xPrev == null && whiteboard.yPrev == null) { //If the start of a new line
					whiteboard.draw(e.x,e.y,e.x,e.y);
				}
				else { // If the line has already started
					whiteboard.draw(whiteboard.xPrev,whiteboard.yPrev,e.x,e.y);
				}
				whiteboard.xPrev = e.x; //set the previous position
				whiteboard.yPrev = e.y;
		}
		});
		this.canvas.addEventListener('mouseup',function(e){
			whiteboard.down = false; //set the class variable to not down
			whiteboard.xPrev = null;  //reset the previous positions of the line
			whiteboard.yPrev = null;
		});
		this.tool = new marker(5,"blue"); //default marker tool of  size and blue color
		this.context.strokeStyle = this.tool.color;
		this.context.lineWidth = this.tool.size*2;
		this.context.fillStyle = this.tool.color;
	}

	setTool(tool) {
		this.tool = tool;
		this.context.strokeStyle = this.tool.color;
		this.context.lineWidth = this.tool.size*2;
		this.context.fillStyle = this.tool.color;
		if(tool.highlighter) {
			this.context.globalCompositeOperation = "multiply";
		}
		else {
			this.context.globalCompositeOperation = "source-over";
		}
	}

	draw(xPrev,yPrev,xPos,yPos) {
		this.context.strokeStyle = this.tool.color;
		this.context.lineWidth = this.tool.size*2;
		this.context.fillStyle = this.tool.color;
		this.context.beginPath();
    	this.context.arc(xPrev, yPrev, this.tool.size, 0, 2 * Math.PI);
    	this.context.fill();
		this.context.beginPath();
		this.context.moveTo(xPrev,yPrev);
		this.context.lineTo(xPos,yPos);
		this.context.stroke();
	}

}

class tool {
	constructor(size,color) {
		this.size = size;
		this.color = color;
	}
	
}

class marker extends tool {
	constructor(size,color) {
		super(size,color);
		this.highlighter = false;
	}
}

class highlighter extends tool {
	constructor(size,color) {
		super(size,color);
		this.highlighter = true;
	}
}


t = document.getElementById("board");
if(t) {
	var whiteboard = new whiteboardObject(t);
}


document.addEventListener('keydown', function(event) {
    if(event.keyCode == 49) {
    	whiteboard.setTool(new marker(5,"blue"));
		var tag = document.getElementById('tag');
		tag.innerHTML = "Size: "+whiteboard.tool.size;
    }
    else if(event.keyCode == 50) {
        whiteboard.setTool(new highlighter(20,"yellow"));
		var tag = document.getElementById('tag');
		tag.innerHTML = "Size: "+whiteboard.tool.size;
    }
    else if(event.keyCode == 51) {
        whiteboard.setTool(new marker(100,"white"));
		
    }
	else if(event.keyCode == 187 || event.keyCode == 61) {
		whiteboard.setTool(new marker(whiteboard.tool.size+5,document.getElementById('Color').value));
		var tag = document.getElementById('tag');
		tag.innerHTML = "Size: "+whiteboard.tool.size;
    }
    else if(event.keyCode == 189 || event.keyCode == 173) {
    	if(whiteboard.tool.size >5) {
	        whiteboard.setTool(new marker(whiteboard.tool.size-5,document.getElementById('Color').value));
			var tag = document.getElementById('tag');
			tag.innerHTML = "Size: "+whiteboard.tool.size;
		}
	}
});

document.getElementById("Color").onchange = function() {
	whiteboard.setTool(new marker(whiteboard.tool.size+5,document.getElementById('Color').value));
	var tag = document.getElementById('tag');
	tag.innerHTML = "Size: "+whiteboard.tool.size;
}
});