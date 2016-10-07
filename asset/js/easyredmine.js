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

		console.log(comentario_issue_id);
		var salida = $("#comentario-" + comentario_issue_id).find(".note-wrapper");

		if ( salida.length < 1 ){
			var smart_redmine_api_url =  window.location.protocol + "//" + window.location.host +  "/issues/" + comentario_issue_id +'/journals';
			console.log(smart_redmine_api_url);
			$.getJSON( smart_redmine_api_url, function(data){
				/*
				//TODO: como se comprueba que recupera información
				$.each( data, function (key, val){
					//id, name, notes, created_on
					console.log(val.id)
						$('#comentario-' + comentario_issue_id +  ' > .comentario-notes').append('<div class="note-wrapper"> <span>' + val.name + '</span> <time datetime="">' + val.created_on + '</time><span>' + val.notes + '</span></div>');
				});
				*/
			})
			.done(function(data){
				if ( $.isEmptyObject (data)) {
					$('#comentario-' + comentario_issue_id +  ' > .comentario-notes').append('<div class="note-wrapper"> <div class="no-comments"> No se han encontrado comentarios en este ticket </div></div>');
					return;
				}
				console.log(data);
				$.each( data, function (key, val){
					//id, name, notes, created_on
					console.log(val.id)
						$('#comentario-' + comentario_issue_id +  ' > .comentario-notes').append('<div class="note-wrapper"> <strong>' + val.name + '</strong> <time datetime="">' + val.created_on + '</time><blockquote>' + val.notes + '</blockquote></div>');
				});
			})
			.fail(function(data){
			});

			;
		}


		$(".comentario-block").hide( "slow" );
		var comentario_id = 'comentario-' + comentario_issue_id;
		$("#" + comentario_id).fadeToggle("slow", "linear");

	});

});

$(document).ready(function(){
	// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	$('.modal-trigger').leanModal({
		starting_top: '5%', // Starting top style attribute
		ending_top: '5%', // Ending top style attribute


	});
});
