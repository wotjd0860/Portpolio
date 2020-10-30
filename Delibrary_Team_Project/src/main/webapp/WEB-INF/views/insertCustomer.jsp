<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS_nonAside.css">
	
	<!-- BOOTSTRAP IMPORT METERIALS  -->
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- END OF THE BOOTSTRAP IMPORT METERIALS  --> 
	 	
</head>  
<body>
<!-- 헤더	 -->
	<header id="main_header">
		<div id="title">
			<a href="Home.do">
			<img alt="홈페이지" src="img/Logo.png" width=500px; height=150px;>
			</a>
		</div>
		<nav id="main_gnb">
			<ul>
				<c:if test="${empty cust_no }">
					<li><a href="LoginPage.do">로그인</a></li>
					<li><a href="insertCustomer.do">회원가입</a></li>
				</c:if>
				<c:if test="${not empty cust_no }">
					<li><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></li>
					<li><a href="logout.do?cust_no=${cust_no }">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>
		
	</header>
	
	<!-- 메인 폼 시작-->
	
	<div id="content">
		<section id="main_section">
		<div class="insertCustmer--titleContainer">
			<h1 class="insertCustmer--title">
			 회원가입
			</h1>
			<p class="insertCustmer--description"> 
			지금 가입하셔서 비트도서관의 책을 도서관에 방문하지 않고 온라인으로 대여하세요!</p>
		</div>
			<!-- 제목 -->
			<div class="insertCustomer--ContentContainer">
			 <form action="insertCustomer.do" method="post" enctype="multipart/form-data">
			    <div class="form-group">
			      <label for="email">이메일:</label>
			      <input type="email" class="form-control" id="email" placeholder="이메일 주소" name="email"> 
			      <button type="button" class="btn btn-secondary">중복확인</button>
			    </div>
			    
				<div class="custom-control custom-switch">
					<input type="checkbox" class="custom-control-input" id="switch1">
					<label class="custom-control-label" for="switch1">책 추천/이벤트 수신 동의</label>
				</div>
					  
			    <div class="form-group">
			      <label for="pw">비밀번호:</label>
			      <input type="password" class="form-control" id="pw" placeholder="비밀번호" name="pw">
			    </div>
			    
			     <div class="form-group">
			      <label for="pwcheck">비밀번호 확인:</label>
			      <input type="password" class="form-control" id="pw" placeholder="비밀번호 확인" name="pw">
			    </div>
			    
			    <div class="form-group">
			      <label for="nickname">닉네임:</label>
			      <input type="text" class="form-control" id="nickname" placeholder="닉네임" name="nickname">
			      <p class="insertCustomer--description-nickname">*욕설 비속어 사용 시 서비스 이용이 제한될 수 있습니다.</p>
			    </div>
			    
			     <div class="form-group">
			      <label for="addr">주소:</label>
			      <input type="addr1" class="form-control" id="addr1" placeholder="주소" name="addr1"> 
			      <button type="button" class="btn btn-secondary">우편번호찾기</button>
			      <input type="addr2" class="form-control" id="addr2" placeholder="상세주소" name="addr2"> 
			    </div>
			    
			    <div class="form-group">
			      <label for="interest">관심장르</label>
			      <div>
			      	<input type="checkbox" class="check_all">모두선택
			      </div>
			      <div class="check_item">
			           <input type="checkbox" name="interest" value="인문">인문
						<input type="checkbox" name="interest" value="경영">경영 
						<input type="checkbox" name="interest" value="소설">소설     
			      		<input type="checkbox" name="interest" value="역사">역사 
			   		</div>
			     		
			   		<div class="check_item">
						<input type="checkbox" name="interest" value="순수과학">순수과학
						<input type="checkbox" name="interest" value="응용과학">응용과학
			   		</div>
					</div>
					
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" id="validatedCustomFile" name="uploadFile">
					    <label class="custom-file-label" for="validatedCustomFile">프로필 사진등록</label>
					  </div>
			  
			  		<div class="form-group form-check">
			    		</div> 
			    		
			    	<button type="submit" id="joinConfirm" class="btn btn-primary">가입하기</button>
			    	<button type="reset" class="btn btn-secondary">입력취소</button>
			  </form>			  
			</div>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function () {
	   $(".check_all").change(function() {
	      if (this.checked) {   //all_check의 체크상태를 확인하여,
	         $(".check_item").children().attr("checked",true);   //체크가 되어있을때 자식들도 true
	      }else{
	         $(".check_item").children().attr("checked",false);   //체크가 안되어있을때 자식들도 false
	      }
	   });

	   $("#joinConfirm").click(function(){
		   	var email = $("#email").val();
		   	var nickname = $("#nickname").val();
			alert("이메일: " + email + "닉네임: " + nickname +" 가입하시겠습니까?");
		   });	   
	});
</script>
</html>
