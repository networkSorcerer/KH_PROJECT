<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">신고 내용</h1>
	</div>
	<div class="container">		
		<form name="f_data" id="f_data">
			<input type="hidden" name="reportId" value="${detail.reportId}"/>
			<input type="hidden" name="boardUser" value="${detail.boardUser}"/>
			<input type="hidden" name="boardId" value="${detail.boardId}"/>
			<input type="hidden" name="repcnt" id="repcnt" value="${detail.repcnt}"/>
			
		</form>
		
		<div class="row text-center mb-2">
			<div>
				<table class="table table-boardered table-striped-columns table table-bordered">
					<thead>
						<tr>
							<td>신고번호</td>
							<td>${detail.reportId}</td>
							<td>제목</td>
							<td colspan="3">${detail.boardTitle}</td>
							<td>게시판 분류</td>
							<td id="boardSort">
								<c:choose>
									<c:when test="${detail.fboardId != 0}">
										자유게시판
									</c:when>
									<c:when test="${detail.vfboardId != 0}">
										봉사후기게시판
									</c:when>
									<c:when test="${detail.afboardId != 0}">
										입양후이야기
									</c:when>
									<c:when test="${detail.fcommentId != 0}">
										자유게시판 댓글
									</c:when>
									<c:when test="${detail.vfcommentId != 0}">
										봉사후기게시판 댓글
									</c:when>
									<c:when test="${detail.afcommentId != 0}">
										입양후이야기 댓글
									</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="col-2">신고분류</td>
							<td class="col-1">
								<c:choose>
									<c:when test="${detail.reportSort==1}">
										욕설
									</c:when>
									<c:when test="${detail.reportSort==2}">
										도배
									</c:when>
									<c:when test="${detail.reportSort==3}">
										광고
									</c:when>
									<c:when test="${detail.reportSort==4}">
										기타
									</c:when>
								</c:choose>
							</td>
							<td class="col-1">신고일자</td>
							<td class="col-1">${detail.reportDate}</td>
							<td class="col-1">작성일자</td>
							<td class="col-1">${detail.boardDate}</td>
							<td class="col-2">작성자ID(제재횟수)</td>
							<td class="col-2 text-start">${detail.boardUser}(${detail.repcnt})</td>
						</tr>
						
					</thead>
					<tbody>
						<tr>
							<td>신고내용</td>
							<td colspan="7" class="text-start">${detail.reportDetail}</td>
						</tr>
						<tr>
							<td>글내용</td>
							<td colspan="7" class="text-start">${detail.boardContent}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="" class="col-md-9 text-start"></div>		
			<div class="col-md-3 text-end mb-3">
				<button type="button" id="sanctionBtn" class="btn btn-success btn-sm">제재하기</button>
				<button type="button" id="reportDeleteBtn" class="btn btn-success btn-sm">무시하기</button>
			</div>
			
		</div>
		
		
	</div>

</main>
</div>
</div>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/include/js/reportDetail.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
	integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
	crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
</body>
</html>
