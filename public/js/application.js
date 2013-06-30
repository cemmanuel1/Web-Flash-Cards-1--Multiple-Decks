$(document).ready(function() {

	$('guess').on('click',function(event) {
		$('QA').slideUp(1000);
	});
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#exit').on('click',function(event){
    event.preventDefault();
    window.location = "/round/" + $(this).attr('data-id') + "/results";
  });

  $('#home').on('click',function(){
    window.location = "/";
  });

  $('.reveal_answer').on('click',function(){
    $(this).closest('.is_correct').find('.correct_answer').fadeIn();
    $(this).closest('.is_correct').find('.incorrect').fadeOut();
    $(this).remove();
  });
});
