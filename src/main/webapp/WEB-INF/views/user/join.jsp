<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<link rel="stylesheet" href="/resources/include/assets2/css/main.css">
<style>
	.form-container {
	    width: 800px; 
	    margin: 0 auto;
	}
	.error {
		color: red;
	}
	.success {
		color: blue;
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
				<h2>회원 가입</h2>
			</header>
		</div>
	</section><!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>Save The Animal</p>
						<h2>회원 정보 입력</h2>
					</header>
					<div class="form-container">
						<form id="joinForm" name="joinForm">
							<div class="row uniform">
								<div class="table-wrapper">
									<table>
										<thead><tr></tr></thead>
										<tbody>
											<tr>
												<td>
													<label for="userId" class="align-center">아이디</label>
												</td>
												<td>
													<input type="text" name="userId" id="userId" maxlength="15" placeholder="영문/숫자 6~15자리" />
												</td>	
												<td>
													<button type="button" class="button alt small" id="idCheckBtn">중복 확인</button>
												</td>
											</tr>
											<tr>
												<td>
													<label for="userPasswd" class="align-center">비밀번호</label>
												</td>	
												<td>
													<input type="password" maxlength="20" name="userPasswd" id="userPasswd" placeholder="영문/숫자 8~20자리" />
													<br>
													<input type="password" maxlength="20" name="userPasswdCheck" id="userPasswdCheck" placeholder="위와 동일하게 입력" />
												</td>
												<td><span id="password-error" class="error"></span></td>
											</tr>
											<tr>
												<td>
													<label for="userName" class="align-center">이름</label>
												</td>	
												<td>
													<input type="text" maxlength="6" name="userName" id="userName" placeholder="한글 2~6자" />
												</td>
												<td></td>
											</tr>
											<tr>
												<td>
													<label for="userPhone" class="align-center" >핸드폰번호</label>
												</td>
												<td>
													<input type="text" name="userPhone" id="userPhone" maxlength="13" placeholder="'-' 제외 입력"
													 />
												</td>
												<td>
													<button type="button" class="button alt small" id="phoneCheckBtn">중복 확인</button>
												</td>
											</tr>
											<tr>
												<td>
													<label for="userEmail" class="align-center">이메일</label>
												</td>
												<td>
													<input type="email" name="userEmail" id="userEmail"  placeholder="이메일 입력" />
												</td>
												<td>
													<button type="button" class="button alt small" id="emailCheckBtn">중복 확인</button>
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3">
												</td>
											</tr>
											<tr>
												<td colspan="3">
													<input type="checkbox" value='selectall' onclick='selectAll(this)' name="agree" id="check-all" />
													<label for="check-all">전체 동의</label>
												</td>
											</tr>
											<tr>
												<td colspan="3"> 
													<input type="checkbox" class="single-checkbox" name="agree" id="agreePrivInfo" />
													<label for="agreePrivInfo">(필수)개인정보 수집 및 이용 동의</label>
													<input type="checkbox" class="single-checkbox" name="agree" id="agreeTerms" />
													<label for="agreeTerms">(필수)회원 약관 동의</label>
													<label><a href="/user/joinTerms" class="openPopup">이용약관 / 개인정보 수집 및 이용 동의 전문 보기</a></label>
												</td>
											</tr>										
										</tfoot>
									</table>
								</div>
							</div>
						</form>
						<button type="button" id="joinBtn" name="joinBtn" class="button special fit">회원 가입</button>
					</div>
				</div>
			</div>
			<!-- <div>join.jsp 화면</div>
			<div>아이디, 비밀번호, 비밀번호확인, 이름, 이메일, 핸드폰번호, 약관동의 체크박스 입력 폼</div>
			<div>회원가입하기 버튼 : 입력 버튼 누르고 성공시 메인페이지 이동 및 메뉴 접근 가능! 로그인 버튼 대신 마이페이지 메뉴 생성?</div> -->
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
	<script src="/resources/include/js/user/join.js"></script>
	<script>
	$(function(){		
		let errorMsg = "${errorMsg}"; 
		if (errorMsg != "") {
			alert(errorMsg);
		}
	});
	</script>
</body>

</html>