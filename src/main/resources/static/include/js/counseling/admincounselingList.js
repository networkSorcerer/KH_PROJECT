$(function() {
    // 적격판정 및 상담내용 클릭 이벤트 핸들러
    $('#counselingList').on('click', 'td:nth-child(7), td:nth-child(8)', function() {
        // 상담의 고유 ID 가져오기
        var counselingId = $(this).closest('tr').find('td:first').text();

        // 상세 페이지 URL 생성
        var detailUrl = "/counseling/adminCounselingDetail?counselingId=" + counselingId;

        // 페이지 이동
        window.location.href = detailUrl;
    });
});
