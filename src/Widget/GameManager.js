//Degree
var VELLOCITY = 10;

var CANVAS_ID = "svgContainer";
var CANVAS_HEIGHT = 500;
var CANVAS_WIDTH = 800;

var MARIO_SIZE = 25;
var UPWARD_FORCE = 10;
var SecondsToRenderFrame = 50; // in milli



exports.resetCubeTo = function(cube) {
  return function(param) {
    return function(value) {
      return function() {
          window.global.cube=cube;
      }
    }
  }
}



var setUpCanvas = function (){

    if (!window.global) {
      window.global = {};
    }
    if (!window.global.draw) {
      window.global.draw= SVG(CANVAS_ID).size(CANVAS_WIDTH, CANVAS_HEIGHT);    
    }

    if (!window.global.cube) {
      window.global.cube = {}  
      window.global.cube = {
        cX : 100,
        cY : 100,
      }  

      window.global.ground = {
        cX : CANVAS_WIDTH/2 ,
        cY : CANVAS_HEIGHT - 50 ,
        width : CANVAS_WIDTH,
        height : 100
      }

    }

    if (!window.global.cubeSVG) {
      window.global.cubeSVG=g_draw()
      g_update()    
    }
}


var g_updateAirPosition = function () {
 if(this.isInAir) {
    var timeSinceJump = new Date().getTime()-this.startTime;
    timeSinceJump/=100
    var newPos = getDisplacementWithTime(UPWARD_FORCE,timeSinceJump);
    if(newPos<=0){
      this.isInAir=false;
      newPos=0
    }

    window.global.cube.cY= this.initPosition - newPos * 10;
  }
}



var getDisplacementWithTime = function (u,t) { 
  return  u * t - 0.5 * 10 * t * t
}


var modifyMarioPosition = function (paramToModify){
    var incValue = VELLOCITY;
    if(paramToModify === 'buttonYMinus'){ 
        this.isInAir = false;
        this.initPosition = window.global.cube.cY
    }  
    else if(paramToModify === 'buttonYPlus'){
      if(!this.isInAir){
        this.isInAir=true;
        this.startTime = new Date().getTime();
        this.initPosition = window.global.cube.cY
      }
    }
    else if(paramToModify === 'buttonXMinus'){
      window.global.cube.cX -= incValue; 
    }else if(paramToModify === 'buttonXPlus'){
      window.global.cube.cX += incValue; 
    }
      
}


var g_update = function () {
  g_updateAirPosition() 
  g_draw()
  this.setTimeout(g_update,SecondsToRenderFrame);
}

var g_draw = function (cubeParams){
      drawGround({});

      var myCube = cubeParams || window.global.cube || {cX : 60, cY : 60}  
      if(window.global.cubeSVG)
        window.global.cubeSVG.remove()

      window.global.cubeSVG = window.global.draw.rect(MARIO_SIZE,MARIO_SIZE)
        .fill('#f06')
        .move(myCube.cX-MARIO_SIZE/2,myCube.cY-MARIO_SIZE/2);
      
      return window.global.cubeSVG; 
}  


exports.attachMyOnClick = function(id) {
  return function(sub) {
    if (typeof window.SUBS[id] == "undefined") {
      window.SUBS[id]={}        
    } 
    window.SUBS[id].fn = function(value, props) {
      sub(value)();
    }
    return null;
  }
}

exports.rotationButtonClick = function(e) {
  setUpCanvas()
}


var drawGround = function(props) {
  var myGround = window.global.ground;
   window.global.draw.rect(myGround.width,myGround.height).move(myGround.cX - myGround.width/2 ,myGround.cY - myGround.height/2 ).fill("#00ff00");
}



exports.attachMyOnKeyDown = function(sub) {
    setUpCanvas()

     if (!window.MAP) {
      window.MAP = {};
    }
    var id = "document"

    if (typeof window.MAP[id] == "undefined") {
        window.MAP[id]={}
        
    } 
    
    if (typeof window.SUBS[id] == "undefined") {
      window.SUBS[id]={}        
    }


    var cb = function(e, props) {
        var key = e.keyCode ? e.keyCode : e.which;
        if(key==37 || key==38 || key==39 || key==40){
          var param
          switch (key) {
            case 39 : param = "buttonXPlus"; break;
            case 37 : param = "buttonXMinus"; break; 
            case 38 : param = "buttonYPlus"; break; 
            case 40 : param = "buttonYMinus"; break;
          }
          modifyMarioPosition(param);
        sub(e)();
      }
      return null;
    }
    window.SUBS[id].fn = cb
    document.onkeydown = cb;
}