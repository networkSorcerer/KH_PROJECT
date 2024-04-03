<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
	<link rel="stylesheet" href="/resources/include/assets/css/main.css">
	<main>
	<div>
		<div><h1>후원변경</h1></div>
		<div><h2>수정하실 항목을 체크후 정보를 입력해 주세요</h2></div>
		
		<div>
		<form>
		<table>
			<tr>
				<th><input type="checkbox" class="donate_price_Btn"></th>
				<td><label for="do_price">결제 금액</label></td>
				<td><input type="text" id="do_price" name="do_price"></td>	
			</tr>
			<tr>
				<th><input type="checkbox" class="donate_PM_Btn"></th>
				<td><label for="do_price">결제 금액</label></td>
				<td><input type="text" id="do_pm" name="do_pm" value="신용카드" readonly="readonly"></td>	
			</tr>
		</table>
		
		<br>
		<br>
		<br>
		
		<table>
			<tr>
				<td rowspan="2"></td>
				<td>예금주 명</td>
				<td><input type="text" id="do_ahname" name="do_ahphone" value="${do_ahname}"></td>
			</tr>
			<tr>
				<td>예금주 번호</td>
				<td><input type="text" id="do_ahphone" name="do_ahphone" value="${do_ahphone}"></td>
			</tr>
		</table>
		
		<div>
		<button type="button" id="donate_Update_Btn" name="donate_Update_Btn">후원 변경하기</button>
		</div>
		</form>
		</div>
		
	</div>
	</main>
	</body>
</html>