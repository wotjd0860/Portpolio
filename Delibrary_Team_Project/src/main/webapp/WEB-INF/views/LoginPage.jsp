<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- BOOTSTRAP IMPORT METERIALS  -->
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <!-- END OF THE BOOTSTRAP IMPORT METERIALS  --> 	
	
	<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS_nonAside.css">
	<style>
	#content>#main_section {
		overflow: auto;
	}
	</style>
</head>
<body>
	<header id="main_header">
		<!-- <div id="logo">
			<a href="Home.do">
			<img alt="홈페이지 로고" src="img/home.png" width=150px; height=150px;>
			<p style="font-weight: bold;">통합도서 관리시스템</p>
			</a>
		</div> -->
		
		<div id="title">
			<a href="Home.do">
			<img alt="홈페이지" src="img/Logo.png" width=500px; height=150px;>
			</a>
		</div>
		<nav id="main_gnb"></nav>
		<nav id="main_lnb"></nav>
	</header>

	<!-- 메인 폼 시작-->

	<div id="content">
		<section id="main_section">
			<!-- 제목 -->
			<div class="insertCustmer--titleContainer" id="login_container">
			<h1 class="insertCustmer--title">
			 	로그인
			</h1>
			<hr id="title--hr">
		</div>
				
			<div class="login--ContentContainer">
			
			<form action="Home.do" method="post">		
			<div class="form-group">		
				<input type="email" class="form-control" id="email-login" placeholder="이메일 주소" name="email"> 
			     <input type="password" class="form-control" id="pw-login" placeholder="비밀번호" name="pw">
			     <input type="hidden" name="loginOk" value="ok">
			  </div>
				<button type="submit" class="btn btn-primary" id="btnLogin">로그인</button>		
				</form>
					<div class="login--description">
						<p >아직 Delibrary의 회원이 아니신가요?<br>
						<a href="insertCustomer.do" id="login--link">회원가입하기</a></p>
						<hr>
					</div>
					<p class="insertCustomer--description-nickname">이메일 찾기 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;비밀번호찾기 </p>	
			</div>	
				<br>
			</form>
		</section>
	</div>

	<footer id="main_footer">
		<p>&copy; 탈주금지조. All rights reserved. | Design by members of 탈주금지조</a>.</p>
		<img alt="" src="img/twitter_icon.png">
		<img alt="" src="img/facebook_icon.png">
		<img alt="" src="img/insta_icon.png">
		<img alt="" src="img/youtube_icon.png">
	</footer>
</body>
</html>
