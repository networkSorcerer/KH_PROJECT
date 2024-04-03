$(function() {
    /* 수정 버튼 클릭 시 처리 이벤트 */
    $("#editButton").on("click", function () {
        if (!chkData("#userId", "유저 아이디을")) return;
        else if (!chkData("#userName", "성명을")) return;
        else if (!chkData("#counselingAge", "나이을")) return;
        else if (!chkData("#counselingAddress", "주소을")) return;
        else if (!chkData("#userPhone", "핸드폰 번호을")) return;
        else if (!chkData("#counselingJob", "직업을")) return;
        else if (!chkData("#counselingSchedule", "상담 예약일자")) return;
        else if (!chkData("#survey1", "입양 질문1번을")) return;
        else if (!chkData("#survey2", "입양 질문2번을")) return;
        else if (!chkData("#survey3", "입양 질문3번을")) return;
        else if (!chkData("#survey4", "입양 질문4번을")) return;
        else if (!chkData("#survey5", "입양 질문5번을")) return;
        else if (!chkData("#survey6", "입양 질문6번을")) return;
        else if (!chkData("#survey7", "입양 질문7번을")) return;
        else if (!chkData("#survey8", "입양 질문8번을")) return;

        else {
            console.log();
            $("#detail_form").attr({
                method: "post",
                action: "/counseling/counselingUpdate"
            });
            $("#detail_form").submit();
        }
    })
})
$(function() {
    $("#deleteButton").on("click", function() {

        $("#detail_form").attr({
            method:"post",
            action:"/counseling/counselingDelete"
        });
        $("#detail_form").submit();
    })

})