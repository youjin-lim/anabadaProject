<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판 목록</title>
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<style type="text/css">
.rach input[type='radio'] {
	display: none;
}

.rach input[type='radio']+span {
	display: inline-block;
	padding: 5px 5px;
	border: 1px solid #AEB6BF;
	border-radius: 10px;
	background-color: white;
	text-align: center;
	cursor: pointer;
}

.rach input[type='radio']:checked+span {
	background-color: #AEB6BF;
	color: white;
	border-radius: 10px;
}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function() {

		// 검색어 입력하고 검색 눌렀을떄 
		$('.searchBtn')
				.on(
						"click",
						function() {
							
							var radiobtn = $('input[type="radio"]:checked').val();
							
							alert("$('input[id=con]:checked').val()");
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val())
											+"&productType="
									+ encodeURIComponent(radiobtn);
						});
		
		
		// 카테고리 버튼 클릭 이벤트 
		$("input[type='radio']").click(function() {
			
			var chbtn =$("input[type='radio']:checked").val();
			
			self.location = "list"
				+ '${pageMaker.makeQuery(1)}'
				+ '&searchType='
				+ $("select option:selected").val()
				+ "&keyword="
				+ encodeURIComponent($('#keywordInput')
						.val())
						+"&productType="
				+ encodeURIComponent(chbtn);
			
		})
		
		//내글쓰기 버튼 눌렀을때 
		$('#writebtn').on("click" , function() {
			
			var id = "${member.id}";
	          if(id =null){
	        	  alert('회원 전용 서비스입니다. 로그인 후 이용하세요 ');
	        	  return null;
	          }
			
			
			location.href="/product/writeView";
		} )
		
		
		

	});
</script>

</head>
<body>
	<div>
		<h1>게시판</h1>



		<form role="form" method="get">

			<div>

				<table>
					<tr>
						<td width="30%"><select name="searchType">

								<option value="n" <c:out value="${scri.searchType == null ? 'selected' :''} "/>>----</option>
								<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' :''} "/>>제목</option>
								<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' :''} "/>>내용</option>
								<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' :''} "/>>작성자</option>
						</select></td>
						<td><input type="text" name="keyWord" id="keywordInput" value="${scri.keyword }">
							<button class="searchBtn" type="button">검색</button>   &nbsp; &nbsp; <button   id="writebtn" type="button" >내글쓰기</button>  </td>
					</tr>

				</table>



			</div>
			<br>

			<div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="" <c:out value="${scri.searchType == null ? 'selected' :''} "/> /><span>전체</span></label>

				</div>


				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="전자기기" /><span>전자기기</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="상품권/쿠폰" <c:out value="${scri.searchType eq '상품권/쿠폰' ? 'selected' :''} "/> /><span>상품권/쿠폰</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="남성의류" <c:out value="${scri.searchType eq '남성의류' ? 'selected' :''} "/> /><span>남성 의류</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="여성의류" <c:out value="${scri.searchType eq '여성의류' ? 'selected' :''} "/> /><span>여성 의류</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="아동용품" <c:out value="${scri.searchType eq '아동용품' ? 'selected' :''} "/> /><span>아동 용품</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="가구" <c:out value="${scri.searchType eq '가구' ? 'selected' :''} "/> /><span>가구</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="신발" <c:out value="${scri.searchType eq '신발' ? 'selected' :''} "/> /><span>신발</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="가방" <c:out value="${scri.searchType eq '가방' ? 'selected' :''} "/> /><span>가방</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="기타" <c:out value="${scri.searchType eq '기타' ? 'selected' :''} "/> /><span>기타</span></label>

				</div>


			</div>
			<table>
				<thead>
					<tr>
						<th>no</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>❤</th>
					</tr>
				</thead>

				<!-- 반복 -->
				<c:set var="i" value="10" />
				<c:forEach items="${list }" var="list">

					<tr align="center" onmouseover="this.style.backgroundColor = '#D0FBFF' " onmouseout="this.style.backgroundColor = ''">
						<td><c:out value="${i }" /></td>
						<td><a style="text-decoration: none; color: black;" href="/product/readView?pno=${list.pno}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyoword=${scri.keyword }&productType=${scri.productType}  "> <c:out value="${list.p_title }" />
						</a></td>
						<td><c:out value="${list.p_type }"></c:out></td>
						<td><c:out value="${list.id }"></c:out></td>
						<td><fmt:formatDate value="${list.p_regdate }" pattern="yyyy.mm.dd" /></td>
						<td><c:out value="${list.p_count }"></c:out></td>
						<td><c:out value="${list.p_heart }"></c:out></td>

					</tr>
					<c:set var="i" value="${i-1 }" />

				</c:forEach>


			</table>

<!-- 페이징 처리 구현 -->
   <div class="col-md-offset-3">
                  <ul class="pagination">
                     <c:if test="${pageMaker.prev }">
                        <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a></li>
                        <!-- 다시 쓰기!!!!!!!!!!!!!!!!
                        ex) 1페이지에서 제목+내용 선택하고 aaaaa 입력한 뒤 검색 버튼 누르고 -> 그 검색 목록 중에서 [2]페이지 눌렀을 때 
                        http://localhost:8080/board/list?page=2&perPageNum=10&searchType=tc&keyword=aaaaa 
                        [이전] 누르면 파라미터 값들 가지고 BoardController "/list"로 이동(기본이 get방식)
                        -->
                     </c:if>
                     
                     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>>
                           <a href="list${pageMaker.makeSearch(idx)}">${idx }</a>
                        </li>
                     </c:forEach>
                     
                     <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
                        <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                     </c:if>
                  </ul>
               </div>






		</form>





	</div>

</body>
</html>