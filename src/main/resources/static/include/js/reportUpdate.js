$(function(){
	const userId = document.getElementById("userId").value;
	
	$("#fbReportUpdateBtn").on("click", () => {	
		$("#f_data").attr({
			"method": "post",
			"action": "/report/reportModify"
		});
		$("#f_data").submit();
	});

	$("#fbReportCancelBtn").on("click", () => {	
		$("#f_data").attr({
			"method": "post",
			"action": "/report/reportDelete"
		});
		$("#f_data").submit();
	});
	
	$(document).on("click", ".fcDetailBtn", function(event) {
        event.preventDefault(); // Prevent the default action of clicking the button
		var fcommentId = $(this).parents("div .card").attr("data-num");
		$(".fcommentId").val(fcommentId);
    	
		$.ajax({
			method:"get",
			url:"/fcomment/fcommentDetail",
            data: $('#detailForm').serialize(),
		    success: function(detail) {
                $("input[name='fcommentId']").val(detail.fcommentId);
                $("input[name='boardUser']").val(detail.userId);
                $("input[name='reUserId']").val(detail.reUserId);
                
		    },
		    error: function(error) {
		        // 에러 처리
		        console.error('에러:', error);
		    }
		});
	});


	$(document).on("click", ".vcDetailBtn", function(event) {
        event.preventDefault(); // Prevent the default action of clicking the button
		var vfcommentId = $(this).parents("div .card").attr("data-num");
		$(".vfcommentId").val(vfcommentId);
    	
		$.ajax({
			method:"get",
			url:"/vfcomment/vfcommentDetail",
            data: $('#detailForm').serialize(),
		    success: function(detail) {
                $("input[name='vfcommentId']").val(detail.vfcommentId);
                $("input[name='boardUser']").val(detail.userId);
                $("input[name='reUserId']").val(detail.reUserId);
                
		    },
		    error: function(error) {
		        // 에러 처리
		        console.error('에러:', error);
		    }
		});
	});


	$(document).on("click", ".acDetailBtn", function(event) {
        event.preventDefault(); // Prevent the default action of clicking the button
		var afcommentId = $(this).parents("div .card").attr("data-num");
		$(".afcommentId").val(afcommentId);
    	
		$.ajax({
			method:"get",
			url:"/afcomment/afcommentDetail",
            data: $('#detailForm').serialize(),
		    success: function(detail) {
                $("input[name='afcommentId']").val(detail.afcommentId);
                $("input[name='boardUser']").val(detail.userId);
                $("input[name='reUserId']").val(detail.reUserId);
                
		    },
		    error: function(error) {
		        // 에러 처리
		        console.error('에러:', error);
		    }
		});
	});

})