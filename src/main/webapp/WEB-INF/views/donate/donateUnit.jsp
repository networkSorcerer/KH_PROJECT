<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
	<link rel="stylesheet" href="/resources/include/assets/css/main.css">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="/resources/include/css/donate/donateUnit.css">
	<script src="/resources/include/js/donate/donateUnit.js"></script>
<%@ include file="/WEB-INF/views/project/generic.jspf" %>   

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Save The Animal</p>
				<h2>후원 정보 확인</h2>
			</header>
		</div>
	</section>
	<main>
        <div class="donate_user">
            <h3 class="thank_msg"><strong>당신의 따뜻한 후원에 감사드립니다.</strong></h3>
            <table class="donate_data_name">
            	<tr>
            	<td>
                <div class="donate_data_box">
                <b>후원 정보</b>
                </div>
                </td>
                <td><button type="button" id="donateUpdateBtn">후원변경 하기</button></td>
                <td><button type="button" id="donateDeleteBtn">후원해지 하기</button></td>
                </tr>
            </table>

            <form>
                <table id="donate_data">
                    <tr>
                        <th>결제 수단</th><td>${do_pm}</td>
                    </tr>
                    <tr>
                        <th>결제 금액</th><td>${do_price}</td>
                    </tr>
                    <tr>
                        <th>총 결제 금액</th><td>${do_sprice}</td>
                    </tr>
                    <tr>
                        <th>결제 일정</th><td>${do_day}</td>
                    </tr>
                    <tr>
                        <th>최초 결제 날짜</th><td>${do_fday}</td>
                    </tr>
                    <tr>
                        <th>후원번호</th><td>${do_id}</td>
                    </tr>
                </table>
            </form>
        </div>
    </main>
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