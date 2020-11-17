<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>도서관소개 - 딜리브러리</title>
<style type="text/css">
	.accordion{
		margin:10px;
	}
	label{
		width: 756px;
	}
	input[id*="answer"]{
		display: none;
	}
	input[id*="answer"] + label {
		display: block;
		padding: 20px;
		border: 1px solid cadetblue;
		border-bottom: 0;
		color: #fff;
		font-weight: 900;
		background-color: cadetblue;
		cursor: pointer;
		position: relative;
	}
	/*
	input[id*="answer"] + label em {
		position: absolute;
		top: 50%;
		right: 10px;
		width: 30px;
		height: 30px;
		margin-top: -15px;
		display: inline-block; 
	}
	*/
	input[id*="answer"] + label + div {
		max-height: 0;
		transition: all .35s;
		overflow: hidden;
		background: #ebf8ff;
		font-size: 11px;
	}
	input[id*="answer"] + label + div p {
		display: inline-block;
		padding: 20px;
		font-size: 11px;
	}
	input[id*="answer"]:checked  + label + div{
		max-height: 100px;
		background-position: 0 -30px;
		width: 756px;
	}
</style>
</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="about.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="about.html"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="#"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="#"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="#"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="#"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="books.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="books.html">도서검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="community.html" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="community.html">창작물게시판</a></li>
								<li><a class="dropdown-item" href="#">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage.html" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage.html"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="myfolder.html">내서재</a></li>
								<li><a class="dropdown-item" href="#">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<li class="nav-item" v-bind:title="login">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-sign-in-alt"></i></a>
					</li>
					<li class="nav-item" v-bind:title="signup">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-user-plus"></i></a>
					</li>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-book"></i></a>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="sitemap.html" class="nav-link"><i class="far fa-map"></i></a>
					</li>
					<script>
						var app = new Vue({
							el: '#app',	
							data: {
								login: '로그인',
								signup: '회원가입',
								bookcart: '북카트',
								sitemap: '사이트맵',
							}});
					</script>
				</ul>
			</div>
		</div>
	</nav>
  
	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>FAQ</h1>
			</div>
		  </div>
		</div>
	</header>
	
	<!-- MAIN SECTION -->
	<!-- 사이드바 -->
	<section id="contact" class="py-3">
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">도서관소개</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="#"><li class="list-group-item active">대출/반납/연장</li></a>
						<a href="#"><li class="list-group-item">공지사항</li></a>
						<a href="faqViewpage.do"><li class="list-group-item">자주묻는질문</li></a>						
						<a href="QnaList.do"><li class="list-group-item">묻고 답하기</li></a>
						<a href="addrViewpageAPI.do"><li class="list-group-item">오시는길</li></a>
					</ul>
			  </div>
			</div>

			<!-- 메인내용 -->
			<div class="col-md-9">
			  <div class="p-4">
				<section id="main_section">      
					<div class="faq" >
						<div class="text-right">
							<form action="#" method="post" class="search">
								<select name="option" size="1">
								<option value="제목">제목</option>
								<option value="내용">내용</option>
								</select>
								<input type="search" name="search" placeholder="검색어를 입력하세요">
								<button id="button_search">검색</button>
							</form>
						</div>
					<hr>						
						<div class="accordion">
							<input type="radio" name="accordion" id="answer01"> 
								<label for="answer01">Q : 회원가입을 하면 편리한 점이 무엇인가요?</label>
								<div><p>ㅇ 도서관 홈페이지 이용시 반복되던 신분확인 절차가 회원가입시 한번의 인증으로 간소화 됩니다.<br>
										ㅇ 홈페이지에서 등록된 아이디로 간편하게 도서관 서비스 신청이 가능합니다.<br>
										ㅇ 회원가입시 입력하신 관심 주제분야의 추천도서를 제공 받을 수 있습니다.</p></div>
							<input type="radio" name="accordion" id="answer02"> 
								<label for="answer02">Q : 등록된 내 정보를 변경하고 싶습니다.</label>
								<div><p>Delibrary의 회원정보 변경은 고객님께서 직접 홈페이지 로그인 후<br>
								[마이페이지 > 회원정보 > 회원 정보 조회/수정] 에서 정보를 변경하실 수 있습니다.</p></div>
							<input type="radio" name="accordion" id="answer03"> 
								<label for="answer03">Q : 탈퇴는 어떻게 하나요?</label>
								<div><p>Delibrary 홈페이지 로그인 => ‘회원정보수정’ => ‘회원탈퇴’ 메뉴 클릭</p></div>	
						</div>
					</div>
				</section>
		  </div>
		</div>
	</section>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Glozzom</p>
        </div>
      </div>
    </div>
  </footer>




  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
    
  </script>
</body>

</html>