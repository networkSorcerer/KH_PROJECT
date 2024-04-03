
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">회원 목록</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->		
		
		<div id="userSearch">
		    <form id="searchForm" name="searchForm">
		        <%-- 페이징 처리를 위한 파라미터 --%>
		        <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"/>
		        <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}"/>
		        <div class="row g-2 align-items-center">
		            <div class="col-auto">
		                <label for="search">검색분류</label>
		            </div>
		            <div class="col-auto">   
		                <select name="search" id="u_search" class="form-select form-select-sm">
		                    <option value="">분류</option>
		                    <option value="userAct">활동상태</option>
		                    <option value="userDate">가입일자</option>
		                </select>
		            </div>
	                <div class="col-auto selectArea">
	                    <select name="keyword" id="keyword" class="form-select form-select-sm">
	                        <option value="">선택하세요</option>
	                        <option value="1">활동</option>
	                        <option value="2">활동중지</option>
	                    </select>
	                </div>
		            <div class="col-auto dateArea">
		                <div class="row g-2 align-items-center">
		                    <div class="col-auto">
		                        <input type="date" placeholder="시작일자" class="form-control form-control-sm" name="startDate" id="startDate" />
		                    </div>
		                    <div class="col-auto">
		                        <input type="date" placeholder="종료일자" class="form-control form-control-sm" name="endDate" id="endDate" />
		                    </div>
		                </div>
		            </div>
		            <div class="col-auto">
		                <button type="button" id="searchBtn" class="btn btn-primary btn-sm">검색</button>  
		                <button type="button" id="allSearchBtn" class="btn btn-primary btn-sm">전체 검색</button>    
		            </div>
		        </div>
		    </form>
		</div>
		

		
		<div id="userList">
			<table class="table table-striped">
				<thead>
					<tr class="text-center">
					<!-- 12 -->					
						<th class="col-md-1">No</th>
						<th class="col-md-1">ID</th>
						<th class="col-md-1">이름</th>
						<th class="col-md-2">이메일</th>
						<th class="col-md-2">핸드폰번호</th>
						<th class="col-md-1">봉사</th>
						<th class="col-md-1">입양</th>
						<th class="col-md-1">제재</th>
						<th class="col-md-1">상태</th>
						<th class="col-md-1">가입일</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty userList}">
							<c:forEach var="user" items="${userList}" varStatus="status">
								<tr class="text-center" data-num="${status.index + 1}">
									<td class="text-center">${status.index + 1}</td>
									<td class="text-center">${user.userId}</td>
									<td class="text-center">${user.userName}</td>
									<td class="text-center">${user.userEmail}</td>
									<td class="text-center">${user.userPhone}</td>										
									<td class="text-center">${user.userVolcnt}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${user.userAdoptChk==1}">
												입양회원
											</c:when>
											<c:when test="${user.userAdoptChk==0}">
												없음
											</c:when>
										</c:choose>
									</td>
									<td class="text-center">${user.userRepcnt}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${user.userAct==1}">
												활동
											</c:when>
											<c:when test="${user.userAct==2}">
												활동중지
											</c:when>
										</c:choose>
									</td>
									<td class="text-center">${user.userDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="12" class="text-center">회원 내역이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>		
		</div>
		
		
		<%--============ 페이징 출력 시작 ============--%>	
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
		  	<c:if test="${pageMaker.prev}">
			    <li class="page-item">
			      <a href="${pageMaker.startPage - 1}" class="page-link">Previous</a>
			      <%-- <a href="${pageMaker.startPage - 10}" class="page-link">Previous</a> --%>
			    </li>		  	
		 	</c:if>
		 	
		 	<!-- 바로가기 번호 출력 -->
		 	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			    <li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
			    	<a href="${num}" class="page-link">${num}</a>
			    </li>	
		 	</c:forEach>
		 	
		 	<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker.next}">
			    <li class="page-item">
			      <a href="${pageMaker.endPage + 1}" class="page-link">Next</a>
			    </li>
			</c:if>
		  </ul>
		</nav>	
		 
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
</html>
