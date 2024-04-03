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
				<h2>입양후기게시판</h2>
			</header>
		</div>
	</section>
	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>Save The Animal</p>
						<h2>${adoptionFeedbackBoard.afboardTitle}</h2>
					</header>
					<div>
						<textarea style="resize:none;" rows="20" readonly>${adoptionFeedbackBoard.afboardContent}</textarea>
					</div>
					<p>
						작성자: ${adoptionFeedbackBoard.userId} <span style="float: right;"><fmt:formatDate
								value="${adoptionFeedbackBoard.afboardDate }" pattern="yyyy.MM.dd" /></span>
					</p>
					<br>
					<ul class="actions text-end">
						<li><a href="adoptionFeedbackBoardList" class="button special">목록</a></li>
						<c:if test="${userLogin.userId eq adoptionFeedbackBoard.userId}">
							<li><input type="button" value="수정"
								onclick="location.href='adoptionFeedbackBoardModify?afboardId=${adoptionFeedbackBoard.afboardId}'"></li>
							<li><input type="button" value="삭제"
								onclick="del(${adoptionFeedbackBoard.afboardId})"></li>
						</c:if>
						<c:if test="${empty userLogin}">
							<li><a href="/user/login"
								onclick="alert('신고하려면 로그인이 필요합니다')">
									<button type="button" class="btn btn-primary button special">신고</button>
							</a></li>
						</c:if>
						<c:if test="${not empty userLogin}">
							<c:choose>
								<c:when test="${adoptionFeedbackBoard.reUserId eq userLogin.userId}">
									<c:if test="${freeBoard.reportStatus eq 1}">
										<li><%@ include file="/WEB-INF/views/report/fbReportUpdate.jsp"%></li>
									</c:if>
									<c:if test="${freeBoard.reportStatus eq 2}">
										<li><button type="button" class="btn btn-primary button">신고처리됨</button></li>
									</c:if>
								</c:when>
								<c:otherwise>
									<li><%@ include
											file="/WEB-INF/views/report/abReportInsert.jsp"%></li>
								</c:otherwise>

							</c:choose>
						</c:if>
					</ul>
					<!-- 댓글 시작 -->
					<%@ include file="/WEB-INF/views/board/afcomment.jsp"%>
					<!-- 댓글 종료 -->
				</div>
			</div>
		</div>
		<!-- 댓글 종료 -->
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
	<script src="/resources/include/js/reportInsert.js"></script>
	<script src="/resources/include/js/reportUpdate.js"></script>

</body>
<script>
	function del(afboardId) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?afboardId='+afboardId;
		}
	}
</script>
</html>