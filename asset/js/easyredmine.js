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
	var simplemde = new SimpleMDE({
		autofocus: true,
		toolbar: ["bold", "italic", "heading", "|", "quote","code", "|", "unordered-list","ordered-list","table"],
		element: document.getElementById("textarea_notes"),
		showIcons: ["code", "table"],
		spellChecker: false
	});


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
	 // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	 $('.modal-trigger').leanModal();
 });
