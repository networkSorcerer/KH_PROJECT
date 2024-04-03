$(function(){	
	
	let keyword = $("#keyword").val();
	let search = $("#search").val();
	
	 /*날짜 검색 화면 제어*/ 
	if(search != "user_date"){
		let now = new Date();
		$(".dateArea").hide();
		let start = getDateFormat(new Date(now.setMonth(now.getMonth()-1)));
		let end = getDateFormat(new Date());
		$("#startDate").val(start);
		$("#endDate").val(end);		
	}	else {
		$(".selectArea").hide();
	}

	
	/* 검색 대상이 변경될 때마다 처리 이벤트 */	
	// 모든 영역 숨기기
	$("#userSearch .selectActArea, #userSearch .selectVolcntArea, #userSearch .dateArea").hide();

	$("#u_search").on("change", function() {
	    let selectedOption = $(this).val();
	    console.log(selectedOption);
	    // 선택된 옵션에 따라 해당하는 영역 보이기
	    if (selectedOption === "userAct") {
	        $("#userSearch .selectActArea").show();
	        $("#userSearch .selectVolcntArea, #userSearch .dateArea").hide();
	    } /*else if (selectedOption === "user_volcnt") {
	        $("#userSearch .selectVolcntArea").show();
	        $("#userSearch .selectActArea, #userSearch .dateArea").hide();
	    }*/ else if (selectedOption === "userDate") {
	        $("#userSearch .dateArea").show();
	        $("#userSearch .selectActArea, #userSearch .selectVolcntArea").hide();
	    } else {
			$("#userSearch .selectActArea, #userSearch .selectVolcntArea, #userSearch .dateArea").hide();

		}
	});
	
	/*$("#user_act").on("change", function() {
		console.log("변경 이벤트");
		console.log($(this).val());		
	});		
	$("#user_volcnt").on("change", function() {
		console.log("변경 이벤트");
		console.log($(this).val());		
	});
	$(".dateArea").on("change", function() {
		console.log("변경 이벤트");
		console.log($("#startDate").val());	
		console.log($("#endDate").val());		
	});	*/
	
	/* 검색버튼 클릭시 처리 이벤트 */
	$("#searchBtn").on("click", function(e){
		if ($("#u_search").val() =="") {
			console.log("분류");
			return;
		} else if($("#u_search").val()!="userDate") {
			console.log("userDate 아님");
			$("#startDate").val("");
			$("#endDate").val("");
			
		} else {				
			if ($("#u_search").val()=="userAct") {
				console.log("userAct2");
				let keyword = $("#user_act").val();
				console.log("user_act : "+keyword);
			} /*else if ($("#u_search").val()=="user_volcnt") {
				console.log("조건3");
				let keyword = $("#user_volcnt").val();
				console.log("user_volcnt : "+keyword);
			}*/ else if ($("#u_search").val()=="userDate") {
				console.log("조건4");
				if(!chkData("#startDate","시작날짜를")) return; 	
				else if(!chkData("#endDate","종료날짜를")) return; 	
				else if($("#startDate").val()>$("#endDate").val()) {
					alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
					return; 	
				}
			} else {
				console.log("조건에 맞는게 없음");
				return;
			}
		}
		
		$("#pageNum").val(1);// 페이지 초기화		
		actionProcess("#searchForm", "get", "/user/userList");
		goPage();
	});
	
	
	$("#allSearchBtn").on("click", function(){
		locationProcess("/board/freeBoardList");
	});

	
	/* 페이징 처리 이벤트 : (24/03/18) actionProcess(); 대체 */
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		$("#searchForm").find("input[name='pageNum']").val($(this).attr("href"));
		actionProcess("#searchForm", "get", "/board/freeBoardList");
		$("#pageNum").find("input[name='pageNum']").val($(this).attr("href"));
		actionProcess("#pageNum", "get", "/board/freeBoardList");
	});

	
}); // $ 함수 종료문
/* 함수명: getDateFormat(날짜 데이터) 
 * 설명 : dataValue의 값을 년-월-일 형식(예시: 2018-01-01)으로 반환.*/
function getDateFormat(dataValue) {
	var year = dataValue.getFullYear();
	
	var month = dataValue.getMonth() + 1;
	month = (month<10) ? "0"+month : month;
 	
	var day = dataValue.getDate();
	day = (day<10) ? "0"+day : day;
 	
 	var result = year+"-"+month+"-"+day;
 	return result;
}

const actionProcess = function(form, method, action) {
	$(form).attr({
		"method":method,
		"action":action
	});
	$(form).submit();
}

const locationProcess = function(url) {
	location.href = url;
}