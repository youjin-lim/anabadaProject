<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../resources/css/styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		// 목록 이동
		$(".cancle").on("click", function() {
			location.href = "/";
		})

		// 유효성 검사
		$("#submit").on("click", function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해 주세요.");
				$("#id").focus();
				return false;
			}

			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#pass").focus();
				return false;
			}

			if ($("#pass2").val() == "") {
				alert("비밀번호를 재확인해 주세요.");
				$("#pass2").focus();
				return false;
			}

			if ($("#name").val() == "") {
				alert("이름을 입력해 주세요.");
				$("#name").focus();
				return false;
			}

			if ($("#nick").val() == "") {
				alert("닉네임을 입력해 주세요.");
				$("#nick").focus();
				return false;
			}

			if ($("#gender").val() == "") {
				alert("성별을 선택해 주세요.");
				$("#gender").focus();
				return false;
			}
			

			if ($("#tel").val() == "") {
				alert("전화번호를 입력해 주세요.");
				$("#tel").focus();
				return false;
			}

			if ($("#email").val() == "") {
				alert("이메일을 입력해 주세요.");
				$("#email").focus();
				return false;
			}

			if ($("#loca").val() == "") {
				alert("지역을 선택해 주세요.");
				$("#loca").focus();
				return false;
			}
		})
		
		// 비밀번호 재확인
		$("#pass2").focusout(function(){
			if ($("#pass").val() == $("#pass2").val()){
				$("#warning").text(" ");
	            $("#warning").attr("style", "color:#0C6BBC");
			} else {
	            $("#warning").attr("style", "color:#FF0000; padding-left: 5px;");
	            $("#warning").text("비밀번호가 일치하지 않습니다.");
			}
		});
	});
</script>
</head>

<body style="background-color: #F9F9F9;">
	<section class="regicon">
		<form action="/member/register" method="post">
			<div class="regcenter">
				<div class="reg-logo">
					<a href="/"><img src="../resources/images/reglogo.png"></a>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="id">아이디</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="id" name="id" />
					</div>
					<div>
						<font id="id_feedback" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="pass">비밀번호</label><br />
					<div class="reg-box">
						<input class="reg-in" type="password" id="pass" name="pass" />
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="pass2">비밀번호 재확인</label><br />
					<div class="reg-box">
						<input class="reg-in" type="password" id="pass2" name="pass2" />
					</div>
					<div>
						<font id="warning" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="name">이름</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="name" name="name" />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="nick">닉네임</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="nick" name="nick" />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="tel">휴대폰 번호</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="tel" name="tel" />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="email">이메일</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="email" name="email" />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="loca">지역</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="loca" name="loca" />
					</div>
				</div>
				
				<div>
					<button class="reg-but" type="submit" id="submit">회원가입</button>
				</div>
				
				<div class="reg-corp">
					Copyright <b>ANABADA Corp.</b> All Rights Reserved.
				</div>
			</div>
		</form>
	</section>
</body>
</html>