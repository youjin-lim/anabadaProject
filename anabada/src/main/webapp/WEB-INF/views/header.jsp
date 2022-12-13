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
	<!-- header 영역 -->
	<div class="container">
		<div class="header">
			<div class="logo-header">
				<img src="resources/images/logo.png">
			</div>
			
			<div class="sbox">
				<div class="search-box">
					<input class="search_in" type="text"><button class="search_but"><img src="resources/images/search.png"></button>
				</div>
			</div>
		</div>
		
		<div class="cate">
			<div>
				<ul class="cate-ul">
					<li class="cate-li"><img src="resources/images/menu.png"></li>
				</ul>
			</div>
			
			<div>
				<ul class="cate-ul">
					<li class="cate-li">아르바이트</li>
					<li class="cate-li">동네생활</li>
					<li class="cate-li">맛집추천</li>
					<li class="cate-li">동호회</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>