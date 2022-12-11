<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>${read.p_title}</title>
<script type="text/javascript">
	$(document).ready(function() {

		$("#listbtn").on("click", function() {
			location.href = "/product/list";
		})

	})
</script>

</head>
<body>

	<div>
		<button id="listbtn">목록으로가기</button>
		<table>
			<tr>
				<td colspan="10" style="background-color: gray;">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="6" rowspan="7" style="background-color: green;">
					<div>사진들어갈 자리</div>
				</td>
				<td>&nbsp;</td>
				<td colspan="3">
					<h1>${read.p_title }</h1>
				</td>

			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>👀 ${read.p_count }</td>
				<td>❤ ${read.p_heart }</td>
				<td>&nbsp; <br>
				</td>

			</tr>

			<tr>
				<td>&nbsp;</td>
				<td colspan="2">${read.p_cost }원</td>
				<td>&nbsp;</td>

			</tr>


			<tr>
				<td>&nbsp;</td>
				<td>카테고리 | ${read.p_type }</td>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>제품 상태 | ${read.p_con }</td>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>거래 유형 | <c:if test="${read.sell_a != '0' }">${read.sell_a}  </c:if>
					<c:if test="${read.sell_b != '0' }">${read.sell_b}</c:if>
				</td>
				<td colspan="2">&nbsp;</td>

			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>
					<div>찜버튼 자리</div>
				</td>
				<td>
					<div>채팅 버튼 자리</div>
				</td>
			</tr>



		</table>


		<!-- 관련 상품 보여주기  -->

		<table>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

			</tr>


		</table>
		<!-- 관련상품 끝  -->

		<!-- 상품 상세 정보 content 보여주기  -->
		<table>
			<tr style="background-color: gray;" height="1px;">
				<td></td>
			</tr>
			<tr>

				<td>${read.p_content }</td>
			</tr>

		</table>



	</div>




</body>
</html>