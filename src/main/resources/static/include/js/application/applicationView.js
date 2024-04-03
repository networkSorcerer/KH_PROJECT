$(function() {
	$(".cancelBtn").on("click", function() {
		var applicationId = $(this).parents("tr").attr("data-id");
		console.log(applicationId);
		$("#applicationId").val(applicationId);
		$("#f_data").attr({
			method:"post",
			action:"/application/applicationDelete"
		});
		$("#f_data").submit();
	})
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		$("#page").find("input[name='pageNum']").val($(this).attr("href"));
		actionProcess("#page", "get", "/application/applicationView");
	});
})

const actionProcess = function(form, method, action) {
	$(form).attr({
		"method":method,
		"action":action
	});
	$(form).submit();
}
