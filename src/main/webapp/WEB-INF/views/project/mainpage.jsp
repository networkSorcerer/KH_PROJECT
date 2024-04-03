<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
	<link rel="stylesheet" href="/resources/include/assets/css/main.css">
	</head>
	<body>
		<header id="header" class="alt"><div class="logo"><a href="/">SaveTheAnimal <span>by team3</span></a></div>
				<a href="#menu">Menu</a>
		</header>
		<!-- Nav -->
		<nav id="menu">
			<ul class="links">
				<li><a href="/">Home</a></li>
				<li><a href="/project/volunteer">봉사모집</a></li>
				<li><a href="/ap/apList">입양</a></li>
				<li><a href="/board/freeBoardList">자유게시판</a>
				<li><a href="/volunteerFeedbackBoard/volunteerFeedbackBoardList">봉사후기게시판</a>
				<li><a href="/adoptionFeedbackBoard/adoptionFeedbackBoardList">입양후기게시판</a>
				<li><a href="/noticeBoard/noticeBoardList">공지사항</a>
				<c:if test="${empty userLogin}">
					<li><a href="/user/login">로그인</a>
				</c:if>
				<c:if test="${not empty userLogin}">
					<li><a href="/user/mypage">My page</a>
					<li><a href="/user/logout">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- Banner -->
		<section class="banner full">
			<article>
				<img src="/resources/images/slide06.jpg" alt="" width="1440" height="960">
				<div class="inner">
					<header>
						<p>For Abandoned Animal</p>
						<h2>Save The Animal</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="/resources/images/slide07.jpg" alt="" width="1440" height="960">
				<div class="inner">
					<header>
						<p>유기동물을 도와주세요</p>
						<h2>유기동물</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="/resources/images/slide08.jpg" alt="" width="1440" height="960">
				<div class="inner">
					<header>
						<p>유기동물 자원봉사에 참여하세요</p>
						<h2>자원봉사</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="/resources/images/slide09.jpg" alt="" width="1440" height="960">
				<div class="inner">
					<header>
						<p>유기동물 입양으로 새로운 가족을 만나보세요</p>
						<h2>입양</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="/resources/images/slide10.jpg" alt="" width="1440" height="960">
				<div class="inner">
					<header>
						<p>유기동물 보호를 위한 다양한 아이디어를 추천받습니다</p>
						<h2>아이디어</h2>
					</header>
				</div>
			</article>
		</section>
		<!-- One -->
		<section id="one" class="wrapper style2">
			<div class="inner">
				<div class="grid-style">
					<c:choose>
						<c:when test="${not empty mainVol}">
							<c:forEach var="mainVol" items="${mainVol}" varStatus="status">
								<div>
									<div class="box">
										<div class="image fit" style="width:100%; height:358.28px; aspect-ratio: 557.33/358.28">
											<c:choose>
												<c:when test="${not empty mainVol.volunteerFile}">
													<img src="/resources/images/storage/volunteer/${mainVol.volunteerFile}" alt="no image" width="600" height="300" style="width:100; height: 100%">
												</c:when>
												<c:otherwise>
													<img src="/resources/images/walk.jpg" title="no image" width="600" height="300" style="width:100; height: 100%">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="content">
											<header class="align-center">
												<p>${mainVol.volunteerTime}</p>
												<h2>${mainVol.volunteerTitle}</h2>
											</header>
											<p>일 자 : ${mainVol.volunteerTime}</p>
											<p>인 원 : ${mainVol.volunteerLimit}</p>
											<p>비 용 : ${mainVol.volunteerCost}</p>
											<p>위 치 : ${mainVol.volunteerLocation}</p>
											<footer class="align-center"><a href="/volunteer/volunteerDetail?volunteerId=${mainVol.volunteerId}" class="button alt">Learn More</a></footer>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<div class="box">
									<div class="image fit"><img src="/resources/images/pic02.jpg" alt="" width="600" height="300"></div>
									<div class="content">
										<header class="align-center">
											<p>maecenas sapien feugiat ex purus</p>
											<h2>Lorem ipsum dolor</h2>
										</header>
										<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
										<footer class="align-center"><a href="#" class="button alt">Learn More</a></footer>
									</div>
								</div>
							</div>
							
							<div>
								<div class="box">
									<div class="image fit"><img src="/resources/images/pic03.jpg" alt="" width="600" height="300"></div>
									<div class="content">
										<header class="align-center">
											<p>mattis elementum sapien pretium tellus</p>
											<h2>Vestibulum sit amet</h2>
										</header>
										<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
										<footer class="align-center"><a href="#" class="button alt">Learn More</a></footer>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>				
				

				</div>
			</div>
		</section>
		<!-- Two -->
		<section id="two" class="wrapper style3">
			<div class="inner">
				<header class="align-center">
					<p>Abandoned animal volunteering</p>
					<h2>STA : Save The Aniaml</h2>
				</header>
			</div>
		</section>
		<!-- Three -->
		<section id="three" class="wrapper style2">
			<div class="inner">
				<header class="align-center">
					<p class="special">an abandoned animal list</p>
					<h2>STA : Save The Aniaml</h2>
				</header>
				<div class="gallery">
					<c:choose>
						<c:when test="${not empty mainAni}">
							<c:forEach var="mainAni" items="${mainAni}" varStatus="status">
								<div>
									<div class="image fit" style="width:600px; height:371px;">
										<c:choose>
											<c:when test="${not empty mainAni.animalFile}">
												<img src="/resources/images/storage/animal/${mainAni.animalFile}" alt="${mainAni.animalName}" alt="no image" width="600" height="300" style="width:100%; height:100%;">
											</c:when>
											<c:otherwise>
										    	<img src="/resources/images/common/noanimal.jpg" title="no image" width="600" height="300" style="width:100%; height:100%;" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<div class="image fit">
									<a href="#"><img id="/resources/images/pic01.jsp" src="" alt="" width="600" height="300" ></a>
								</div>
							</div>
							<div>
								<div class="image fit">
									<a href="#"><img id="/resources/images/pic02.jsp" src="" alt="" width="600" height="300"></a>
								</div>
							</div>
							<div>
								<div class="image fit">
									<a href="#"><img id="/resources/images/pic03.jsp" src="" alt="" width="600" height="300"></a>
								</div>
							</div>
							<div>
								<div class="image fit">
									<a href="#"><img id="/resources/images/pic04.jsp" src="" alt="" width="600" height="300"></a>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>
		
		<!-- Footer -->
		<footer id="footer">
			<div class="container">
				<ul class="icons"><li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
				</ul>
			</div>
		</footer>
		
		<div class="copyright">Made with <a href="https://templated.co/">Templated</a>.</div>

		<!-- Scripts -->
		<script src="/resources/include/assets/js/jquery.min.js"></script>
		<script src="/resources/include/assets/js/jquery.scrollex.min.js"></script>
		<script src="/resources/include/assets/js/skel.min.js"></script>
		<script src="/resources/include/assets/js/util.js"></script>
		<script src="/resources/include/assets/js/main.js"></script>
	</body>
</html>