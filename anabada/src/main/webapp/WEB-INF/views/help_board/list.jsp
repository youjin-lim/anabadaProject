<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
	<div>
		<section>
			<form role="form" method="get">
				<!-- 검색 -->
				<div>
					<div>
						<select name="searchType">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}" />>------</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}" />>제목</option>
							<option value="c"
								<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}" />>내용</option>
							<option value="all"
								<c:out value="${scri.searchType eq 'all' ? 'selected' : ''}" />>전체 검색</option>
						</select>
						
						<div>
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							<button id="searchBtn" type="button">검색</button>
						</div>
					</div>
						
					<script>
						$(function() {
							$('#searchBtn').click(function() {
								self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							});
						});
					</script>
				</div>
				
				<!-- 목록 -->
				<table>
					<thead>
						<tr>
							<th>제목</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td>
								<a href="/help_board/readView?h_no=${list.h_no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out value="${list.h_title}" /></a>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx ? 'class = info' : ''}" />>
						</c:forEach>
						
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="list${pageMaker.makeSearch(pageMaker.engPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
				
				<a href="/help_board/writeView">글쓰기</a>
			</form>
		</section>
	</div>
</body>
</html>