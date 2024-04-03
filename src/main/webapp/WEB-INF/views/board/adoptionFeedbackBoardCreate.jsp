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
					<!-- <header class="align-center">
						<p>부제목</p>
						<h2>글 작성하는 페이지</h2>
					</header> -->
					<form method="post" action="/adoptionFeedbackBoard/adoptionFeedbackBoardCreate">
						<div class="row uniform">
							<div class="12u$">
								<h3>제목</h3>
								<input type="text" name="afboardTitle" id="afboardTitle" placeholder="제목을 입력해주세요." required>
							</div>
							<div class="12u$">
								<h3>내용</h3>
								<textarea style="resize:none;" cols="100" wrap="hard" name="afboardContent" id="afboardContent" placeholder="내용을 입력해주세요"
									rows="6" required></textarea>
							</div>
							<div class="12u$">
								<input type="hidden" name="userId" id="userId" value="${userLogin.userId}">
							</div>
							<div class="12u$">
								<ul class="actions">
									<li>
										<input type="submit" value="등록">
									</li>
									<li>
										<a href="/adoptionFeedbackBoard/adoptionFeedbackBoardList" class="button">취소</a>
									</li>
								</ul>
							</div>
						</div>
					</form>
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
</body>
<script>
</script>
</html>
