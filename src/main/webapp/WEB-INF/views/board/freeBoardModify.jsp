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
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<!-- <header class="align-center">
						<p>부제목</p>
						<h2>글 수정하는 페이지</h2>
					</header> -->
					<form method="post" action="/board/freeBoardModify">
						<div class="row uniform">
							<div class="12u$">
								<input type="hidden" name="fboardId" id="fboardId"
									value="${freeBoard.fboardId}">
							</div>
							<div class="12u$">
								<input type="text" name="fboardTitle" id="fboardTitle"
									placeholder="제목" value="${freeBoard.fboardTitle}" required>
							</div>
							<div class="12u$">
								<textarea style="resize:none;" cols="100" wrap="hard" name="fboardContent"
									id="fboardContent" placeholder="내용을 입력해주세요" rows="6" required>${freeBoard.fboardContent}</textarea>
							</div>
							<div class="12u$">
								<input type="hidden" name="userId" id="userId"
									value="${userLogin.userId}" readonly>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input type="submit" value="등록"></li>
									<li><a href="/board/freeBoardList" class="button">취소</a></li>
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
<!--
	const fboardContent = document.querySelector('#fboardContent');
	fboardContent.innerHTML = '${freeBoard.fboardContent}';
-->
<!--
function goWrite(frm) {
	var fboardTitle = frm.fboardTitle.value;
	//var writer = frm.writer.value;
	var fboardContent = frm.fboardContent.value;
	
	if (fboardTitle.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	
	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	
	if (fboardContent.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
-->
</script>
</html>
