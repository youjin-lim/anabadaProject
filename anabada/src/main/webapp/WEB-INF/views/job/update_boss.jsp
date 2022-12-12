<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 포함되는 문자열인지 찾으려고 fn 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 공고 쓰기</title>
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<style>
   .chk input[type='radio'] {
      display:none;
   }
   .chk input[type='radio']+span {
      display:inline-block;
      padding:5px 5px;
      border:1px solid #AEB6BF;
      border-radius:10px;
      background-color:white;
      text-align:center;
      cursor:pointer;
   }
   .chk input[type='radio']:checked+span {
      background-color:#8E9091;
      color:white;
      border-radius:10px;
   }
   
   .chk input[type='checkbox'] {
      display:none;
   }
   .chk input[type='checkbox']+span {
      display:inline-block;
      padding:5px 5px;
      border:1px solid #AEB6BF;
      border-radius:10px;
      background-color:white;
      text-align:center;
      cursor:pointer;
   }
   .chk input[type='checkbox']:checked+span {
      background-color:#8E9091;
      color:white;
      border-radius:10px;
   }
   
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$("input[name='j_term']").click(function () { // 하루, 몇개월....
			
			if($(this).val() == "하루"){
				$("#a_day").css("display", "inline");
				$("#days").css("display", "none");
				$("#ymdpicker").val("");
				
			}else{
				$("#a_day").css("display", "none");
				$("#days").css("display", "inline");
				/* $(".d_days").each(function(index,element){
					$(this).prop('checked', false);
				}); */
			}
		});	
		
		
		// submit 눌렀을 때 체크할 것들
		$("button[type='submit']").click(function () {
			
			var title = $("input[name='j_title']").val();
			var company = $("input[name='j_company']").val();
			var addr1 = $("input[name='j_addr1']").val();
			var addr2 = $("input[name='j_addr2']").val();
			var pay = $("input[name='j_pay']").val();
			var cate = $("input:checkbox[name='j_cate']").is(":checked")
			var term = $("input:radio[name='j_term']").is(":checked")
			
			// 근무기간/요일
			var now = new Date();
		    var year = now.getFullYear();
		    var month = now.getMonth() + 1;//1월이 0으로 되기때문에 +1을 함.
		    var date = now.getDate();
		    var today = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+date.toString()).slice(-2)); // 오늘 날짜(문자)
		    var n_today = today.replace(/-/gi,''); //오늘 날짜(숫자로 ex)20201212)
			var n_select = $("#ymdpicker").val().replace(/-/gi, '');
		    var plus = parseInt(n_select - n_today);
			
		    var start = $("select[name='j_start']").val();
		    var end = $("select[name='j_end']").val();
		    var content = $("textarea[name='j_content']").val();
		    
			// 1.제목 null 체크
			if(title == ""){
				$("#ti_null").text("제목을 작성해주세요.");
	    		$("#ti_null").css("color", "red");
	    		return false;
			}else{
				$("#ti_null").text("");
			}
			
			// 2.상호명 null 체크
			if(company == ""){
				$("#com_null").text("상호명을 작성해주세요.");
	    		$("#com_null").css("color", "red");
	    		return false;
			}else{
				$("#com_null").text("");
			}
			
			// 3.주소 null 체크
			if(addr1 == ""){
				$("#a_null").text("주소를 작성해주세요.");
	    		$("#a_null").css("color", "red");
	    		return false;
			}else{
				$("#a_null").text("");
			}
			
			// 4.주소 상세보기 null 체크
			if(addr2 == ""){
				$("#aa_null").text("상세주소를 작성해주세요.");
	    		$("#aa_null").css("color", "red");
	    		return false;
			}else{
				$("#aa_null").text("");
			}
			
			// 5.카테고리 null 체크
			if(!cate){
				$("#ca_null").text("카테고리를 한개 이상 선택해주세요.");
	    		$("#ca_null").css("color", "red");
	    		return false;
			}else{
				$("#ca_null").text("");
			}
			
			// 6.임금 null 체크
			if(pay == ""){
				$("#p_null").text("임금을 작성해주세요.");
	    		$("#p_null").css("color", "red");
	    		return false;
			}else{
				$("#p_null").text("");
			}
			
			// 7.근무기간 null 체크
			if(!term){
				$("#te_null").text("카테고리를 한개 이상 선택해주세요.");
	    		$("#te_null").css("color", "red");
	    		return false;
			}else{
				$("#te_null").text("");
			}
			
			// 8.근무요일 null 체크
			if($("#j_term1").is(":checked") == false) {// 개월인데,
				if($("input:checkbox[name='j_day']").is(":checked") == false){//요일 중에 체크 없을 때
					$("#d_null").text("요일을 선택해주세요.");
		    		$("#d_null").css("color", "red");
		    		return false;
				}else if($("input:checkbox[name='j_day']").is(":checked") == true){ // 요일 체크했을 때
					$("#ymdpicker").val("");
					$("#d_null").text("");
				}
			}else if($("#j_term1").is(":checked") == true){// 하루인데,
				if(plus <= 0){ // 잘못 선택했을 때
					$("#d_null").text("날짜를 선택해주세요.");
		    		$("#d_null").css("color", "red");
		    		return false;
				}else if(plus > 0){ // 잘 선택했을 떄
					$(".d_days").each(function(index,element){
						$(this).prop('checked', false);
					});
					$("#d_null").text("");
				}
			}
			
			// 9.알바시간 체크
			if(start == 0 && end == 0){
				$("#se_null").text("알바시간을 체크해주세요.");
	    		$("#se_null").css("color", "red");
	    		return false;
			}else{
				$("#se_null").text("");
			}
			
			// 10.내용 null 체크
			if(content == ""){
				$("#con_null").text("내용을 작성해주세요.");
	    		$("#con_null").css("color", "red");
	    		return false;
			}else{
				$("#con_null").text("");
			}
		
		});
		
	});
	
</script>
</head>
<body>
	<form name="update_boss" action="/job/update_boss" method="post">
		<table>
		<!-- 수정해도 등록날짜는 안바뀌도록 했음 -->
			<tr>
				<td colspan="2">알바 공고 쓰기</td>	
			</tr>
				
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="j_title" id="j_title" value="${j_update.j_title }"><br>
					<font id="ti_null"></font>
				</td>
			</tr>
			
			<tr>
				<td>상호명</td>
				<td>
					<input type="text" name="j_company" id="j_company" value="${j_update.j_company }"><br>
					<font id="com_null"></font>
				</td>
			</tr>
			
			<tr>
            	<td>주소</td>
            	<td>
            		<input type="text" id="j_addr1" name="j_addr1" value="${j_update.j_addr1 }" readonly><br>
            		<font id="a_null"></font>
            	</td>
        	</tr>
        	<tr>
            	<td>상세 주소</td>
            	<td>
            		<input type="text" name="j_addr2" id="j_addr2" value="${j_update.j_addr2 }"><br>
            		<font id="aa_null"></font>
            	</td>
       		</tr>
			
			<tr>
				<td>카테고리</td>
				<td>
					<c:set var="j_cate" value="${j_update.j_cate }"/>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="서빙" id="j_cate1"
						<c:if test="${fn:contains(j_cate, '서빙')}"> checked </c:if>>
						<span>서빙</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="매장관리/판매" id="j_cate1"
						<c:if test="${fn:contains(j_cate, '매장관리')}"> checked </c:if>>
						<span>매장관리/판매</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="주방보조" id="j_cate2"
						<c:if test="${fn:contains(j_cate, '주방보조')}"> checked </c:if>>
						<span>주방보조</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="사무보조" id="j_cate3"
						<c:if test="${fn:contains(j_cate, '사무보조')}"> checked </c:if>>
						<span>사무보조</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="음료제작" id="j_cate4"
						<c:if test="${fn:contains(j_cate, '음료제작')}"> checked </c:if>>
						<span>음료 제작</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="베이킹" id="j_cate5"
						<c:if test="${fn:contains(j_cate, '베이킹')}"> checked </c:if>>
						<span>베이킹</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="전단지" id="j_cate6"
						<c:if test="${fn:contains(j_cate, '전단지')}"> checked </c:if>>
						<span>전단지</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_cate" value="기타" id="j_cate7"
						<c:if test="${fn:contains(j_cate, '기타')}"> checked </c:if>>
						<span>기타</span>
					</label>
					<br>
					<font id="ca_null"></font>
				</td>
			</tr>
			
			<tr>
				<td>임금방법</td>
				<td>
					<select name="j_method">
						<option id="j_method1" value="월급" <c:if test="${j_update.j_method eq '월급'}"> selected </c:if>>월급
						<option id="j_method2" value="주급" <c:if test="${j_update.j_method eq '주급'}"> selected </c:if>>주급
						<option id="j_method3" value="시급" <c:if test="${j_update.j_method eq '시급'}"> selected </c:if>>시급
						<option id="j_method4" value="건당" <c:if test="${j_update.j_method eq '건당'}"> selected </c:if>>건당
					</select>
					<input type="text" name="j_pay" id="j_pay" value="${j_update.j_pay }"/>원<br>
					<font id="p_null"></font>
				</td>
			</tr>	
			
			<tr>
				<td>근무기간</td>
				<td>
					<c:set var="j_term" value="${j_update.j_term }"/>
					<label class="chk">
						<input type="radio" name="j_term" value="하루" id="j_term1"
						<c:if test="${j_update.j_term eq '하루'}"> checked </c:if>>
						<span>하루</span>
					</label>
					<label class="chk">
						<input type="radio" name="j_term" value="3개월이하" id="j_term2"
						<c:if test="${j_update.j_term eq '3개월이하'}"> checked </c:if>>
						<span>3개월 이하</span>
					</label>
					<label class="chk">
						<input type="radio" name="j_term" value="3~6개월" id="j_term3"
						<c:if test="${j_update.j_term eq '3~6개월'}"> checked </c:if>>
						<span>3~6개월</span>
					</label>
					<label class="chk">
						<input type="radio" name="j_term" value="6개월~1년" id="j_term4"
						<c:if test="${j_update.j_term eq '6개월~1년'}"> checked </c:if>>
						<span>6개월~1년</span>
					</label>
					<label class="chk">
						<input type="radio" name="j_term" value="1년이상" id="j_term5"
						<c:if test="${j_update.j_term eq '1년이상'}"> checked </c:if>>
						<span>1년 이상</span>
					</label>
					<br>
					<font id="te_null"></font>
				</td>
			</tr>
			
			<tr>
				<td>근무일</td>
				<td>
					<c:set var="j_day" value="${j_update.j_day }"/>
					<div id="a_day" <c:choose>
					<c:when test="${fn:contains(j_day, '-')}"> style='display: inline' </c:when>
					<c:otherwise>style='display: none'</c:otherwise>
					</c:choose>>
						<input class="input-date" type="text" id="ymdpicker" name="j_day" 
						<c:if test="${fn:contains(j_day, '-')}"> value="${j_day }" readonly </c:if>>
					</div>
					
					<div id="days" <c:choose>
					<c:when test="${fn:contains(j_day, '-')}"> style='display: none' </c:when>
					<c:otherwise>style='display: inline'</c:otherwise>
					</c:choose>>
						<label class="chk">
							<input type="checkbox" name="j_day" value="월" id="j_day1"
							<c:if test="${fn:contains(j_day, '월')}"> checked </c:if>>
							<span>월</span>
						</label>
						<label class="chk">
							<input type="checkbox" name="j_day" value="화" id="j_day2"
							<c:if test="${fn:contains(j_day, '화')}"> checked </c:if>>
							<span>화</span>
						</label>
						<label class="chk">
							<input type="checkbox" name="j_day" value="수" id="j_day3"
							<c:if test="${fn:contains(j_day, '수')}"> checked </c:if>>
							<span>수</span>
						</label>
						<label class="chk">
							<input type="checkbox" name="j_day" value="목" id="j_day4"
							<c:if test="${fn:contains(j_day, '목')}"> checked </c:if>>
							<span>목</span>
						</label>
						<label class="chk">
							<input type="checkbox" name="j_day" value="금" id="j_day5"
							<c:if test="${fn:contains(j_day, '금')}"> checked </c:if>>
							<span>금</span>
						</label>
						<label class="chk">
							<input type="checkbox" name="j_day" value="토" id="j_day6"
							<c:if test="${fn:contains(j_day, '토')}"> checked </c:if>>
							<span>토</span>
						</label>
						<label class="chk">
							<input type="checkbox" name="j_day" value="일" id="j_day7"
							<c:if test="${fn:contains(j_day, '일')}"> checked </c:if>>
							<span>일</span>
						</label>
					</div>
					<br>
					<font id="d_null"></font>
				</td>
			</tr>
			
			<script type="text/javascript" src="../resources/js/jquery-1.11.1.min.js"></script>
			<script type="text/javascript" src="../resources/js/jquery-ui.min.js"></script>
			<script type="text/javascript" src="../resources/js/jquery.mtz.monthpicker.js"></script>
			<script>
				 $(function () {
					//모든 datepicker에 대한 공통 옵션 설정
					$.datepicker.setDefaults({
						dateFormat: 'yy-mm-dd' //Input Display Format 변경
						, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
						, changeYear: true //콤보박스에서 년 선택 가능
						, changeMonth: true //콤보박스에서 월 선택 가능
						, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
						, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
						, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
						, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
					});
			
					$(".input-date").datepicker();
			
				 });
				
			</script>
			
			
			<tr>
				<td>알바시간</td>
				<td>
					<font>시작 시간</font>
					<select id="j_start" name="j_start">
						<c:set var="j_start" value="${j_update.j_start }"/>
						<c:forEach var="i" begin="1" end="24" step="1" >
							<option value="<c:out value='${i}'/>" <c:if test="${j_update.j_start eq i}"> selected </c:if>><c:out value="${i}"/>시</option>
						</c:forEach>
					</select>
					<font>~끝나는 시간</font>
					<select id="j_end" name="j_end">
						<c:set var="j_end" value="${j_update.j_end }"/>
						<c:forEach var="i" begin="1" end="24" step="1" >
							<option value="<c:out value='${i}'/>" <c:if test="${j_update.j_end eq i}"> selected </c:if>><c:out value="${i}"/>시</option>
						</c:forEach>
					</select>
					<font id="se_null"></font>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea id="j_content" name="j_content" style="resize: none; width: 80%;">${j_update.j_content }</textarea>
					<!-- textarea height 다시 설정하기 -->
					<div id="con_null"></div>
				</td>
			</tr>
			
			<tr>
				<td>기타(선택사항)</td>
				<td>
					<c:set var="j_etc" value="${j_update.j_etc }"/>
					<label class="chk">
						<input type="checkbox" name="j_etc" value="4대보험" id="j_etc1"
						<c:if test="${fn:contains(j_etc, '4대보험')}"> checked </c:if>>
						<span>4대 보험</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_etc" value="퇴직금 지급" id="j_etc2"
						<c:if test="${fn:contains(j_etc, '퇴직급')}"> checked </c:if>>
						<span>퇴직금 지급</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_etc" value="휴게시간 보장" id="j_etc3"
						<c:if test="${fn:contains(j_etc, '휴게시간')}"> checked </c:if>>
						<span>휴게시간 보장</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_etc" value="식사제공" id="j_etc4"
						<c:if test="${fn:contains(j_etc, '식사')}"> checked </c:if>>
						<span>식사제공</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_etc" value="초보자" id="j_etc5"
						<c:if test="${fn:contains(j_etc, '초보자')}"> checked </c:if>>
						<span>초보자 가능</span>
					</label>
					<label class="chk">
						<input type="checkbox" name="j_etc" value="경력자" id="j_etc6"
						<c:if test="${fn:contains(j_etc, '경력자')}"> checked </c:if>>
						<span>경력자 우대</span>
					</label>
				</td>
			</tr>
			
			<tr>
				<td>사진</td>
				<td>
					<input type="file" name="j_uploadImg">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button type="submit">수정완료</button>
				</td>
			</tr>
		</table>
	</form>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("j_addr1").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("j_addr1").value = data.address; // 주소 넣기
                document.querySelector("input[name=j_addr2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>