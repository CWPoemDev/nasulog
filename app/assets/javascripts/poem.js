// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

((function(){

  function setCallbackForBtnPost() {
    $("a#btn_read_poem").on("ajax:success", function(e, data, status, xhr) {
      $(this).parent().replaceWith($(data).find("a#btn_read_poem").parent());
      setCallbackForBtnPost();
    });
  }

  function setCallbackForBtnRemove() {
    $("a.btn_read_poem_icon").on("ajax:success", function(e, data, status, xhr) {
      $(this).remove();
    });
  }

  $(function(){
    setCallbackForBtnPost();
    setCallbackForBtnRemove();
  });

})());
