<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">입양 공고</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->
	<body>
    <div class="container">
        <div class="text-center">
            <h3>입양 공고 입력화면</h3>
        </div>
        <form id="f_writeForm">
            <div class="mb-3 row">
                <label for="adoptionTitle" class="col-sm-2 col-form-label">공고 제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="adoptionTitle"
                        name="adoptionTitle" placeholder="공고 제목을 입력하세요."
                        data-type="CDATA">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalId" class="col-sm-2 col-form-label">동물 ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="animalId"
                        name="animalId" placeholder="공고로 등록하실 동물 ID를 입력하세요."
                        data-type="CDATA">
                </div>
            </div>
              <div class="mb-3 row">
                <label for="adminId" class="col-sm-2 col-form-label">등록인 ID 확인</label>
                <div class="col-sm-10">
                    <select class="form-control" id="adminId"
                        name="adminId"  data-type="CDATA">
                    	<option>admin</option>    
                    </select>
                </div>
            </div>
             <div class="mb-3 row">
                <label for="adoptionContent" class="col-sm-2 col-form-label">공고 내용</label>
                <div class="col-sm-10">
                    <textarea name="adoptionContent" id="adoptionContent"
                        class="form-control" rows="5" style="resize: none;"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="adoptionLevel" class="col-sm-2 col-form-label">공고 레벨</label>
                <div class="col-sm-10">
                    <select name="adoptionLevel" id="adoptionLevel"
                        class="form-control" >
                    	<option>1. 상</option>
                    	<option>2. 중</option>
                    	<option>3. 하</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="adoptionStatus" class="col-sm-2 col-form-label">공고 상태</label>
                <div class="col-sm-10">
                    <select name="adoptionStatus" id="adoptionStatus"
                        class="form-control" >
                    	<option>1. 공고 중</option>
                    	<option>2. 상담 중</option>
                    	<option>3. 입양 완료</option>
                    </select>
                </div>
            </div>
            
            <!-- <div class="mb-3 row">
                <label for="adoptionPasswd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="adoptionPasswd"
                        name="adoptionPasswd" placeholder="비밀번호를 입력하세요." maxlength="16">
                </div>
            </div> -->
             <div class="mb-3 row">
                <label for="file" class="col-sm-2 col-form-label">첨부파일</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control" id="file" name="file" >
                </div>
            </div>      
        </form>
        <div class="text-end">
                <button type="button" class="btn btn-primary" id="adoptionInsertBtn">저장</button>
                <button type="button" class="btn btn-secondary" id="adoptionCancelBtn">취소</button>
                <button type="button" class="btn btn-success" id="adoptionListBtn">목록</button>
        </div>
    </div>
    <script src="/resources/include/js/adoption/writeForm.js"></script>
    <script>
    $(function(){
    	let errorMsg = "${errorMsg}";
    	if(errorMsg != "") {
    		alert(errorMsg);
    		errorMsg ="";
    	}
    });
    </script>
</body>
	
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


</html>
