<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<link rel="stylesheet" href="/resources/include/assets2/css/main.css">

</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/project/generic.jspf"%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Save The Animal</p>
				<h2>자유게시판</h2>
			</header>
		</div>
	</section>
	<!-- Two -->

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
						<table class="alt">
							<thead>
								<tr class="text-center">
									<th class="col-md-1">글번호</th>
									<th class="col-md-7">제목</th>
									<th class="col-md-1">작성자</th>
									<th class="col-md-1">조회수</th>
									<th class="col-md-1">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${freeBoardList}" var="list">
									<tr>
										<td class="text-center">${list.fboardId }</td>
										<td><a
											href="freeBoardDetail?fboardId=${list.fboardId}&userId=${userLogin.userId}">
												${list.fboardTitle} </a></td>
										<td class="text-center">${list.userId }</td>
										<td class="text-center">${list.fboardCnt }</td>
										<td class="text-center"><fmt:formatDate value="${list.fboardDate }" pattern="yyyy.MM.dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
					<c:if test="${empty userLogin}">
						<ul class="actions">
							<li><a href="/user/login" class="button special"
								onclick="alert('글을 작성하려면 로그인이 필요합니다')">글쓰기</a></li>
						</ul>
					</c:if>
					<c:if test="${not empty userLogin}">
						<ul class="actions">
							<li><a href="/board/freeBoardCreate" class="button special">글쓰기</a></li>
						</ul>
					</c:if>
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
								<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
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

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
	</footer>
	<div class="copyright">
		Made with <a href="https://templated.co/">Templated</a>.
	</div>

	<!-- Scripts -->
	<script src="/resources/include/assets2/js/jquery.min.js"></script>
	<script src="/resources/include/assets2/js/jquery.scrollex.min.js"></script>
	<script src="/resources/include/assets2/js/skel.min.js"></script>
	<script src="/resources/include/assets2/js/util.js"></script>
	<script src="/resources/include/assets2/js/main.js"></script>
	<script src="/resources/include/js/board/freeBoardList.js"></script>
</body>
<script>
	
</script>
</html>