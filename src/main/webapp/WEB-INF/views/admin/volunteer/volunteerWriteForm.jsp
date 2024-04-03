<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">봉사공고</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->
	 <form id="insertForm">
        <label for="volunteerTitle">봉사활동 제목:</label><br>
        <input type="text" id="volunteerTitle" name="volunteerTitle"><br><br>
        
        <label for="volunteerTime">봉사활동 기간:</label><br>
        <input type="date" id="volunteerTime" name="volunteerTime"><br><br>
        
        <label for="volunteerDue">봉사활동 신청 마감일:</label><br>
        <input type="datetime-local" id="volunteerDue" name="volunteerDue" value="yyyy-MM-ddT18:00"><br><br>
        
        <label for="volunteerLimit">봉사활동 제한인원:</label><br>
        <input type="text" id="volunteerLimit" name="volunteerLimit"><br><br>
        
        <label for="volunteerCost">봉사활동 비용:</label><br>
        <input type="text" id="volunteerCost" name="volunteerCost"><br><br>
        
        <label for="volunteerLocation">봉사활동 장소:</label><br>
        <input type="text" id="volunteerLocation" name="volunteerLocation"><br><br>
        
        <label for="volunteerDetail">세부사항:</label><br>
        <textarea id="volunteerDetail" name="volunteerDetail" rows="20" cols="100" style="resize: none;"></textarea><br><br>
        
        <label for="volunteerThumbnail">공고 썸네일</label><br>
		<input type="file" id="file" name="file"><br><br>
        
        <input type="button" value="제출" id="insertBtn">
    </form>
	
	</div>
		
</main>
</div>
</div>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/include/assets/js/color-modes.js"></script>
<script src="/resources/include/js/common.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
	integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
	crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
<script src="/resources/include/js/volunteer/volunteerInsert.js"></script>
</body>
</html>
