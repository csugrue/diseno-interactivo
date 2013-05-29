 function bindJavascript(){
   
   var pjs = Processing.getInstanceById(getProcessingSketchId());
   
   if( pjs == undefined){
     setTimeout(bindJavascript, 20);
   }else{
     pjs.bindJS(this);
   }
      
 }
 
window.onload = function () {
  bindJavascript();
}

function setText( text ) {
     
     document.getElementById('text').innerHTML = text;
} 

 

