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
	.table-wrapper {
		overflow: hidden;
	}
	.table-wrapper tbody tr td:nth-child(3) {
    	width: 25%; 
	}
	.new-password-area {
		display:none;
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
						<h2>회원 정보 수정</h2>
					</header>
					
					<div class="form-container">
						<form id="updateForm">
							<%-- <input type="hidden" name="boardNumber" id="boardNumber" value="${userInfo.userId}"/> --%>
							<div class="row uniform">
								<div class="table-wrapper">
									<table>
										<thead><tr><td colspan="3"></td></tr></thead>
										<tbody>
											<tr>
												<td>
													<label for="userId" class="align-center">아이디</label>
												</td>
												<td>
													<input type="text" name="userId" id="userId" maxlength="15" value="${userInfo.userId}" readonly/>
												</td>	
												<td>
												</td>
											</tr>
											<tr>
												<td>
													<div class="password-toggle align-center">
					                                    <input type="checkbox" id="passwordToggle">
					                                    <label for="passwordToggle">비밀번호 수정</label>
					                                </div>
												</td>	
												<td>
													<input type="password"  maxlength="20" name="pwdConfirm" id="pwdConfirm" placeholder="체크버튼을 클릭하세요" disabled/>
													<div class="new-password-area">
														<br>
														<input type="password" maxlength="20" name="userPasswd" id="userPasswd" placeholder="새 비밀번호 입력. 영문/숫자 8~20자리"/>
														<br>
														<input type="password" maxlength="20" name="userPasswdCheck" id="userPasswdCheck" placeholder="새 비밀번호와 동일하게 입력해주세요."/>
													</div>
												</td>
												<td>
													<button type="button" class="button alt small" id="pwdConfirmBtn" disabled>비밀번호 확인</button>
												</td>
											</tr>
											<tr>
												<td>
													<label for="userName" class="align-center">이름</label>
												</td>	
												<td>
													<input type="text" class="changable" maxlength="6" name="userName" id="userName" value="${userInfo.userName}" />
												</td>
												<td></td>
											</tr>
											<tr>
												<td>
													<label for="userPhone" class="align-center">핸드폰번호</label>
												</td>
												<td>
													<input type="text" class="changable" name="userPhone" id="userPhone" maxlength="11" value="${userInfo.userPhone}" placeholder="'-' 제외 입력. 중복확인 필수" />
												</td>
												<td>
													<button type="button" class="button alt small" id="phoneCheckBtn" disabled>중복 확인</button>
												</td>
											</tr>
											<tr>
												<td>
													<label for="userEmail" class="align-center">이메일</label>
												</td>
												<td>
													<input type="email" class="changable" name="userEmail" id="userEmail" value="${userInfo.userEmail}" placeholder="이메일 입력. 중복확인 필수" />
												</td>
												<td>
													<button type="button" class="button alt small" id="emailCheckBtn" disabled>중복 확인</button>
												</td>
											</tr>
										</tbody>
										<tfoot><tr><td colspan="3"></td></tr></tfoot>
									</table>
				                    <div class="text-end">
				                    	<button type="button" class="button special" id="updateProfileBtn">회원정보 수정</button>
				                    	<button type="button" id="updateCancelBtn">취소</button>
				                    </div>
								</div>
							</div>
						</form>
	                </div>
				</c:if>
				</div>
			</div>
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
	<script src="/resources/include/js/user/updateProfile.js"></script>
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
