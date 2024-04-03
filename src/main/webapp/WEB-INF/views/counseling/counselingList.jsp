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
            <h2>입양상담 목록</h2>
        </header>
    </div>
</section>

<!-- Two -->
<section id="two" class="wrapper style2">
    <div class="inner">
        <div class="box">
            <div class="content">
                <header class="align-center">
                    <h2>신청 목록</h2>
                </header>
                <p>내용</p>
                <table border="1">
                    <thead>
                    <tr>
                        <th>상담일정</th>
                        <th>회원ID</th>
                        <th>입양공고ID</th>
                        <th>동물ID</th>
                        <th>상담일자</th>
                        <th>적격판정</th>
                        <th>자세히 보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${counselingList}" var="counseling">
                        <tr>
                            <td>${counseling.counselingSchedule}</td>
                            <td>${counseling.userId}</td>
                            <td>${counseling.adoptionId}</td>
                            <td>${counseling.animalId}</td>
                            <td>${counseling.counselingDate}</td>
                            <td>${counseling.counselingJudgment}</td>
                            <td>
                                <!-- "자세히 보기" 링크 추가 -->
                                <a href="/counseling/counselingDetail?counselingId=${counseling.counselingId}">자세히 보기</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
