<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
	<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
	<link rel="stylesheet" href="/resources/include/assets2/css/main.css">
<style>
	.left-margin {
		margin-left: 5%;
		margin-right:5%;
		font-size: 1.1em;
	}
	.span-black-and-bold {
		color : black;
		font-weight: bold;
	}
</style>	
</head>
<body class="subpage">

<%@ include file="/WEB-INF/views/project/generic.jspf" %>   

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Save The Animal</p>
				<h2>비밀번호 재설정</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">	
					<c:if test="${not empty userLogin}">
					  	<h4>${userLogin.userName}님이 로그인하였습니다.</h4>
					  	<button type="button" id="logoutBtn">로그아웃</button>
					</c:if>			
					<c:if test="${empty userLogin}">
						<!-- <header class="align-center">
							<p>Save The Animal</p>
							<h2>비밀번호 재설정</h2>
						</header> -->		
						<c:if test="${empty result}">
							<div class="inputArea">
								<div class="modal modal-sheet position-static d-block p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content rounded-4 shadow">
								      <div class="modal-header p-5 pb-4 border-bottom-0">
								        <!-- <h1 class="fw-bold mb-0 fs-2">회원 확인</h1> -->				      
								      </div>
						
								      <div class="modal-body p-5 pt-0">
								      	  <strong>Save The Animal</strong><br>
								          <small class="text-body-secondary">가입시 등록한 아이디와 이메일을 입력하세요</small>
								          <hr class="my-3">
								        <form id="resetPwd">
								          <div class="form-floating mb-3">
								            <input type="text" id="userId" name="userId" class="form-control rounded-3" placeholder="아이디를 입력하세요">	            							          	
								          </div>
								          <div class="form-floating mb-3">
								            <input type="email" id="userEmail" name="userEmail" class="form-control rounded-3" placeholder="name@example.com">	            
								          	<hr class="my-3">
								          </div>
								          <button type="button" id="resetPwdBtn" name="resetPwdBtn" class="w-100 mb-2 btn btn-lg rounded-3 special">비밀번호 재설정</button>
								        </form>
								      </div>
								    </div>
								  </div>
								</div>						
							</div>  			
						</c:if>
						
						<c:if test="${not empty result}">
							<div class="outputArea">
								<div class="modal modal-sheet position-static d-block p-4 py-md-5" tabindex="-1" role="dialog" id="modalSheet">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content rounded-4 shadow">
								      <div class="modal-header border-bottom-0">
								        <h1 class="modal-title fs-5"><strong>임시 비밀번호 발급</strong></h1>
								      </div>
								      <div class="modal-body py-0">	
								        <p class="left-margin">임시 비밀번호 <span id="output" class="span-black-and-bold">${result.userPasswd}</span> 입니다. <br>
								        복사하여 로그인해주세요.<br>로그인 후 바로 마이페이지에서 비밀번호를 변경해주세요.</p>
								      </div>
								      <div class="modal-footer flex-column align-items-stretch w-100 gap-2 pb-3 border-top-0">
								        <button type="button" id="copyTextBtn" name="copyTextBtn" class="btn btn-secondary">클립보드 복사하기</button>
								        <button type="button" id="loginBtn" name="loginBtn" class="btn special">로그인 하기</button>
								      </div>
								    </div>
								  </div>
								</div>	
							 </div>
						</c:if>
					</c:if> 
	
				</div>
				
			</div>
			<!-- <p>resetPwd.jsp</p>
			<div>비밀번호 재설정을 위한 회원 확인 페이지</div> -->
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
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
	<script src="/resources/include/js/user/resetPwd.js"></script>
	<script>	
		$(function(){				
			let msg = "${msg}";
			if(msg != ""){
				alert(msg);
				msg = "";
			}			
		});		
	</script>
</body>

</html> 



