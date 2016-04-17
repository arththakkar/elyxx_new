$(document).ready(function(){
function add_current_class(){
	// alert("Hi");
	var selector = '#primary-menu ul li';

	$(selector).on('click', function(){
	    $(selector).removeClass('active');
	    $(this).addClass('active');
	});
}
});
