<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Button trigger modal -->
<button type="button" class="btn btn-primary button special" data-bs-toggle="modal"
	data-bs-target="#reportModal">신고</button>

<!-- Modal -->
<div class="modal fade text-start" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered ">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="reportModalLabel"><strong>신고하기</strong></h1>
       	 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				
				<form id="f_data">
					<input type="hidden" name="vfboardId" value="${volunteerFeedbackBoard.vfboardId}"/>
					<input type="hidden" name="boardUser" value="${volunteerFeedbackBoard.userId}"/>
					<input type="hidden" name="boardUser" value="${volunteerFeedbackBoard.reUserId}"/>
					<input type="hidden" name="userId" id="userId" value="${userLogin.userId}">
					<fieldset>
						<legend class="modal-title fs-6 my-3"><strong>신고 분류</strong></legend>
						<div>
							<input type="radio" id="priority-1" name="reportSort" value="1" checked>
							<label for="priority-1" class="text-black">욕설<br/><small class="text-secondary">(남의 인격을 무시하는 모욕적인 말을 하는 행위)</small></label>
						</div>
						<div>
							<input type="radio" id="priority-2" name="reportSort" value="2">
							<label for="priority-2" class="text-black">도배<br/><small class="text-secondary">(같은 내용의 게시물을 지나치게 많이 올리는 행위)</small></label>
						</div>
						<div>
							<input type="radio" id="priority-3" name="reportSort" value="3">
							<label for="priority-3" class="text-black">광고<br/><small class="text-secondary">(금전적 이익 등을 위해 홍보성 글을 쓰는 행위)</small></label>
						</div>
						<div>
							<input type="radio" id="priority-4" name="reportSort" value="4">
							<label for="priority-4" class="text-black">기타</label>
						</div>
					</fieldset>
					<fieldset>
						<legend class="modal-title fs-6 my-3"><strong>신고 내용</strong></legend>
						<textarea style="width: 100%; height: 10em; resize: none;" class="form-control" placeholder="신고 내용을 기입해 주세요" id="reportDetail" name="reportDetail"></textarea>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="vbReportInsertBtn" class="btn btn-primary button special">신고하기</button>
			</div>
		</div>
	</div>
</div>