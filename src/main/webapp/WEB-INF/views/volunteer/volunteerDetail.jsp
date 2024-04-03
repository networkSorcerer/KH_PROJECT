<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
	<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
	<link rel="stylesheet" href="/resources/include/assets2/css/main.css">
	
	<!-- css 적용 -->
	<link rel="stylesheet" href="/resources/include/css/volunteer/volunteerDetail.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94063d37acee8b8586233e93d841bf07&libraries=services"></script>
	<script>
		function formatDateTime(elementId) {
	        // elementId에 해당하는 요소를 가져옴
	        var element = $('#' + elementId);
	
	        // 가져온 요소의 텍스트 값을 읽어옴
	        var dateTime = element.text();
	
	     // moment.js를 사용하여 날짜와 시간을 원하는 형식으로 변환
	        var formattedDateTime = moment(dateTime).format('YYYY-MM-DD A h:mm').replace('AM', '오전').replace('PM', '오후');
	
	        // 변환된 값을 해당 요소에 설정
	        element.text(formattedDateTime);
	    }
		// 모달 팝업 열기
		function openModal() {
		    var today = new Date();
		    var year = today.getFullYear();
		    var month = ('0' + (today.getMonth() + 1)).slice(-2);
		    var day = ('0' + today.getDate()).slice(-2);
		    var hours = ('0' + today.getHours()).slice(-2);
		    var minutes = ('0' + today.getMinutes()).slice(-2);
		    
		    // 오늘 날짜와 시간을 YYYY-MM-DD"T"HH24:MI 형태로 조합
		    var formattedToday = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;
		
		    // 오라클에서 가져온 날짜와 시간 (예: '2024-03-20T14:30')
		    var oracleDateTime = '${detail.volunteerDue}}'; // 오라클에서 가져온 예시 날짜와 시간
		
		    // 오늘 날짜와 오라클에서 가져온 날짜 비교
		    if (formattedToday > oracleDateTime) {
		    	alert("신청날짜가 지났습니다.");
		    	return;
		    } else {
			var modal = document.getElementById("myModal");
			modal.style.display = "block";
		    }
		}
	
		// 모달 팝업 닫기
		function closeModal() {
		  var modal = document.getElementById("myModal");
		  modal.style.display = "none";
		}
	
		// 페이지가 로드된 후 실행되는 함수
		window.onload = function() {
		  // 닫기 버튼 클릭 시 모달 팝업 닫기
		  document.getElementsByClassName("close")[0].onclick = function() {
		    closeModal();
		  };

		  // 모달 외부 영역 클릭 시 모달 팝업 닫기
		  window.onclick = function(event) {
		    var modal = document.getElementById("myModal");
		    if (event.target == modal) {
		      closeModal();
		    }
		  };
		};
			
		$(function() {
			formatDateTime('volunteerDue');
			var userId = "${userLogin.userId}";
			var volunteerId = ${ detail.volunteerId };
			/* 지도 api 추가 스크립트 */
			var mapVisible = false;
			$(document).on("click", "#showMap", function() {
				mapVisible = !mapVisible;
				if(mapVisible) {
					$("#map").css("display", "block")
				} else {
					$("#map").css("display", "none");
				}
				let roadaddress = $(this).html();
				let title = $(this).attr("title");
				const container = document.getElementById('map'); // 지도를 표시할 div 
				const options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
				        level: 5 // 지도의 확대 레벨
				    };  
				// 지도를 생성합니다    
				const map = new kakao.maps.Map(container, options); 
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(roadaddress, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
			})
			
			/* 참가 인원 구하기 스크립트 */
			$.ajax({
	                url: '/application/'+volunteerId,
	                method: 'GET',
	                dataType : 'json',
	                success: function(applicationCount) {	
				// applicationCount를 가져오는 데 성공했을 때만 실행됩니다.
				// 가져온 applicationCount 값을 사용하여 해당 행(tr)에 추가합니다.
				var tr = '<tr><th>모집 인원</th><td>' + applicationCount + '명 / ' + '${detail.volunteerLimit}명' + '</td></tr>';
              	 // 위에서 생성한 tr을 해당 행 앞에 추가합니다.
 				$('table tbody tr:nth-child(3)').before(tr);
	                    
				$("#applicationBtn").on("click", function() {
         			 	if ('${detail.volunteerLimit}' == applicationCount) {
         		            	alert('이미 신청자가 다 찼습니다.');
         		            	closeModal();
         		        } else if(userId == "null" || userId == "") {
     		            	if(confirm("로그인이 필요합니다. 로그인페이지로 이동하시겠습니까?")) {
     		            		location.href="/user/login";
     		            	} 
         		        } else {
         		        	$.ajax({
         		        	    url: "/application/applicationCheck",
         		        	    type: "POST",
         		        	    data: {
         		        	        userId,
         		        	        volunteerId
         		        	    },
         		        	    success: function(response) {
         		        	        console.log("result : " + response);

         		        	        // 응답이 1인 경우 이미 신청한 공고임을 알림
         		        	        if (response != 0) {
         		        	            if (confirm("이미 신청한 공고 입니다.")) {
         		        	                location.href = "/project/volunteer";
         		        	            }
         		        	        } else {
         		        	            $("#applicationForm").attr({
         		        	                method: "post",
         		        	                action: "/application/applicationSubmit"
         		        	            });
         		        	            $("#applicationForm").submit();
         		        	        }
         		        	    },
         		        	    error: function(xhr, status, error) {
         		        	        // 에러 처리
         		        	        console.error("Error:", error);
         		        	        // 여기에서 에러 처리 및 사용자에게 알림을 표시할 수 있습니다.
         		        	    }
         		        	})
         		    	}
              		})
            	  },
					error: function(xhr, status, error) {
                  	console.error('Error: ', error)
             	 }
         	 });
		})
	</script>
</head>
<body class="subpage">

<%@ include file="/WEB-INF/views/project/generic.jspf" %>   

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Save The Animal</p>
				<h2>봉사활동 정보</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<div class="container">
						  <div class="activity-info">
						    <c:if test="${ not empty detail.volunteerFile }">
						    	<img src="/resources/images/storage/volunteer/${ detail.volunteerFile }" alt="봉사활동 이미지">
						    </c:if>
						    <c:if test="${ empty detail.volunteerFile }">
						    	<img src="/resources/images/walk.jpg" alt="봉사활동 이미지">
					    	</c:if>
						    <div class="info-text">
						      <h2>${ detail.volunteerTitle }</h2>
						      <table>
						      	<tbody>
						      		<tr>
						      			<th>활동 날짜</th>
						      			<td id="volunteerTime">${ detail.volunteerTime }</td>
					      			</tr>
					      			<tr>
						      			<th>신청 마감</th>
						      			<td id="volunteerDue">${ detail.volunteerDue }</td>
					      			</tr>
					      			<tr>
						      			<th>참가 비용</th>
						      			<td id="volunteerCost">${ detail.volunteerCost }</td>
					      			</tr>
					      			<tr>
						      			<th>주 소</th>
						      			<td id="showMap">${ detail.volunteerLocation }<span>[지도보기]</span></td>
					      			</tr>
					      			<tr>
					      				<td colspan="2">
					      					<div id="map"></div>
				      					</td>
		      						</tr>
						      	</tbody>
						      </table>
						    </div>
						  </div>
						  <div id="map"></div>
						  <div class="button-container">
						        <a href="#" class="button" onclick="openModal()">봉사 신청하기</a>
   						        <a href="/project/volunteer" class="button">목록 돌아가기</a>
						  </div>
						  <div class="underline"></div>
						  <div class="details" style="text-align: left;">
						    <h2>세부사항</h2>
						    <p>${ detail.volunteerDetail }</p>
						    <button type="button" id="deleteBtn">삭제</button>
						  </div>
						</div>
					</header>
				</div>
			</div>
		</div>
		<!-- 모달 팝업 컨테이너 -->
		<div id="myModal" class="modal">
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    <div class="container">
		    <form id="applicationForm">
		      <h2>봉사활동 신청</h2>
		      <!-- 아이디 입력란(백엔드에서 처리) -->
		      <!-- 봉사공고 아이디(팝업 뜨게한 버튼 누른 페이지의 volunteerId) -->
		      <input type="hidden" id="volunteerId" name="volunteerId" value="${ detail.volunteerId }">
		      <!-- 로그인 정보로 얻어온 회원 아이디(백엔드에서 처리) -->
		      <input type="hidden" id="userId" name="userId" value="${ userLogin.userId }">
		      <div class="form-group">
		        <!-- 봉사 다짐 입력란 -->	
		        <label for="applicationComment">봉사 다짐</label>
		        <textarea id="applicationComment" name="applicationComment" rows="4"></textarea>
		      </div>
		      <button type="button" id="applicationBtn">신청하기</button>
		    </form>
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
</body>

</html> 