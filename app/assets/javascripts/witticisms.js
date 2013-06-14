

$(".witticism").fitText();

var $random = $(".random-witticism");


if ($random.length) {
  console.log("random");
}



function createWitticism(){
  var foo = $("#hidden-dragon").text();
  $.post("/witticisms", {"witticism": {"quote": foo}});
}
