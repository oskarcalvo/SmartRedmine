$(document).ready(function () {

	$(".saveissue").click(function () {

		//console.log($(this));
  	//var issue = $(this).attr("#data-issue");
  	var issue = $(this).attr('data-id');

  	console.log( issue );


  	//alert("Handler for .click() called." + issue);

  });
});

$(document).ready(function () {


	$('textarea').each(function() {
		var simplemde = new SimpleMDE({
			autofocus: true,
			toolbar: ["bold", "italic", "heading", "|", "quote","code", "|", "unordered-list","ordered-list","table"],
			element: this,
			showIcons: ["code", "table"],
			spellChecker: false
		});
   	simplemde.render();
	})

});


$(document).ready(function(){

	$('.issue_start_date').pickadate({
		firstDay: 1,
		formatSubmit: 'yyyy-mm-dd',
		format: 'yyyy-mm-dd',
	});
	$('.issue_due_date').pickadate({
		firstDay: 1,
		formatSubmit: 'yyyy-mm-dd',
		format: 'yyyy-mm-dd',
	});

});

$(document).ready(function() {
	$('select').material_select();
});


	$(document).ready(function(){

		// Initialize collapse button
	  $(".button-collapse").sideNav();
	  // Initialize collapsible (uncomment the line below if you use the dropdown variation)
	  //$('.collapsible').collapsible();

	});


$(document).ready(function(){
	$(".comentario-link").click(function(){
		var comentario_issue_id = $(this).attr('data-id');
		$(".comentario-block").hide( "slow" );
		var comentario_id = 'comentario-' + comentario_issue_id;
		$("#" + comentario_id).fadeToggle("slow", "linear");

	});

});
