$(function(){
/*	const userId = document.getElementById("userId").value;
*/
	$("#fbReportInsertBtn").on("click", () => {	
		$("#f_data").attr({
			"method": "post",
			"action": "/report/reportInsertFB"
		});
		$("#f_data").submit();
	});
	
	$("#vbReportInsertBtn").on("click", () => {
		$("#f_data").attr({
			"method": "post",
			"action": "/report/reportInsertVB"
		});
		$("#f_data").submit();
	});
	
	$("#abReportInsertBtn").on("click", () => {
		$("#f_data").attr({
			"method": "post",
			"action": "/report/reportInsertAB"
		});
		$("#f_data").submit();
	});
	
	$("#fcReportInsertBtn").on("click", () => {
		$("#fc_data").attr({
			"method": "post",
			"action": "/report/reportInsertFC"
		});
		$("#fc_data").submit();
	});
	
	$("#vfcReportInsertBtn").on("click", () => {
		$("#fc_data").attr({
			"method": "post",
			"action": "/report/reportInsertVC"
		});
		$("#fc_data").submit();
	});
	
	$("#afcReportInsertBtn").on("click", () => {
		$("#fc_data").attr({
			"method": "post",
			"action": "/report/reportInsertAC"
		});
		$("#fc_data").submit();
	});

	
});