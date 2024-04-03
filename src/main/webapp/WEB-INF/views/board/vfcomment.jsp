<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="container">
		<div class="content">
			<form id="replyForm" name="replyForm">
				<div class="row mb-3">
					<label for="userId" class="col-sm-1 col-form-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" name="userId" id="userId" class="form-control"
							readonly value="${userLogin.userId}" />
					</div>
					<button type="button" id="replyInsertBtn"
						class="btn btn-primary col-sm-1 sendBtn mx-2 button alt small">저장</button>
				</div>
				<div class="row mb-3">
					<label for="vfcommentContent" class="col-sm-1 col-form-label">내용</label>
					<div class="col-sm-11">
						<textarea name="vfcommentContent" id="vfcommentContent"
							class="form-control" rows="3" style="resize:none;"></textarea>
					</div>
				</div>
			</form>
		</div>
		<form id="detailForm">
			<input type="hidden" class="vfcommentId" name="vfcommentId" value=""/>
			<input type="hidden" name="userId" value="${userLogin.userId}"/>
		</form>
		
		<!-- 댓글 목록 시작 -->
		<div id="commentList">
			<div class="card mb-2" id="item-template">
				<div class="card-header">
					<span class="name"></span> <span class="date"></span>
					<ul class="actions d-inline text-end">
						<li><button type="button" data-btn="upBtn"
							class="btn btn-primary btn-sm button alt small">수정하기</button></li>
						<li><button type="button" data-btn="delBtn"
							class="btn btn-primary btn-sm button alt small">삭제하기</button></li>
						<c:if test="${not empty userLogin}">
							<li class="vfcReportBtn">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary button special vcDetailBtn" data-bs-toggle="modal" data-bs-target="#vfcReportModal">신고</button>
							</li>							
						</c:if>
					</ul>
				</div>
				<div class="card-body">
					<p class="card-text"></p>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/report/vfcReportInsert.jsp"%>
		<!-- 댓글 목록 종료 -->
	</div>
	<script>
		$(function() {
			//기본 댓글 목록 불러오기
			let vfboardId = '${volunteerFeedbackBoard.vfboardId}';
			console.log(vfboardId)
			listAll(vfboardId);

			//글입력을 위한 Ajax 연동 처리
			$(document).on(
					"click",
					"#replyInsertBtn",
					function() {
						let insertUrl = "/vfcomment/vfcommentInsert";

						// JSON.stringify(): JavaScript 값이나 객체를 JSON 문자열로 변환
						let value = JSON.stringify({
							vfboardId : vfboardId,
							userId : $("#userId").val(),
							vfcommentContent : $("#vfcommentContent").val()
						});

						$.ajax({
							url : insertUrl, // 전송 url
							type : "post", // 전송 method 방식
							headers : {
								"Content-Type" : "application/json"
							},
							dataType : "text",
							data : value,
							error : function(xhr, textStatus, errorThrown) {
								alert("댓글을 작성하려면 로그인이 필요합니다.");
							},
							beforeSend : function() {
								if (!checkForm("#vfcommentContent", "댓글내용을"))
									return false;
							},
							success : function(result) {
								if (result == "SUCCESS") {
									alert("댓글 등록이 완료되었습니다.");
									dataReset();
									listAll(vfboardId);
								}
							}
						});

					});

		});

		//댓글 목록 보여주는 함수
		function listAll(vfboardId) {
			console.log(vfboardId)
			$(".vfcomment").detach(); //detach(): 선택한 요소를 DOM트리에서 삭제
			let url = "/vfcomment/all/" + vfboardId;
			$.getJSON(
					url,
					function(data) { //data = [{vfcommentId:1, userId:"홍길동"}, ...{}]
						$(data).each(
								function(index) {
									let vfcommentId = this.vfcommentId;
									let userId = this.userId;
									let vfcommentContent = this.vfcommentContent;
									let vfcommentDate = this.vfcommentDate;
									vfcommentContent = vfcommentContent.replace(
											/(\r\n|\r\|\n)/g, "<br/>");

									template(vfcommentId, userId,
											vfcommentContent, vfcommentDate);
									//$("#commentList").append(vfcommentId + userId + vfcommentContent + vfcommentDate + "<br/>");
									applyButtonVisibility();
									

								});
					}).fail(function() {
				console.log(vfboardId)
				alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		}

		function applyButtonVisibility() {
			$(".card").each(function() {
				let nameValue = $(this).find(".name").text(); //현재 댓글의 작성자 가져오기
				let upBtn = $(this).find("[data-btn='upBtn']"); //현재 댓글의 수정 버튼
				let delBtn = $(this).find("[data-btn='delBtn']"); //현재 댓글의 삭제 버튼

				if (nameValue === "${userLogin.userId}") {
					// 조건을 충족할 때 수행할 작업
					// 수정 버튼과 삭제 버튼 보이기
					upBtn.show(); //수정 버튼 보이기
					delBtn.show(); //삭제 버튼 보이기
				} else {
					//	조건을 충족하지 않을 때 수행할 작업
					// 수정 버튼과 삭제 버튼 숨기기
					upBtn.hide(); //수정 버튼 숨기기
					delBtn.hide(); //삭제 버튼 숨기기
				}
			});
		}

		/* 새로운 글을 화면에 추가하기 위한 함수*/
		function template(vfcommentId, userId, vfcommentContent, vfcommentDate) {
			let $div = $('#commentList');

			let $element = $('#item-template').clone().removeAttr('id');

			$element.attr("data-num", vfcommentId);
			$element.addClass("vfcomment");
			$element.find('.name').html(userId);
			$element.find('.card-header .date').html(" / " + vfcommentDate);
			$element.find('.card-body .card-text').html(vfcommentContent);

			$div.append($element);
		}

		function dataReset() {
			$("#replyForm").each(function() {
				this.reset();
			});

			$("#userId").prop("readonly", false);
			$("#replyForm button[type='button']").removeAttr("data-rnum");
			$("#replyForm button[type='button']").attr("id", "replyInsertBtn");
			$("#replyForm button[type='button'].sendBtn").html("저장");
			$("#replyForm button[type='button'].resetBtn").detach();

		}

		$(document).on("click", "button[data-btn='delBtn']", function() {
			let vfboardId = '${volunteerFeedbackBoard.vfboardId}';
			let vfcommentId = $(this).parents("div.card").attr("data-num");
			console.log(vfboardId);
			deleteBtn(vfboardId, vfcommentId);
		})

		$(document).on("click", "button[data-btn='upBtn']", function() {
			let card = $(this).parents("div.card");
			let vfcommentId = card.attr("data-num");
			console.log("rnum: " + vfcommentId);
			updateForm(vfcommentId, card);
			
		})

		function updateForm(vfcommentId, card) {
			$("#replyForm .resetBtn").detach();

			$("#userId").val(card.find(".card-header .name").html());
			$("#userId").prop("readonly", true);

			let content = card.find(".card-text").html();
			content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			$("#vfcommentContent").val(content);

			$("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
			$("#replyForm button[type='button']").attr("data-rnum", vfcommentId);
			$("#replyForm button[type='button']").html("수정");

			let resetButton = $("<button type='button' class='btn btn-primary col-sm-1 resetBtn button alt small'>");
			resetButton.html("취소");
			$("#replyForm .sendBtn").after(resetButton);
		}

		$(document).on("click", "button[data-btn='update']", function() {
			let card = $(this).parents("div.card")
			let vfcommentId = card.attr("data-num");
			updateForm(vfcommentId, card);
		});

		//수정하기 클릭시 동적으로 생성된 "취소" 버튼 이벤트 처리
		$(document).on("click", ".resetBtn", function() {
			dataReset();
		});

		//수정을 위한 Ajax 연동 처리
		$(document).on("click", "#replyUpdateBtn", function() {


			let vfcommentId = $(this).attr("data-rnum");
			$.ajax({
				url : '/vfcomment/' + vfcommentId,
				type : 'put',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					vfcommentContent : $("#vfcommentContent").val(),
				}),
				beforeSend : function() {
					if (!checkForm("#vfcommentContent", "댓글내용을"))
						return false;
				},
				success : function(result) {
					console.log("result: " + result);
					if (result == "SUCCESS") {
						alert("댓글 수정이 완료되었습니다.");
						dataReset();
						let vfboardId = '${volunteerFeedbackBoard.vfboardId}';
						listAll(vfboardId);
					}
				}
			})
		});

		function deleteBtn(vfboardId, vfcommentId) {
			if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
				$.ajax({
					url : '/vfcomment/' + vfcommentId,
					type : 'delete',
					headers : {
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					error : function(xhr, textStatus, errorThrown) {
						alert(textStatus + " (HTTP-" + xhr.status + " / "
								+ errorThrown + ")");
					},
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("댓글 삭제가 완료되었습니다.");
							listAll(vfboardId);
						}
					}
				});
			}
		}
	</script>
</body>
</html>