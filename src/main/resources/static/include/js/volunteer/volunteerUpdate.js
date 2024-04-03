$(function() {
	/* 제출 버튼 클릭 시 처리 이벤트 */
	$("#updateBtn").on("click", function() {
		if(!chkData("#volunteerTitle", "제목을")) return;
		else if(!chkData("#volunteerTime", "활동 기간을")) return;
		else if(!chkData("#volunteerDue", "마감 기한을")) return;
		else if(!chkData("#volunteerLimit", "제한 인원을")) return;
		else if(!chkData("#volunteerLocation", "활동 장소를")) return;
		else if(!chkData("#volunteerDetail", "세부사항을")) return;
		
		else {
			if($("#file").val() != "") {
				if(!chkFile($("#file"))) return;
			}
            
			$("#updateForm").attr({
				method : "post",
				enctype : "multipart/form-data",
				action : "/volunteer/volunteerUpdate"
			});
			$("#updateForm").submit();
		}
	})
})

