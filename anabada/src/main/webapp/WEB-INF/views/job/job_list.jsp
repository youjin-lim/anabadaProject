<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 구인 게시판</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
	body {
	  font: 16px "Helvetica Neue", sans-serif;
	  background: white;
	  color: black;
	  padding: 50px 0; /*위아래, 왼오 안 여백*/
	}
	
	.container {
	  width: 1000px; /*고정 크기*/
	  /* max-width: 1200px; */
	  margin: 0 auto;
	}
	
	.boxes {
	  list-style: none;
	  display: flex;
	  flex-wrap: wrap;
	  padding: 0;
	  margin: 0 -10px;
	}
	
	.boxes li {
	  width: 250px; /*이걸로 해야지 1000px에 알바 게시물 4개 보임*/
	  padding: 0 5px; /*알바 게시물들 양옆 간격 5px*/
	  margin-top: 20px;
	  box-sizing: border-box;
	}
	
	.search_format li { /*검색 li*/
	  width: 250px;
	  padding: 0 20px;
	  margin-top: 20px;
	  box-sizing: border-box;
	}
	
	.boxes li a {
	  display: block;
	  padding: 5px; /*알바 게시물 안 4면 여백*/
	  text-align: left; 
	  text-decoration: none;
	  background: white; /*알바 게시물 배경 흰색*/
	  color: #000;
	  outline: 2px solid skyblue; 
	}
	
	.boxes li a:focus {
	  /* outline: 2px solid red; */
	}
	
	.boxes .details { /*box
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: center;
	  text-align: left;
	  display: inline-block; /*이렇게 해야지 알바게시물에 글자 몇개 없어도 왼쪽에 딱 붙어 나옴*/
	}
	
	/* .boxes .details span {
	  font-size: .8rem;
	}
	
	.boxes .details .length {
	  margin-right: 10px;
	}
	
	.boxes .details span:before {
	  content: '•';
	  padding-right: 3px;
	} */
	
	img { 
	/*
	이렇게 크기 해야지 div안에 딱 맞음
	div안 li 크기가 250px일때. div(container) padding 양옆(5px*2) + li padding 양옆(5px*2)여서 width는 230px
	*/
	  width: 230px;
	  height: 230px;
	}
	
	
   
</style>
<script type="text/javascript">
</script>

<body>
	<form name="job_board" method="get">
		
		<!-- 전체 감쌈 -->
		<table style="margin: auto">
			<tbody>
			<tr>
				<th>근무기간</th><th>지역</th><th>직종</th>
			</tr>
			<tr>
				<td>
					<label>
						<input type="radio" class="search_term" id="j_term1" name="j_term"
						value="모두" <c:out value="${scri.j_term eq '모두' ? 'checked' : ''}" />><span>모두</span>
					</label>
					<label>
					<input type="radio" class="search_term" id="j_term2" name="j_term"
						value="하루" <c:out value="${scri.j_term eq '하루' ? 'checked' : ''}"/>><span>하루</span>
					</label><br>
					<label>	
						<input type="radio" class="search_term" id="j_term3" name="j_term"
						value="3개월이하" <c:out value="${scri.j_term eq '3개월이하' ? 'checked' : ''}" />><span>3개월 이하</span>
					</label>
					<label>	
						<input type="radio" class="search_term" id="j_term4" name="j_term"
						value="3~6개월" <c:out value="${scri.j_term eq '3~6개월' ? 'checked' : ''}" />><span>3~6개월</span>
					</label><br>
					<label>	
						<input type="radio" class="search_term" id="j_term5" name="j_term"
						value="6개월~1년" <c:out value="${scri.j_term eq '6개월~1년' ? 'checked' : ''}" />><span>6개월~1년</span>
					</label><br>
					<label>	
						<input type="radio" class="search_term" id="j_term6" name="j_term"
						value="1년이상" <c:out value="${scri.j_term eq '1년이상' ? 'checked' : ''}" />><span>1년 이상</span>
					</label>
				</td>
			
				<td>
					<label class="chk">
						<input type="radio" class="search_addr1" id="j_addr1" name="j_addr1"
						value="전국" <c:out value="${scri.j_addr1 eq '전국' ? 'checked' : ''}" />><span>전국</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr2" name="j_addr1"
						value="서울" <c:out value="${scri.j_addr1 eq '서울' ? 'checked' : ''}" />><span>서울</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr3" name="j_addr1"
						value="부산" <c:out value="${scri.j_addr1 eq '부산' ? 'checked' : ''}" />><span>부산</span>
					</label><br>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr4" name="j_addr1"
						value="제주" <c:out value="${scri.j_addr1 eq '제주' ? 'checked' : ''}" />><span>제주</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr5" name="j_addr1"
						value="경기" <c:out value="${scri.j_addr1 eq '경기' ? 'checked' : ''}" />><span>경기</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr6" name="j_addr1"
						value="인천" <c:out value="${scri.j_addr1 eq '인천' ? 'checked' : ''}" />><span>인천</span>
					</label><br>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr7" name="j_addr1"
						value="강원" <c:out value="${scri.j_addr1 eq '강원' ? 'checked' : ''}" />><span>강원</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr8" name="j_addr1"
						value="경북" <c:out value="${scri.j_addr1 eq '경북' ? 'checked' : ''}" />><span>경북</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr9" name="j_addr1"
						value="경남" <c:out value="${scri.j_addr1 eq '경남' ? 'checked' : ''}" />><span>경남</span>
					</label><br>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr10" name="j_addr1"
						value="전북" <c:out value="${scri.j_addr1 eq '전북' ? 'checked' : ''}" />><span>전북</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr11" name="j_addr1"
						value="전남" <c:out value="${scri.j_addr1 eq '전남' ? 'checked' : ''}" />><span>전남</span>
					</label>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr12" name="j_addr1"
						value="충북" <c:out value="${scri.j_addr1 eq '충북' ? 'checked' : ''}" />><span>충북</span>
					</label><br>
					<label>	
						<input type="radio" class="search_addr1" id="j_addr13" name="j_addr1"
						value="충남" <c:out value="${scri.j_addr1 eq '충남' ? 'checked' : ''}" />><span>충남</span>
					</label>
				</td>
			
				<%-- <td>
               		<label  class="chk">
                  		<input type="radio" class="search_method" id="j_method1" name="j_method"
                  		value="모두" <c:out value="${scri.j_method eq '모두' ? 'checked' : ''}" />><span>모두</span>
               		</label>
               		<label>
                  		<input type="radio" class="search_method" id="j_method2" name="j_method"
                  		value="시급" <c:out value="${scri.j_method eq '시급' ? 'checked' : ''}" />><span>시급</span>
               		</label>
              		<label>   
                  		<input type="radio" class="search_method" id="j_method3" name="j_method"
                  		value="주급" <c:out value="${scri.j_method eq '주급' ? 'checked' : ''}" />><span>주급</span>
               		</label><br>
               		<label>
                  		<input type="radio" class="search_method" id="j_method4" name="j_method"
                  		value="월급" <c:out value="${scri.j_method eq '월급' ? 'checked' : ''}" />><span>월급</span>
               		</label>
               		<label>
                  		<input type="radio" class="search_method" id="j_method5" name="j_method"
                  		value="건당" <c:out value="${scri.j_method eq '건당' ? 'checked' : ''}" />><span>건당</span>
               		</label>
           		</td> --%>
			
				<td>			
					<label class="chk">
						<input type="radio" class="search_cate" id="j_cate1" name="j_cate"
						value="모두" <c:out value="${scri.j_cate eq '모두' ? 'checked' : ''}" />><span>모두</span>
					</label>
					<label>	
						<input type="radio" class="search_cate" id="j_cate2" name="j_cate"
						value="서빙" <c:out value="${scri.j_cate eq '서빙' ? 'checked' : ''}" />><span>서빙</span>
					</label>
					<label>		
						<input type="radio" class="search_cate" id="j_cate3" name="j_cate"
						value="매장관리/판매" <c:out value="${scri.j_cate eq '매장관리/판매' ? 'checked' : ''}" />><span>매장관리/판매</span>
					</label><br>
					<label>		
						<input type="radio" class="search_cate" id="j_cate4" name="j_cate"
						value="주방보조" <c:out value="${scri.j_cate eq '주방보조' ? 'checked' : ''}" />><span>주방보조</span>
					</label>
					<label>		
						<input type="radio" class="search_cate" id="j_cate5" name="j_cate"
						value="사무보조" <c:out value="${scri.j_cate eq '사무보조' ? 'checked' : ''}" />><span>사무보조</span>
					</label>
					<label>		
						<input type="radio" class="search_cate" id="j_cate6" name="j_cate"
						value="음료제작" <c:out value="${scri.j_cate eq '음료제작' ? 'checked' : ''}" />><span>음료 제작</span>
					</label><br>
					<label>		
						<input type="radio" class="search_cate" id="j_cate7" name="j_cate"
						value="베이킹" <c:out value="${scri.j_cate eq '베이킹' ? 'checked' : ''}" />><span>베이킹</span>
					</label>
					<label>		
						<input type="radio" class="search_cate" id="j_cate8" name="j_cate"
						value="전단지" <c:out value="${scri.j_cate eq '전단지' ? 'checked' : ''}" />><span>전단지</span>
					</label><br>
					<label>		
						<input type="radio" class="search_cate" id="j_cate9" name="j_cate"
						value="배달" <c:out value="${scri.j_cate eq '배달' ? 'checked' : ''}" />><span>배달</span>
					</label>
					<label>		
						<input type="radio" class="search_cate" id="j_cate10" name="j_cate"
						value="기타" <c:out value="${scri.j_cate eq '기타' ? 'checked' : ''}" />><span>기타</span>
					</label>
				</td>
			</tr>
		</tbody>
	</table>
			
			
	<div class="container">
		<!-- 여기부터는 게시물들 -->
		 <ul class="boxes">
		 	<c:forEach var="j_list" items="${j_list}">
		  		<li>
			    	<a href="/job/job_readView?j_bno=${j_list.j_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&j_addr1=${scri.j_addr1 }&j_term=${scri.j_term }&j_method=${scri.j_method}&j_cate=${scri.j_cate}">
			        <!-- a태그 누르면  -->	
			        	<div class="details">
			        		<c:choose>
				        		<c:when test="${empty j_list.j_img}">
				        			<img src="../resources/images/아나바다.png"/>
				        		</c:when>
				        		<c:otherwise>
				        			<img src="/upload/${j_list.j_img }"/>
				        		</c:otherwise>
			        		</c:choose>
			        		${j_list.j_company }<br>
			        		${j_list.j_title }<br>
			        		직종 : ${j_list.j_cate }<br>
			        		${j_list.j_term }&nbsp;${j_list.j_start }:00 ~ ${j_list.j_end }:00<br>
			        		${j_list.j_method }&nbsp;${j_list.j_pay }<br>
			          		${j_list.j_addr1 }
			        	</div>
			    	</a>
		   		</li>
		  	</c:forEach>
		</ul>
	</div>
		
		<!-- 페이징 -->
		<table style="margin: auto">
			<tr>
				<td>
					<c:if test="${pageMaker.prev }">
						<a href="job_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
							<!-- 다시 쓰기!!!!!!!!!!!!!!!!
							ex) 1페이지에서 제목+내용 선택하고 aaaaa 입력한 뒤 검색 버튼 누르고 -> 그 검색 목록 중에서 [2]페이지 눌렀을 때 
							http://localhost:8080/board/list?page=2&perPageNum=10&searchType=tc&keyword=aaaaa 
							[이전] 누르면 파라미터 값들 가지고 BoardController "/list"로 이동(기본이 get방식)
							-->
					</c:if>
									
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
						&nbsp;<a href="job_list${pageMaker.makeSearch(idx)}">${idx }</a>
						
					</c:forEach>
									
					<c:if test="${pageMaker.next && pageMakerendPage > 0 }">
						<a href="job_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>

<script>
	$(document).ready(function () {
		$('.search_addr1').click(function () {
		location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
		'&j_addr1=' + encodeURIComponent($("input[name=j_addr1]:checked").val()) + 
		'&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
		'&j_method=' + encodeURIComponent($("input[name=j_method]:checked").val()) + 
		'&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
							/*
							ex) 1페이지에서 제목+내용 선택하고 aaaaa 입력 후 검색버튼 눌렀을 때 url
							http://localhost:8080/board/list?page=1&perPageNum=10&searchType=tc&keyword=aaaaa
							즉, pageMaker.makeQuery(1) => ?page=1&perPageNum=10
							
							ex) 1페이지에서 작성자 선택하고 아무글도 입력하지 않고 검색버튼 눌렀을 때 url
							http://localhost:8080/board/list?page=1&perPageNum=10&searchType=w&keyword=		
								
							[검색] 버튼 누르면 파라미터 값들 가지고 BoardController "/list"로 이동(기본이 get방식)
							이때 넘어가는 파라미터는 page, perPageNum, serachType, keyword
							*/
	});
	
	$('.search_cate').click(function () {
		location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
		'&j_addr1=' + encodeURIComponent($("input[name=j_addr1]:checked").val()) + 
		'&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
		'&j_method=' + encodeURIComponent($("input[name=j_method]:checked").val()) + 
		'&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
		
	});
	
	$('.search_method').click(function () {
		location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
		'&j_addr1=' + encodeURIComponent($("input[name=j_addr1]:checked").val()) + 
		'&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
		'&j_method=' + encodeURIComponent($("input[name=j_method]:checked").val()) + 
		'&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
		
	});
	
	$('.search_term').click(function () {
		location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
		'&j_addr1=' + encodeURIComponent($("input[name=j_addr1]:checked").val()) + 
		'&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
		'&j_method=' + encodeURIComponent($("input[name=j_method]:checked").val()) + 
		'&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
		
	});
});
</script>
</html>