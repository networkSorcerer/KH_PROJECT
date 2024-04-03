<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
	<!-- css 적용 -->
	<link rel="stylesheet" href="/resources/include/css/volunteer/volunteerDetail.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94063d37acee8b8586233e93d841bf07&libraries=services"></script>
	<script>
	function ajaxRequest(url, data, type) {
        return new Promise(function(resolve, reject) {
            $.ajax({
                type: "post",
                url: url,
                data: data,
                success: function(response) {
                    resolve(response);
                    alert(type+"정보 변경되었습니다.")
                },
                error: function(error) {
                    reject(error);
                }
            });
        });
    }
	 // 날짜 및 시간 형식 변환 함수
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
		$(function() {
	        formatDateTime('volunteerDue');
			var volunteerId = ${ detail.volunteerId };
			console.log(volunteerId);
			$.ajax({
			    url: '/application/' + volunteerId,
			    method: 'POST',
			    success: function(response) {
			    	console.log(response);
			        var list = '<ul>';
			        $.each(response, function(index, item) {
			        	var userId = item.user.userId
			        	var applicationId = item.applicationId
			        	console.log(applicationId);
			            list += '<li data-id=' + userId + ' data-app=' + applicationId + '>아이디: ' +userId + ', 성함: ' + item.user.userName + ', ';
			            list += "참여<input type='radio' name='attendance" + index + "' value='참여' checked />"
			            list += "불참<input type='radio' name='attendance" + index + "' value='불참' />"
			            list += '</li>';
			        });
			        list += '</ul>';
			        $('#appList').html(list);
			    },
			    error: function(xhr, status, error) {
			        console.log('Error: ', xhr, status, error)
			    }
			});
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
                },
                error: function(xhr, status, error) {
                    console.error('Error: ', error)
                }
            });
			/* 수정 폼으로 이동 스크립트 */
			$("#updateBtn").on("click", function() {
				location.href="/volunteer/volunteerUpdateForm?volunteerId="+volunteerId;
			})
			
			/* 삭제 스크립트 */
			$("#deleteBtn").on("click", function() {
				if(confirm("정말 삭제하시겠습니까?")){
					location.href="/volunteer/volunteerDelete?volunteerId="+volunteerId;
				}
			})
			/* 참여 확인 클릭 시 이벤트 */
			$("#submitBtn").on("click", function() {
				var dataToSend = [];
				var dataToApplicationId = [];
				
				// "참여" 라디오 버튼 값만 처리
				$("input[type='radio']:checked").each(function() {
					console.log($(this).val());
					if($(this).val ()	== "참여") {
						var userId = $(this).closest('li').data('id');
						var appId = $(this).closest('li').data('app');
						dataToSend.push( userId );
						dataToApplicationId.push( appId );
						console.log(typeof(dataToSend));
						console.log(dataToApplicationId);
					}
				})
				if(dataToSend.length === 0 && dataToApplicationId.length === 0) {
					alert("참석인원이 1명 이상이어야 합니다");
				} else {
					ajaxRequest("/application/increaseUserVolCnt", "userIds="+dataToSend, "참여")
					.then(() => {
						return ajaxRequest("/application/changeResult", "applicationIds="+dataToApplicationId, "봉사 활동 횟수")
					})
				}
				
				// 서버로 데이터 전송
				/* $.ajax({
					url : '/application/increaseUserVolCnt',
					method : 'POST',
					//data : JSON.stringify(dataToSend),
					data:"userIds="+dataToSend,
					success : function(response) {
						console.log(response);
						alert("참여 확인 되었습니다.");
					},
					error: function(xhr, status, error) {
						console.error(error);
						alert("오류가 발생했습니다. 다시 시도해 주세요.");
					}
				}) */
			})
		})	
	</script>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">봉사공고</h1>
	</div>
	<div class="container">
		<!-- 여기에 페이지 구현하세요 -->
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
					      			<td>${ detail.volunteerTime }</td>
				      			</tr>
				      			<tr>
					      			<th>신청 마감</th>
					      			<td id="volunteerDue">${ detail.volunteerDue }</td>
				      			</tr>
				      			<tr>
					      			<th>참가 비용</th>
					      			<td>${ detail.volunteerCost }</td>
				      			</tr>
				      			<tr>
					      			<th>주 소</th>
					      			<td id="showMap">${ detail.volunteerLocation }<span>[지도보기]</span></td>
				      			</tr>
				      			<tr>
				      				<td colspan="2" id="mapLine">
				      					<div id="map"></div>
			      					</td>
	      						</tr>
					      	</tbody>
					      </table>
					    </div>
					  </div>
					  <div id="map"></div>
					  <div class="button-container">
							<a href="/project/adminVolunteerList" class="button">목록 돌아가기</a>
					  </div>
					  <div class="underline"></div>
					  <div class="details" style="text-align: left;">
					    <h2>세부사항</h2>
					    <p>${ detail.volunteerDetail }</p>
					  </div>
					</div>
					<div class="underline"></div>
					<div id="appList"></div>
					<button type="button"  id="submitBtn" >참여 확인</button>
					<div class="underline"></div>
					<div id="button">
						<button type="button" id="updateBtn">수정</button>
						<button type="button" id="deleteBtn">삭제</button>
					</div>
				</header>
			</div>
		</div>
	</div>
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

</body>
</html>
