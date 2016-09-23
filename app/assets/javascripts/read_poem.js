// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
/* global $ */
$(function () {
  const interval = 500;
  let timer;

  $('.read_poem_btn').click(function(e){
    const poemId = $(e.target).data('poem-id');

    $.ajax({
      url: `/api/poems/${ poemId }/read_poems`,
      method: 'post'
    });

    if (timer !== undefined) clearTimeout(timer);

    timer = setTimeout(() => {
      location.reload();
    }, interval);
  });
});
