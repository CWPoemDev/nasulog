// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function () {
  const interval = 500;
  let timer;

  $('.read_poem_btn').click(function(e){
    const poem_id = $(e.target).data('poem-id');

    $.ajax({
      url: `/api/poems/${ poem_id }/read_poems`,
      method: "post"
    });

    if (timer !== undefined) clearTimeout(timer);
    
    timer = setTimeout(function() {
      location.reload();
    }, interval);
  });
})
