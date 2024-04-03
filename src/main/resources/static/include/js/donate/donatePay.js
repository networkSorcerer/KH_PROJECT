$(function (){
	
			  $("#do_price").on("keyup", function () {
			    // 입력값에서 숫자만 추출합니다.
			    let num = $(this)
			      .val()
			      .replace(/[^0-9]/g, "");


			    // 변환된 숫자를 입력 상자에 설정합니다.
			    $(this).val(num);
			  });

			  // 직접입력 라디오 버튼에 대한 변경 이벤트 처리
			  $(document).ready(function () {
			    $(".price_Select").change(function () {
			      if ($(this).val() === "Select") {
			        $(".input_Select").prop("disabled", false).focus();
			      } else {
			        $(".input_Select").prop("disabled", true).val("");
			      }
			    });
			  });

			  $(document).ready(function () {
			    $(".price_Select").click(function () {
			      // 모든 라벨의 클래스 제거
			      $(".price_Select").parent().removeClass("selected");

			      // 선택된 라벨에 클래스 추가
			      $(this).parent().addClass("selected");
			    });
			  });

			  $("#do_ahPhone").on("keyup", function () {
			    // 입력값에서 숫자만 추출합니다.
			    let num = $(this)
			      .val()
			      .replace(/[^0-9]/g, "");

			    $(this).val(num);
			  });
			  
			// 라디오 버튼 변경 시 호출되는 함수
		        $('input[name="do_price"]').change(function() {
		            var selectedValue = $('input[name="do_price"]:checked').val(); // 선택된 라디오 버튼의 값 가져오기
		            var inputAmount = $('.input_Select').val(); // 직접입력된 값 가져오기
		            var amount_num = 0;

		            if (selectedValue === 'Select') {
		                // 직접입력이 선택된 경우
		                var userInput = parseInt(inputAmount);
		                if (!isNaN(userInput)) {
		                	amount_num = userInput;
		                }
		            } else {
		                // 다른 라디오 버튼이 선택된 경우
		                amount_num = parseInt(selectedValue);
		            }

		            // amount 값을 설정하는 부분 (여기서는 예시로 console.log로 출력)
		            console.log('설정된 금액:', amount_num);
		        });
			});

	
	
	$("#dontePayBtn").on("click", ()=> {
		console.log("결제 입력정보 확인");
		
		$.ajax({
			url: "/donate/donateInsert",
			type: "POST",
			data: $("#donate_pay"),
			sucssec: function(){
				console.log("데이터 저장 성공")
			},
			Error: function(){
				console.log("데이터 저장 실패")
			}
			
		})
		
});