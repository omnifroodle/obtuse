

$(".witticism").fitText();

var $random = $(".random-witticism");


if ($random.length) {
  console.log("random");
}



function createWitticism(){
  $.post("/witticisms.json", {"witticism": {"quote": quote}}).done(function(data){
    $(".save_button").text("Saved!").addClass("active");
  });
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
