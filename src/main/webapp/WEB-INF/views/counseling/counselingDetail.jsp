<%@ page import="com.spring.counseling.vo.SurveyRequestVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<link rel="stylesheet" href="/resources/include/assets2/css/main.css">

</head>
<body class="subpage">

<%@ include file="/WEB-INF/views/project/generic.jspf" %>

<!-- One -->
<section id="One" class="wrapper style3">
    <div class="inner">
        <header class="align-center">
            <p>Save The Animal</p>
            <h2>입양 상담 신청서</h2>
        </header>
    </div>
</section>

<!-- Two -->
<section id="two" class="wrapper style2">
    <div class="inner">
        <div class="box">
            <div class="content">
                <form id="detail_form">
                    <header class="align-center">
                        <p>신상 정보</p>
	                        <input type="hidden" id="counselingId" name="counselingId" value="${ counselingDetail.counselingId }" />
	                        <input type="hidden" id="userId" name="userId" value="${ counselingDetail.userId }" />
	                        <input type="text" id="userName" name="userName" value="${ counselingDetail.userName }" placeholder="성명" readonly>
	                        <input type="text" id="counselingAge" name="counselingAge" value="${ counselingDetail.counselingAge }"placeholder="연령">
	                        <input type="text" id="counselingAddress" name="counselingAddress" value="${ counselingDetail.counselingAddress }"placeholder="주소">
	                        <input type="text" id="userPhone" name="userPhone" value="${ counselingDetail.userPhone }"placeholder="전화번호">
	                        <input type="text" id="counselingJob" name="counselingJob" value="${ counselingDetail.counselingJob }"placeholder="직업">
					</header>                    

                    <hr>
                    <h3>상담 예약 날짜 </h3>
                    <label for="counselingSchedule"></label><br>
                    <input type="date" id="counselingSchedule" name="counselingSchedule" value="${counselingDetail.counselingSchedule}" placeholder="예약날짜">

                    <hr>
                    <h3>입양질문</h3>
                    <ol>
                        <li><strong><%= SurveyRequestVO.SurveyA1 %>:</strong> <input type="text" id="survey1" name="survey1"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA2 %>:</strong> <input type="text" id="survey2" name="survey2"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA3 %>:</strong> <input type="text" id="survey3" name="survey3"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA4 %>:</strong> <input type="text" id="survey4" name="survey4"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA5 %>:</strong> <input type="text" id="survey5" name="survey5"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA6 %>:</strong> <input type="text" id="survey6" name="survey6"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA7 %>:</strong> <input type="text" id="survey7" name="survey7"></li>
                        <li><strong><%= SurveyRequestVO.SurveyA8 %>:</strong> <input type="text" id="survey8" name="survey8"></li>
                    </ol>

                    <div style="float: right;">
                        <button type="button" id="editButton">수정</button>
                        <button type="button" id="deleteButton">삭제</button>
                    </div>
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
<script src="/resources/include/js/counseling/counselingDetail.js"></script>
<script src="/resources/include/assets2/js/jquery.min.js"></script>
<script src="/resources/include/assets2/js/jquery.scrollex.min.js"></script>
<script src="/resources/include/assets2/js/skel.min.js"></script>
<script src="/resources/include/assets2/js/util.js"></script>
<script src="/resources/include/assets2/js/main.js"></script>
</body>
</html>