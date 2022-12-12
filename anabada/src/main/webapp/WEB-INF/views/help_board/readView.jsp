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
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
		
		// 수정
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/help_board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("삭제하시겠습니까?");
			
			if (deleteYN == true) {
				formObj.attr("action", "/help_board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
		
		// 목록으로 돌아가기
		$(".list_btn").on("click", function() {
			location.href = "/help_board/list?page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}";
		});
	});
</script>

<body>
	<div>
		<section>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="h_no" name="h_no" value="${read.h_no}" />
				<input type="hidden" id="page" name="page" value="${scri.page}" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
			</form>
			
			<div>
				<label for="h_title">제목</label>
				<input type="text" id="h_title" name="h_title" value="${read.h_title}" readonly="readonly" />
			</div>
			
			<div>
				<label for="h_content">내용</label>
				<textarea id="h_content" name="h_content" readonly="readonly"><c:out value="${read.h_content}" /></textarea>
			</div>
			
			<div>
				<button type="button" class="update_btn">수정</button>
				<button type="button" class="delete_btn">삭제</button>
				<button type="button" class="list_btn">목록</button>
			</div>
		</section>
	</div>
</body>
</html>