

$(".witticism").fitText();

var $random = $(".random-witticism");


if ($random.length) {
  console.log("random");
}



function createWitticism(){
  var foo = $("#hidden-dragon").text();
  $.post("/witticisms", {"witticism": {"quote": foo}});
  return false;
}

$(document).keydown(function(e){
    console.log(e.keyCode);
   if (e.keyCode == 83) {
     createWitticism();
    }else if(e.keyCode == 13){
     createWitticism();
    }else if(e.keyCode == 39){
      location.reload(true);
    }else if(e.keyCode == 40){
      createWitticism();
    }


});
