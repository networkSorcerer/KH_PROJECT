<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>    
<!-- <link rel="stylesheet" href="/resources/include/assets/css/main.css"> -->
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
	strong {
		font-size: large;
	}
</style>
</head>
<body class="subpage">
	<!-- Header, Nav -->	
	<%@ include file="/WEB-INF/views/project/generic.jspf" %> 
	
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Save The Animal</p>
				<h2>회원 ID 찾기</h2>
			</header>
		</div>
	</section><!-- Two -->
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
							<h2>회원 ID 찾기</h2>
						</header>	 -->	
						
						<c:if test="${empty result}"> 	
							<!-- 모달 예시 2-->
							<div class="modal modal-sheet position-static d-block p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content rounded-4 shadow">
							      <div class="modal-header p-5 pb-4 border-bottom-0">
							        <!-- <h1 class="fw-bold mb-0 fs-2">아이디 찾기</h1> -->					      
							      </div>
					
							      <div class="modal-body p-5 pt-0">
							      	  <strong>Save The Animal</strong><br>
							          <small class="text-body-secondary">가입시 등록한 이메일로 회원 아이디를 확인할 수 있습니다.</small>
							          <hr class="my-3">
							        <form id="findId">
							          <div class="form-floating mb-3">
							            <input type="email" id="userEmail" name="userEmail" class="form-control rounded-3" placeholder="name@example.com">	            
							          <hr class="my-3">
							          </div>
							          <button type="button" id="findIdBtn" name="findIdBtn" class="w-100 mb-2 btn btn-lg rounded-3 btn-secondary special">아이디 찾기</button>
							        </form>
							      </div>
							    </div>
							  </div>
							</div>						
						</c:if>
						
						<c:if test="${not empty result}">	 			
							<!-- 모달 예시 1-->
							<div class="modal modal-sheet position-static d-block p-4 py-md-5" tabindex="-1" role="dialog" id="modalSheet">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content rounded-4 shadow">
							      <div class="modal-header border-bottom-0">
							        <h1 class="modal-title fs-5"><strong>아이디 찾기 성공</strong></h1>
							      </div>
							      <div class="modal-body py-0">	
							        <p class="left-margin">회원님의 아이디는 <span class="span-black-and-bold">${result.userId}</span> 입니다.</p>
							      </div>
							      <div class="modal-footer flex-column align-items-stretch w-100 gap-2 pb-3 border-top-0">
							        <button type="button" id="loginBtn" name="loginBtn" class="btn special">로그인 하기</button>
							        <button type="button" id="resetPwdBtn" name="resetPwdBtn" class="btn" data-bs-dismiss="modal">비밀번호 재설정</button>
							      </div>
							    </div>
							  </div>
							</div>	
						 </c:if>
					</c:if>
					
				</div>
			</div>
		<!-- <div>findId.jsp 화면</div>
		<div>아이디찾기 이메일 입력 폼</div>
		<div>아이디 찾기 : 입력 버튼 누르고 성공시 아이디 화면 출력 및 로그인 이동 가능. 실패시 알림메시지 띄우고 현재페이지 재요청</div>
		<div>비밀번호 재설정 : </div> -->
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
	<script src="/resources/include/js/user/findId.js"></script>
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
