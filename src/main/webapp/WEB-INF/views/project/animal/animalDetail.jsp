<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">동물 관리</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->
	<body>
	<div class="container">
		<div class="text-center"><h3>동물 리스트 상세 목록</h3></div>
		
		<form name="f_data" id="f_data">
			<input type="hidden" name="animalId" value="${detail.animalId }"/>
			<input type="hidden" name="animalFile" id="animalFile" value="${detail.animalFile}"/>
		</form>
		
		
		<%-- <div class="row text-center mb_2">
			<div id="pwdChk" class="col-md-9 text-start">	
				<form name="f_passwdCheck" id="f_passwdCheck" class="row g-3">
					<input type="hidden" name="animalId" value="${detail.animalId }"/>
					<div class="col-auto">
						<label for="animalPasswd" class="visually-hidden">비밀번호</label>
						<input type="password" class="form-control" name="animalPasswd" id="animalPasswd" placeholder="비밀번호 입력" />
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary btn-sm" id="passwdBtn">확인</button>
						<button type="button" class="btn btn-secondary btn-sm" id="passwdCancelBtn">취소</button>
					</div>
					<div class="col-auto">
						<span id="message" class="align-middle"></span>
					</div>
				</form>				
			</div> --%>
			

			<div class="col-md-10 text-end">
				<button type="button" id="updateFormBtn" class="btn btn-success btn-sm">글수정</button>
				<button type="button" id="DeleteBtn" class="btn btn-success btn-sm">글삭제</button>
				<button type="button" id="insertFormBtn" class="btn btn-success btn-sm">글쓰기</button>
				<button type="button" id="animalListBtn" class="btn btn-success btn-sm">목록</button>
			</div>
		</div>
		
		<div class="text-center">
			<table class="table table-bordered">
				<thead>
					<tr>
						
						<td class="col_3">동물 ID</td>
						<td>${detail.animalId }(조회수 : ${detail.readcnt })</td>
						<td>작성일</td>
						<td>${detail.animalRegist}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<table class="table mb-0">
								
								<tr>
									<td colspan="4">
										<c:if test="${not empty detail.animalFile}">
										    <img src="/resources/images/storage/animal/${detail.animalFile}" class="rounded img-fluid" />
										</c:if>
										<c:if test="${empty detail.animalFile}">
										    <img src="/resources/images/common/noanimal.jpg" class="rounded img-fluid" />
										</c:if>
									</td>
									
								</tr>
								<tr>
									<td class="col-3">이름</td>
									<td class="text-start">${detail.animalName }</td>
									<td>분류</td>
									<td class="text-start">${detail.animalSpecies }</td>
								</tr>
								<tr>
									<td>성별</td>
									<td class="text-start">${detail.animalGender }</td>
									<td>무게</td>
									<td class="text-start">${detail.animalKg }</td>
								</tr>
			
								<tr>
									<td>나이</td>
									<td class="text-start">${detail.animalAge }</td>
									<td>색깔</td>
									<td class="text-start">${detail.animalColor }</td>
								</tr>
								
								<tr>
									<td>중성화 유무</td>
									<td class="text-start">${detail.animalStatus }</td>
									<td>특이사항</td>
									<td class="text-start">${detail.animalMemo }</td>
								</tr>
								<tr>
									<td>임시보호 유무</td>
									<td class="text-start">${detail.animalTemp }</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
			
	</div>
	<script src="/resources/include/js/animal/animalDetail.js"></script>		
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
