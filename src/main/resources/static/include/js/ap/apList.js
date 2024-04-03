$(function(){
	
	$(".goDetail").on("click", function(){
		//let boardNumber = $(this).parents("tr").attr("data-num");
		//console.log("글번호 : " + boardNumber);
		//location.href = "/board/boardDetail?boardNumber=" +boardNumber;
		let animalId = $(this).parents("tr").attr("data-num");
		$("#animalId").val(animalId);
		$("#detailForm").attr({
			"method":"get",
			"action":"/ap/apDetail"
		});
		$("#detailForm").submit();
	});

});

