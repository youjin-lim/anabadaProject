<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.anabada.web.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>${read.p_title}</title>
<script type="text/javascript">
	$(document).ready(function() {

		//목록으로 가기 버튼
		$("#listbtn").on("click", function() {
			location.href = "/product/list";
		})
		//수정하기 버튼
		$("#rebtn").on("click", function() {
			location.href = "product/rewrite";
		})

		//삭제하기 버튼 
		$("#delbtn").on("click", function() {
			if (confirm("게시글을 삭제하시겠습니까?   삭제한 게시글은 복구 할 수 없습니다.")) {
				location.href = "product/delete";
			} else {
				return false;
			}
		})

	})
</script>

</head>
<body>

	<div>
		<button id="listbtn">목록으로가기</button>
		
		<div>  
		
		 </div>
		<c:if test="${member.id == read.id }">
			<button id="rebtn">수정</button>
			<button id="delbtn">삭제</button>
		</c:if>
		<table>
			<tr>
				<td colspan="10" style="background-color: gray;">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="6" rowspan="7" style="background-color: green;"><c:forEach items="${filelist }" var="list">
						<div>
							<img src="${list.filepath }" style="width: 400px; height: 400px;">
						</div>
					</c:forEach></td>
				<td>&nbsp;</td>
				<td colspan="3">
					<h1>${read.p_title }</h1>
				</td>

			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">작성자 : ${read.id }   </td>
				<td>&nbsp;</td>

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
				<td>거래 유형 | <c:if test="${read.sell_a != '0' }">${read.sell_a}  </c:if> <c:if test="${read.sell_b != '0' }">${read.sell_b}</c:if>
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