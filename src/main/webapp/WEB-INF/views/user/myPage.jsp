<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/common.jsp" %>
	<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
	<link rel="stylesheet" href="/resources/include/assets2/css/main.css">
	<script>
	   function applicationView() {
			$("#data").attr({
			   method:"get",
			   action:"/application/applicationView"
		   });
		   $("#data").submit(); 
	   }
	</script>
</head>
<body class="subpage">

<%@ include file="/WEB-INF/views/project/generic.jspf" %>   

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Save The Animal</p>
				<h2>My page</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
				<c:if test="${empty userLogin}">
				  	<h4>로그인이 필요합니다</h4>
				  	<a href="/user/login" class="button">로그인 바로가기</a>
				</c:if>
				<c:if test="${not empty userLogin}">
					<header class="align-center">
						<p>Save The Animal</p>
						<h2>회원 정보</h2>
					</header>
					
					<%-- post 방식으로 전송 시 반드시 form 태그 추가해 주어야 합니다. --%>
			 		<form name="data" id="data" method="post">
			 			<input type="hidden" name="userId" id="userId" value="${userInfo.userId}"/>
			 		</form>
					
					<div class="grid">
						<!-- 회원 프로필 -->
						<div class="image fit">   	
							<div class="my-3 p-4 bg-body rounded shadow-sm">
							    <h4 class="border-bottom pb-2 mb-0"><strong>My Profile</strong></h4>
							    <!-- 사용자 정보 출력 -->
							    <div class="d-flex text-body-secondary pt-3">
							      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="20" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
								      <rect width="100%" height="100%" fill="#fff"/>											      
							      </svg>
							      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							        <div class="d-flex justify-content-between">
							          <strong class="text-gray-dark">이름</strong>
							        </div>
							        <!-- 사용자 이름 출력 -->
							        <span class="d-block">${userInfo.userName}</span>
							      </div>
							    </div>
							    <div class="d-flex text-body-secondary pt-3">
							      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="20" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
								      <rect width="100%" height="100%" fill="#fff"/>
							      </svg>     
							 		<div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							        <div class="d-flex justify-content-between">
							          <strong class="text-gray-dark">이메일</strong>
							        </div>
							        <span class="d-block">${userInfo.userEmail}</span>
							      </div>
							    </div>
							    <div class="d-flex text-body-secondary pt-3">
									<svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="20" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
								      <rect width="100%" height="100%" fill="#fff"/>
							      	</svg>
									<div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							        <div class="d-flex justify-content-between">
							          <strong class="text-gray-dark">핸드폰번호</strong>
							        </div>
							        <span class="d-block">${userInfo.userPhone}</span>
							      	</div>
							    </div>
							    <small class="d-block text-end mt-3">
							      <button type="button" id="goUpdateBtn" class="btn btn-small">회원정보 수정</button>
							    </small>
							  </div>					
						</div>

						<!-- 활동 내역 -->						
		 				<div class="image fit">
							<div class="my-3 p-4 bg-body rounded shadow-sm">
							    <h4 class="border-bottom pb-2 mb-0"><strong>My Activities</strong></h4>										    
							    <br/>
							    <p class="align-right">
							    	봉사 레벨 : <strong>Lv. <fmt:formatNumber type="number" maxFractionDigits="0" value="${Math.floor(userInfo.userVolcnt/3+1)}" /></strong><br>
							    	봉사 횟수 : <strong>${userInfo.userVolcnt}</strong> 회
							    </p>
							    <div class="d-flex text-body-secondary pt-3">
							      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="20" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
								      <rect width="100%" height="100%" fill="#fff"/>								      
							      </svg>
							      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							        <div class="d-flex justify-content-between">
							          <strong class="text-gray-dark">봉사활동 신청내역</strong>
							          <a onclick="applicationView()">확인하기</a>
							        </div>
							        <span class="d-block">신청한 봉사 일정 보여주기</span>
							      </div>
							    </div>
							    <div class="d-flex text-body-secondary pt-3">
							      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="20" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
								      <rect width="100%" height="100%" fill="#fff"/>								      
							      </svg>     
							 		<div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							        <div class="d-flex justify-content-between">
							          <strong class="text-gray-dark">입양 · 임시보호 신청내역</strong>
							          <a href="/counseling/counselingList?userId=${userLogin.userId}">확인하기</a>
							        </div>
							        <span class="d-block">입양 및 임시보호 신청 내역 및 결과 확인</span>
							      </div>
							    </div>
							    <div class="d-flex text-body-secondary pt-3">
									<svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="20" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
								      <rect width="100%" height="100%" fill="#fff"/>								      
							      	</svg>
									<div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							        <div class="d-flex justify-content-between">
							          <strong class="text-gray-dark">작성 글 히스토리</strong>
							          <a href="/board/getBoardCreateHistory?&userId=${userLogin.userId}"> 확인하기</a>
							        </div>
							        <span class="d-block">게시판 작성 글 확인</span>
							      	</div>
							    </div>
							    <small class="d-block text-end mt-3">
							      <a href="#"></a>
							    </small>
							  </div>					
						</div>

						<hr>
						<small class="d-block text-end mt-3">
							<button type="button" id="logoutBtn" class="btn btn-small">로그아웃</button>
							<button type="button" id="withdrawalBtn" class="btn btn-small">회원탈퇴</button>
						</small>
					</div>				
				</c:if>
										
				</div>
			</div>
			<!-- <hr>
			<div>myPage.jsp 화면</div>
			<div>하위 메뉴 배치 해서 회원정보 ajax로 불러오기</div>
			<div>내 정보 수정 : updateProfile.jsp</div>
			<div>나의 활동 : 각각 해당 페이지로 이동하여 확인하게 할지? 아니면 현재 화면에서 불러오기로 할지?</div>
			<hr> -->
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
		Made with <a href="https://templated.co/">templated</a>.		
	</div>

	<!-- Scripts -->
	<script src="/resources/include/assets2/js/jquery.min.js"></script>
	<script src="/resources/include/assets2/js/jquery.scrollex.min.js"></script>
	<script src="/resources/include/assets2/js/skel.min.js"></script>
	<script src="/resources/include/assets2/js/util.js"></script>
	<script src="/resources/include/assets2/js/main.js"></script>
	<script src="/resources/include/js/user/myPage.js"></script>
	<script>	
		$(function(){			
			let errorMsg = "${errorMsg}";
			if(errorMsg != ""){
				alert(errorMsg);
				errorMsg = "";
			}			
		}); 
	</script>
</body>

</html> 
