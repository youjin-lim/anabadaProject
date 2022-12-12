<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
	<div>
		<section>
			<form role="form" method="get">
				<!-- 목록 -->
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.q_no}" /></td>
							<td>
								<a href="/qna_board/readView?q_no=${list.q_no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
									<c:out value="${list.q_title}" />
								</a>
							</td>
							<td><c:out value="${list.id}" /></td>
							<td><fmt:formatDate value="${list.q_date}" pattern="yyyy-MM-dd" /></td>
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
				
				<a href="/qna_board/writeView">글쓰기</a>
			</form>
		</section>
	</div>
</body>
</html>