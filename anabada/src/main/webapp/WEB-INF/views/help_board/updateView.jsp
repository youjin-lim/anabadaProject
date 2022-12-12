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
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/help_board/readView?h_no=${update.h_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${searchType}"
					+ "&keywrod=${scri.keyword}";
		});
		
		$(".update_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			
			formObj.attr("action", "/help_board/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
	
	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'].chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("h_title"));
				return true;
			}
		}
	}
</script>

<body>
	<div>
		<section>
			<form name="updateForm" role="form" method="post" action="/help_board/update">
				<input type="hidden" name="h_no" value="${update.h_no}" readonly="readonly" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="" value="${scri.keyword}">
				
				<table>
					<tbody>
						<tr>
							<td>
								<label for="h_title">제목</label>
								<input type="text" id="h_title" name="h_title" value="${update.h_title}" class="chk" title="제목을 입력하세요."/>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="h_content">내용</label>
								<textarea id="h_content" name="h_content" class="chk" title="내용을 입력하세요."><c:out value="${update.h_content}"/></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>