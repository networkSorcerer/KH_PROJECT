<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">공지사항</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->
		
		<div style="display: none;" id="userSearch">
		<form id="searchForm" name="searchForm">
			<!-- 페이징 처리를 위한 파라미터 -->
			<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="search">검색분류</label>
				</div>
				<div class="col-auto">
					<select name="search" id="u_search"
						class="form-select form-select-sm">
						<option value="">분류</option>
						<option value="boardTitle">제목</option>
						<!-- <option value="userVolcnt">봉사횟수</option> -->
						<option value="boardWriter">작성자</option>
					</select>
				</div>
				<div class="searchArea col-auto">
					<div class="selectActArea">
						<select name="keyword" id="keyword"
							class="form-select form-select-sm">
							<option value="1">활동</option>
							<option value="2">활동중지</option>
							<option value="0">비활동(탈퇴)</option>
						</select>
					</div>
					<div class="selectVolcntArea">
						<select name="keyword" id="user_volcnt"
							class="form-select form-select-sm">
							<option value="">봉사횟수</option>
							<option value="5">5 이상</option>
							<option value="10">10 이상</option>
							<option value="20">20 이상</option>
						</select>
					</div>
				</div>
				<div class="col-auto dateArea">
					<div class="row g-2 align-items-center">
						<div class="col-auto">
							<input type="date" placeholder="시작일자"
								class="form-control form-control-sm" name="startDate"
								id="startDate" />
						</div>
						<div class="col-auto">
							<input type="date" placeholder="종료일자"
								class="form-control form-control-sm" name="endDate" id="endDate" />
						</div>
					</div>
				</div>
				<div class="col-auto">
					<button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>
					<button type="button" id="allSearchBtn" class="btn btn-primary btn-sm">전체 검색</button>
				</div>
			</div>
		</form>
	</div>
	
		<section id="two" class="wrapper style2">
			<div class="inner">
				<div class="box">
					<div class="content">
						<div class="table-wrapper">
							<table class="table table-striped">
								<thead>
									<tr class="text-center">
										<th class="col-md-1">글번호</th>
										<th class="col-md-7">제목</th>
										<th class="col-md-1">조회수</th>
										<th class="col-md-1">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noticeBoardList}" var="list">
										<tr>
											<td class="text-center">${list.nboardId }</td>
											<td><a
												href="noticeBoardDetail?nboardId=${list.nboardId}">
													${list.nboardTitle} </a></td>
											<td class="text-center">${list.nboardCnt }</td>
											<td class="text-center"><fmt:formatDate value="${list.nboardDate }"
													pattern="yyyy.MM.dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<button type="button" onclick="location.href='/admin/noticeBoardCreate'" 
							class="btn btn-success btn-sm">공지사항 작성</button>
							
						<%--============ 페이징 출력 시작 ============--%>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a href="${pageMaker.startPage - 1}"
										class="page-link">Previous</a> <%-- <a href="${pageMaker.startPage - 10}" class="page-link">Previous</a> --%>
									</li>
								</c:if>
								<!-- 바로가기 번호 출력 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li
										class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
										<a href="${num}" class="page-link">${num}</a>
									</li>
								</c:forEach>

								<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a href="${pageMaker.endPage + 1}"
										class="page-link">Next</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
	</div>


</main>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
	integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
	crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
<!-- <script src="/resources/include/js/user/userList.js"></script> -->
<script src="/resources/include/js/board/adminNoticeBoardList.js"></script>
</body>
</html>
