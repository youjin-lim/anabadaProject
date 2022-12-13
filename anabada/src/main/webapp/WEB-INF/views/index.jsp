<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
</head>
<body>
	<!-- 네비바 -->
	<div>
		<%@ include file="nav.jsp"%>
	</div>
	
	<!-- 헤더 -->
	<div>
		<%@ include file="header.jsp"%>
	</div>
	
	<!-- 메인 -->
	<section class="container">
		<div class="mcont">
			메인 ~
		</div>
	</section>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>