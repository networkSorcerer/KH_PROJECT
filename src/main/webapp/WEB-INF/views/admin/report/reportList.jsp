<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">신고 리스트</h1>
	</div>
	
	<div class="container">
	
		<form id="detailForm">
			<input type="hidden" id="reportId" name="reportId"/>
		</form>
	
		<div id="reportList">
			<table class="table table-boardered table-striped-columns table table-bordered">
				<thead>
					<tr class="text-center">
						<th class="col-md-1">신고번호</th>
						<th class="col-md-2">글분류</th>
						<th class="col-md-4">제목</th>
						<th class="col-md-2">작성자ID</th>
						<th class="col-md-1">신고분류</th>
						<th class="col-md-1">작성일자</th>
						<th class="col-md-1">신고일자</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty reportList}">
							<c:forEach var="report" items="${reportList}" varStatus="status">
								<tr class="text-center" data-num="${report.reportId}">
									<td class="text-center">${report.reportId}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${report.fboardId != 0}">
												자유게시판
											</c:when>
											<c:when test="${report.vfboardId != 0}">
												봉사후기게시판
											</c:when>
											<c:when test="${report.afboardId != 0}">
												입양후이야기
											</c:when>
											<c:when test="${report.fcommentId != 0}">
												자유게시판 댓글
											</c:when>
											<c:when test="${report.vfcommentId != 0}">
												봉사후기게시판 댓글
											</c:when>
											<c:when test="${report.afcommentId != 0}">
												입양후이야기 댓글
											</c:when>
										</c:choose>
									</td>
									<td class="goDetail text-start">${report.boardTitle}</td>
									<td class="text-center">${report.boardUser}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${report.reportSort==1}">
												욕설
											</c:when>
											<c:when test="${report.reportSort==2}">
												도배
											</c:when>
											<c:when test="${report.reportSort==3}">
												광고
											</c:when>
											<c:when test="${report.reportSort==4}">
												기타
											</c:when>
										</c:choose>
									</td>
									<td class="text-center">${report.boardDate}</td>
									<td class="text-center">${report.reportDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="text-center">신고된 컨텐츠가 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		
		</div>
		
		
		
	</div>

</main>
</div>
</div>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/include/js/reportList.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
	integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
	crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
</body>
</html>
