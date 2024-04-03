<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin.jspf"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

    <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">입양 상담 신청 관리</h1>
    </div>

    <div class="container">

        <!-- 상담 신청 리스트 테이블 -->
        <div id="counselingList">
            <table class="table table-boardered table-striped-columns table table-bordered">
                <thead>
                <tr class="text-center">
                    <th class="col-md-1">예약 고유 ID</th>
                    <th class="col-md-2">예약일정</th>
                    <th class="col-md-1">회원ID</th>
                    <th class="col-md-1">입양공고ID</th>
                    <th class="col-md-1">동물ID</th>
                    <th class="col-md-1">예약신청일자</th>
                    <th class="col-md-1">적격판정</th>
                    <th class="col-md-3">상담내용</th>
                    <th class="col-md-1">입양/임시보호구분</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${admincounselingList}" var="counseling">
                    <tr>
                        <td>${counseling.counselingId}</td>
                        <td>${counseling.counselingSchedule}</td>
                        <td>${counseling.userId}</td>
                        <td>${counseling.adoptionId}</td>
                        <td>${counseling.animalId}</td>
                        <td>${counseling.counselingDate}</td>
                        <td>${counseling.counselingJudgment}</td>
                        <td>${counseling.counselingDetail}</td>
                        <td>${counseling.counselingAdopt}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</main>
</div>
</div>
<script src="/resources/include/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/include/js/counseling/admincounselingList.js"></script>

<script
        src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
        integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
        crossorigin="anonymous"></script>
<script src="/resources/include/js/dashboard.js"></script>
</body>
</html>
