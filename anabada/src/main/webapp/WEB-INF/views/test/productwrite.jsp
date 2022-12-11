<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판 글쓰기</title>
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


<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[name='writeForm']");
		// 글 저장 눌렀을때 실행   
		$(".write_btn").on("click", function() {
			if (fn_valiChk() || radio_ch() || ch_ch()) {
				return false;
			}
			formObj.attr("action", "/product/write");
			formObj.attr("method", "post");
			formObj.submit();
		});

	})

	//제품의 상태를 체크했는지 확인하는 메소드 
	function radio_ch() {

		if ($("input[type='radio']:checked").val() != null) {
			return false;

		} else {
			alert("상품의 상태를 선택하세요");
			return true;
		}

	}

	// 내용을 입력안했을때 입력하라고 alert를 띄움 
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	// 거래 방법 선택 안했을때  alert
	function ch_ch() {
		const checkPart = document.querySelector('.checkbox-part');
		const checkboxes = checkPart.querySelectorAll('input');
		var a = 0;
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked == true) {

				return false;
			}

		}

		alert("판매 유형을 선택하세요");
		return true;

	}
</script>


</head>
<body>

	<div>

		<h2>카페 글쓰기</h2>

		<form name="writeForm">
			<button class="da">2323</button>
			<h4 style="display: inline;">[ 상품 카테고리 ]</h4>
			&nbsp; <select name="p_type">
				<option value="it">전자기기</option>
				<option value="cu">상품권/쿠폰</option>
				<option value="mco">남성 의류</option>
				<option value="wco">여성 의류</option>
				<option value="bco">아동 용품</option>
				<option value="ga">가구</option>
				<option value="sh">신발</option>
				<option value="bag">가방</option>
				<option value="n">기타</option>
			</select> <br>
			<h4>판매 가격</h4>
			<input name="p_cost" type="text" placeholder="가격을 입력해 주세요"
				style="width: 150px; height: 30px; font-size: 15px;" class="chk"
				title="가격을 입력하세요"> 원 <br>
			<h4>상품 상태</h4>

			<div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con"
						name="p_con" value="미개봉" /><span>미개봉</span></label>

				</div>

				<div style="display: inline;">
					<label class="rach"><input type="radio" id="con"
						name="p_con" value="거의 새것" /><span>거의 새것</span></label>
				</div>

				<div style="display: inline;">
					<label class="rach"><input type="radio" id="con"
						name="p_con" value="사용감 있음" /><span>사용감 있음</span></label>
				</div>



			</div>


			<h4>거래 방법</h4>
			<div class="checkbox-part">

				<input type="checkbox" id="sell_a" name="sell_a" value="sell_a">
				<label for="sell_a">직거래</label> <input type="checkbox" id="sell_b"
					name="sell_b" value="sell_b"> <label for="sell_b">택배</label>

			</div>


			<br> <br>
			<hr>
			<br>
			<h4 style="display: inline;">제목</h4>
			<input name="p_title" id="p_title" class="chk" title="제목을 입력하세요"
				type="text"> <br>

			<textarea class="chk" title="내용을 입력하세요" id="p_content"
				name="p_content" rows="50" cols="80"
				placeholder="제품의 상세 정보를 기입해주세요. 직거래시 가능한 장소도 알려주세요"></textarea>

			<h5>첨부 파일</h5>
			<input type="file" name="p_file">

			<div>
				<button type="submit" class="write_btn">저 장</button>
				<button type="reset" class="write_btn">다시작성</button>
			</div>


		</form>
	</div>






</body>
</html>