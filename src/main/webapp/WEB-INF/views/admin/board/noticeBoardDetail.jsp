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
							<h3>${noticeBoard.nboardTitle}</h3>
						</header>
						<div>
							<textarea style="resize:none;" rows="20" cols="100" readonly>${noticeBoard.nboardContent}</textarea>
						</div>
						<br>
						<button type="button"
							onClick="location.href='/admin/board/noticeBoardModify?nboardId=${noticeBoard.nboardId}'"
							class="btn btn-success btn-sm">수정</button>
						<button type="button" onClick="del(${noticeBoard.nboardId})"
							class="btn btn-success btn-sm">삭제</button>
						<button type="button"
							onClick="location.href='/admin/noticeBoardList'"
							class="btn btn-success btn-sm">목록</button>
					</div>
				</div>
			</div>
		</section>
	</div>


</main>
</div>
</div>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
	integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
	crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
<script src="/resources/include/js/user/userList.js"></script>
</body>
<script>
	function del(nboardId) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?nboardId='+nboardId;
		}
	}
</script>
</html>
