 function bindJavascript(){
   
   var pjs = Processing.getInstanceById(getProcessingSketchId());
   
   if( pjs == undefined){
     setTimeout(bindJavascript, 20);
   }else{
     if(pjs.image == undefined) setTimeout(bindJavascript, 20);
     else pjs.bindJS(this);
   }
      
 }
 
window.onload = function () {
  bindJavascript();
}

function setColor( rr, gg, bb ) {
     
     var colorString = 'rgb('+rr+','+gg+','+bb+')';
     
     document.body.style.backgroundColor = colorString;
     
     var h1s = document.getElementsByTagName("h1");
     if ( h1s != undefined && h1s.length > 0 )
     {
         h1s[0].innerHTML = "Color is: " + colorString;
     }
} 

 

