$(function(){
	
	$(".goDetail").on("click", function(){
		//let boardNumber = $(this).parents("tr").attr("data-num");
		//console.log("글번호 : " + boardNumber);
		//location.href = "/board/boardDetail?boardNumber=" +boardNumber;
		let adoptionId = $(this).parents("tr").attr("data-num");
		$("#adoptionId").val(adoptionId);
		$("#detailForm").attr({
			"method":"get",
			"action":"/adoption/adoptionDetail"
		});
		$("#detailForm").submit();
	});

	
	$("#adoptionListBtn").click(function(){
		location.href="/adoption/adoptionList";
	});
	
	
	$("#insertFormBtn").on("click", ()=>{
		location.href = "/adoption/writeForm";
	});
	
	
	//
	$("#keyword").bind("keydown", function(event){
		if(event.keyCode == 13) {
			event.preventDefault();
		}
	});
	
	//검색 대상이 변경 될 때마다 처리 이벤트
	$("#search").on("change", function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	
	//검색 버튼 클릭시 처리 이벤트
	$("#searchData").on("click", function(){
		if($("#search").val()!="all"){
			if(!chkData("#keyword","검색어를 "))return;
		}
		goPage();
	});
	
	/*페이징 처리 이벤트*/
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	});
});



//검색을 위한 실질적인 처리 함수
function goPage(){
	if($("#search").val()=="all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/adoption/adoptionList"
	});
	$("#f_search").submit();
}

