<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">공지사항</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->
		<section id="two" class="wrapper style2">
			<div class="inner">
				<div class="box">
					<div class="content">
						<header class="align-center">
							<p>부제목</p>
							<h2>공지사항 작성하기</h2>
						</header>
						<form method="post" action="/admin/board/noticeBoardCreate">
							<div class="row uniform">
								<div class="12u$">
									<h3>제목</h3>
									<input type="text" size=98 name="nboardTitle" id="nboardTitle"
										placeholder="제목을 입력해주세요." required>
								</div>
								<div class="12u$">
									<h3>내용</h3>
									<textarea style="resize:none;" cols="100" wrap="hard" name="nboardContent"
										id="nboardContent" placeholder="내용을 입력해주세요" rows="6" required></textarea>
								</div>
								<div class="12u$">
									<input type="hidden" name="adminId" id="adminId"
										value="admin">
								</div>
							</div>
							<button type="submit" class="btn btn-success btn-sm">등록</button>
							<button type="button" class="btn btn-success btn-sm"
								onClick="location.href='/admin/noticeBoardList'">취소</button>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
	integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
	crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
<script src="/resources/include/js/user/userList.js"></script>
</body>
</html>
