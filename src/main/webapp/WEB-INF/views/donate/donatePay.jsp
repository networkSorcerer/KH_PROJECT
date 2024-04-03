<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제화면 구현</title>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
		<script src="/resources/include/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/include/css/donate/donatePay.css" />

		<script src="/resources/include/js/donate/donatePay.js"></script>

</head>
<body>
<header>
</header>
<main>
    <div id="donate_pay" class="donatePay_data">
        <h1>유기견의 가족이 되어주세요</h1>
        <form>
        	<h2>후원 정보</h2>
            <table class="priceSelect">
                <thead>
                    
                    <tr>
                        <th colspan="3">후원 금액을 선택해 주세요</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label><input type="radio" name="do_price" value="10000" class="price_Select">10,000원</label></td>
                        <td><label><input type="radio" name="do_price" value="20000" class="price_Select">20,000원</label></td>
                        <td><label><input type="radio" name="do_price" value="30000" class="price_Select">30,000원</label></td>
                    </tr>
                    <tr>
                        <td><label><input type="radio" name="do_price" value="40000" class="price_Select">40,000원</label></td>
                        <td><label><input type="radio" name="do_price" value="50000" class="price_Select">50,000원</label></td>
                        <td><label><input type="radio" name="do_price" value="Select" class="price_Select">직접입력</label></td> <!-- 텍스트 누를시 다른 체크 박스 강제 아웃 시켜야 한다. -->
                    </tr>
                    <tr>
                        <td colspan="3"><label for="do_price"><input type="text" id="do_price" name="do_price" class="input_Select" >원</label></td>
                    </tr>
                </tbody>
            </table>
            <div class="warning">
            	<p>※ 세이브 더 애니멀에 후원해 주셔서 감사합니다.</p>
            </div>
            <h2>결제 정보</h2>
            <table class="priceData">
                <thead>
                
                </thead>
                <tbody>
                    <tr>
                        <th>결제 수단</th>
                        <td><input type="text" value="카드결제" readonly></td>
                    </tr>
                    <tr>
                        <th>카드 주명</th>
                        <td><input type="text" id="do_ahName"></td>
                    </tr>
                    <tr>
                        <th>카드주 휴대폰</th>
                        <td><input type="text" id="do_ahPhone" placeholder="' - '없이 입력해주세요"  maxlength="11"></td>
                    </tr>
                </tbody>
            </table>
            <div class="warning">
                <p>※ 신용카드후원 시 나이스빌링, 나이스_정기과금, 후원금_나이스 또는 Nice로 표시되어 청구됩니다.</p>
            </div>
            <div class="Privacy_Check">
                <label for="Privacy_Check1"><input type="checkbox" id="Privacy_Check1" name="Privacy_Check1" required>개인정보 수집 이용약관의 동의합니다.</label>
                <button type="button" id="Privacy_Check_Detail_Btn">상세 보기</button>
            </div>
        </form>
        
    
        <button class="donatePayBtn" id="donate_pay_Btn">결제하기</button> <!-- FORM에 안들어감 -->
    </div>
    <script src="https://pay.nicepay.co.kr/v1/js/"></script>

	<script>
	$(document).ready(function() {
	    $("#donate_pay_Btn").click(function() {
	        // serverAuth() 함수 호출
	        serverAuth();
	    });
	});
	
	function serverAuth() {
	  AUTHNICE.requestPay({
	    clientId: 'S2_5cf74e98f5d141f88c7f15beddca90d9',
	    method: 'kakaopayCard',
	    orderId: "유니크한 상품 번호",
	    amount: amount_num(Integer),
	    goodsName: '나이스페이-상품',
	    returnUrl: 'http://localhost:8080/donate/donateUnit',
	    fnError: function (result) {
	      alert('고객용메시지 : ' + result.msg + '\n개발자확인용 : ' + result.errorMsg + '')
	    }
	  });
	}

	</script>
</main>

</body>
</html>