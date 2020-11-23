<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>딜리브러리 - 메인페이지</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>


<!-- 외부 CSS, JS 파일 링크 -->
<link rel="stylesheet" href="css/HomeCSS.css">
<script type="text/javascript" src="/js/HomeJS.js"></script>

<!-- 관리자 페이지 script, css -->
<script type="text/javascript">
	window.onload = function() {
		
	}
</script>

</head>
<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
		<div class="container container-fluid">
			<a href="Home.do" class="navbar-brand"><p style="font-family: 'Gugi', cursive; color: #107637;">딜리브러리</p>
<!-- 				<img alt="딜리브러리" src="img/logo_bg_dark2.jpg" height="40"> -->
			</a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-0">
					<li class="nav-item dropdown">
						<a href="about.html" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>도서관소개</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="about.html"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="SearchResult.do" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>도서정보</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서 검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>커뮤니티</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage.html" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>나의도서</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="#">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no}">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
        <ul id="app" class="navbar-nav ml-auto">
					<c:if test="${cust_no == 1}">
						<li class="nav-item" v-bind:title="mamagerpage">
							<a href="ManagerPage.do" class="nav-link"><i class="fas fa-crown" style="color: #107637;"></i></a><p class="sr-only">관리자페이지</p>
						</li>
					</c:if>
					<c:if test="${cust_no == null}">
						<li class="nav-item" v-bind:title="login">
							<a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a><p class="sr-only">로그인</p>
						</li>
						<li class="nav-item" v-bind:title="signup">
							<a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a><p class="sr-only">회원가입</p>
						</li>
					</c:if>
					<c:if test="${cust_no != null}">
						<li class="nav-item" v-bind:title="logout">
							<a href="logout.do" class="nav-link"><i class="fas fa-sign-out-alt"></i></a><p class="sr-only">로그아웃</p>
						</li>
					</c:if>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a><p class="sr-only">사이트맵</p>
					</li>
					<script>
						var app = new Vue({
							el: '#app',	
							data: {
								login: '로그인',
								signup: '회원가입',
								bookcart: '북카트',
								sitemap: '사이트맵',
								logout: '로그아웃',
								mamagerpage: '관리자페이지'
							}});
					</script>
				</ul>
			</div>
		</div>
	</nav>
	
  <!-- HOME HEADING SECTION -->
	<section id="home-heading" class="p-4">
		<div class="dark-overlay">
		
		  <div class="row">
			<div class="col">
			<div class="container">
				<div>
				  <h1 id="home-display">무슨 책 읽을래?</h1></div></div>
			  <div class="container">
				<div class="input-group mb-3" id="home-searchbar">
					<input class="form-control searchbar" id="bookName" type="text" placeholder="책 제목 검색">
					<div class="input-group-append">
						<button class="btn btn-outline-light btn-lg px-5" type="button" id="search">&nbsp;&nbsp;&nbsp;<b>검색</b> &nbsp;&nbsp;&nbsp;</button>
					</div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	</section>
  
	<!-- PHOTO GALLERY -->
	<div class="home-gray">
	<section id="gallery" class="py-5">
		<div class="container">
		<hr class="gallery-hr">
		  <h4 class="text-center event-title pt-4">서울시 도서관 소식</h4>
		<hr class="gallery-hr">
		  <div class="row mb-4 pt-5">
				<div class="event-link col-md-2">
					<a href="https://www.gdlibrary.or.kr/web/menu/10093/program/30011/lectureList.do">
						<img width="100" alt="서울도서관" src="../img/a3.png" class=""><br>
						<small>서울도서관</small>
					</a>
				</div>
				<div class="event-link col-md-2">
					<a href="https://www.gdlibrary.or.kr/web/menu/10093/program/30011/lectureList.do">
						<div class="img-fit"><img max-width="100" height="auto" alt="서울도서관" src="../img/a2.png" class=""></div><br>
						<small>서울도서관</small>
					</a>
				</div>
				<div class="event-link col-md-2">
					<a href="https://www.gdlibrary.or.kr/web/menu/10093/program/30011/lectureList.do">
						<img width="100" alt="서울도서관" src="../img/a3.png" class="rounded-circle"><br>
						<small>서울도서관</small>
					</a>
				</div>
				<div class="event-link col-md-2">
					<a href="https://www.gdlibrary.or.kr/web/menu/10093/program/30011/lectureList.do">
						<img width="100" alt="서울도서관" src="../img/a3.png" class="rounded-circle"><br>
						<small>서울도서관</small>
					</a>
				</div>
				<div class="event-link col-md-2">
					<a href="https://www.gdlibrary.or.kr/web/menu/10093/program/30011/lectureList.do">
						<img width="100" alt="서울도서관" src="../img/a3.png" class="rounded-circle"><br>
						<small>서울도서관</small>
					</a>
				</div>
				<div class="event-link col-md-2">
					<a href="https://www.gdlibrary.or.kr/web/menu/10093/program/30011/lectureList.do">
						<img width="100" alt="서울도서관" src="../img/a3.png" class="rounded-circle"><br>
						<small>서울도서관</small>
					</a>
				</div>
		  </div>
		</div>
	</section>
	</div>
  
	<!-- SHOWCASE SLIDER   -->
	<div class="container pt-5">
		<div class="row">
			<div class="col">
				<!--Carousel Wrapper-->
				<div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example">
					<div class="hr-green mb-4">
					<h3 class="d-inline-block mb-3">추천 도서</h3><!--Controls-->
					<div class="controls-bottom pull-right">
						<a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example"><i class="fa fa-chevron-right"></i></a>
					</div><!--/.Controls-->
					</div>
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-2">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5416922%3Ftimestamp%3D20201108134648">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">달러구트 꿈 백화점</div>
												<h6>이미예</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F532619%3Ftimestamp%3D20201108132924">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">아몬드(양장본 HardCover)</div>
												<h6>손원평</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F541125%3Ftimestamp%3D20201108132749">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">보건교사 안은영(오늘의 젊은 작가 9)(양장본 HardCover)</div>
												<h6>정세랑</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5501269%3Ftimestamp%3D20201108134015">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">추리소설가의 살인사건(양장본 HardCover)</div>
												<h6>히가시노 게이 고</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.First slide-->
						<!--Second slide-->
						<div class="carousel-item">
							<div class="row">
								<div class="col-md-2">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5439518%3Ftimestamp%3D20201108133930">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">그 환자</div>
												<h6>재스퍼 드윗</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5487218%3Ftimestamp%3D20201108133757">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">나의 하루는 4시 30분에 시작된다</div>
												<h6>김유진</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5450043%3Ftimestamp%3D20201108133956">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">철학의 숲</div>
												<h6>브렌던 오도너 휴</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5465804%3Ftimestamp%3D20201108134321">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">마음 챙김의 시</div>
												<h6>류시화, 루이즈 글릭</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5450043%3Ftimestamp%3D20201108133956">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">철학의 숲</div>
												<h6>브렌던 오도너 휴</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5465804%3Ftimestamp%3D20201108134321">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">마음 챙김의 시</div>
												<h6>류시화, 루이즈 글릭</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.Second slide-->
					</div><!--/.Slides-->
				</div><!--/.Carousel Wrapper-->
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col">
				<!--Carousel Wrapper-->
				<div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example2">
					<div class="hr-green mb-4">
					<h3 class="d-inline-block mb-3">이번달 신작 도서</h3><!--Controls-->
					<div class="controls-bottom pull-right">
						<a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example2"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example2"><i class="fa fa-chevron-right"></i></a>
					</div><!--/.Controls-->
					</div>
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-2">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5495847%3Ftimestamp%3D20201106153628">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508720%3Ftimestamp%3D20201106153718">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">먹을수록 강해지는 폭식투수. 5</div>
												<h6>키르슈</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508612%3Ftimestamp%3D20201103160903">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">하늘과 땅의 수호자. 2(수호자 시리즈 9)</div>
												<h6>우에하시 나호코</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508526%3Ftimestamp%3D20201106140927">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">남극해</div>
												<h6>이윤길</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508612%3Ftimestamp%3D20201103160903">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">하늘과 땅의 수호자. 2(수호자 시리즈 9)</div>
												<h6>우에하시 나호코</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508526%3Ftimestamp%3D20201106140927">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">남극해</div>
												<h6>이윤길</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.First slide-->
						<!--Second slide-->
						<div class="carousel-item">
							<div class="row">
								<div class="col-md-2">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508519%3Ftimestamp%3D20201106141009">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">그대의 강</div>
												<h6>전진우</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507591%3Ftimestamp%3D20201103160737">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">하조대 해수욕장에서 생긴 일</div>
												<h6>꿀데이</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507544%3Ftimestamp%3D20201103160931">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">정조의 비밀사관, 은서</div>
												<h6>베이다</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507512%3Ftimestamp%3D20201103160818">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">삼각산에는 호랑이가 산다</div>
												<h6>임영은</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507544%3Ftimestamp%3D20201103160931">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">정조의 비밀사관, 은서</div>
												<h6>베이다</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507512%3Ftimestamp%3D20201103160818">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">삼각산에는 호랑이가 산다</div>
												<h6>임영은</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.Second slide-->
					</div><!--/.Slides-->
				</div><!--/.Carousel Wrapper-->
			</div>
		</div>
	</div>
	
	<!--HOME TABLES  -->
	<div class="home-gray">
	<section id="home-icons" class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-4 text-left">
					<!-- HOVERABLE -->
					<div class="home-table p-4">
						<div class="hr-green">
						<div class="row">
							<div class="col">
								<h4>공지사항</h4>
							</div>
							<div class="text-right mr-4">
								<a href="postList.do?group=10"><small class="text-muted">전체보기 &gt;</small></a>
							</div>
						</div>
						</div>
						<table class="table table-hover">
							<tbody>
								<c:forEach items="${HNlist}" var="notice" begin="0" end="4" step="1">
									<tr>
										<td class="home_post_title ellipsis"><a href="postDetail.do?p_id=${notice.p_id}&&group=10">${notice.p_title }</a></td>
										<td class="home_post_date"><fmt:formatDate value="${notice.p_regdate }" pattern="YYYY-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-4 mb-4 text-left">
					<!-- HOVERABLE -->
				<div class="home-table p-4">
					<div class="hr-green">
					<div class="row">
						<div class="col">
							<h4>창작물게시판</h4>
						</div>
						<div class="text-right mr-4">
							<a href="postList.do?group=20"><small class="text-muted">전체보기 &gt;</small></a>
						</div>
					</div>
						</div>
					<table class="table table-hover">
						<tbody>
							<c:forEach items="${HMakinglist}" var="making" begin="0" end="4" step="1">
								<tr>
									<td class="home_post_title ellipsis"><a href="postDetail.do?p_id=${making.p_id}&&group=20">${making.p_title }</a></td>
									<td class="home_post_date"><fmt:formatDate value="${making.p_regdate }" pattern="YYYY-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
				<div class="col-md-4 mb-4 text-left">
					<!-- HOVERABLE -->
					<div class="home-table p-4">
					<div class="hr-green">
					<div class="row">
						<div class="col">
							<h4>중고장터</h4>
						</div>
						<div class="text-right mr-4">
							<a href="postList.do?group=30"><small class="text-muted">전체보기 &gt;</small></a>
						</div>
					</div>
					</div>
					<table class="table table-hover">
						<tbody>
							<c:forEach items="${HMarketlist}" var="market" begin="0" end="4" step="1">
								<tr>
									<td class="home_post_title ellipsis"><a href="postDetail.do?p_id=${market.p_id}&&group=30">${market.p_title }</a></td>
									<td class="home_post_date"><fmt:formatDate value="${market.p_regdate }" pattern="YYYY-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>

	<!-- TESTIMONIALS -->
	<section id="testimonials" class="p-4 bg-secondary text-white">
		<div class="container">
			<h4 class="text-center">광고자리</h4>
			<div class="row text-center">
				<div class="col">
					<div class="slider">
						<div>
							<blockquote class="blockquote">
								<p class="mb-0">
									Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit, quaerat.
								</p>
								<footer class="blockquote-footer">John Doe From
									<cite title="Company 1">Company 1</cite>
								</footer>
							</blockquote>
						</div>
						<div>
							<blockquote class="blockquote">
								<p class="mb-0">
									Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit, quaerat.
								</p>
								<footer class="blockquote-footer">Sam Smith From
									<cite title="Company 2">Company 2</cite>
								</footer>
							</blockquote>
						</div>
						<div>
							<blockquote class="blockquote">
								<p class="mb-0">
									Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit, quaerat.
								</p>
								<footer class="blockquote-footer">Meghan Williams From
									<cite title="Company 3">Company 3</cite>
								</footer>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
  
  
	<!-- VIDEO MODAL -->
	<div class="modal fade" id="videoModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
					<span>&times;</span>
					</button>
					<iframe src="" frameborder="0" height="350" width="100%" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
  
	<!-- FOOTER -->
  <footer id="main-footer" class="p-5">
    <div class="container">
      <div class="row">
      	<div class="col-md-3">
      		공지사항<br>
      		자주묻는질문<br>
      		묻고답하기<br>
      		도서관소개<br>
      	</div>
      	<div class="col-md-3">
      		창작물게시판<br>
      		중고장터<br>
      		자유게시판<br>
      		내서재<br>
      	</div>
        <div class="col-md-6">
        	<table class="footer-table">
        		<tbody>
        			<tr>
        				<th>Delibrary</th>
        				<td>서울 마포구 백범로 23 구프라자 3층</td>
        			</tr>
        			<tr>
        				<th>고객센터</th>
        				<td>070-1234-5678</td>
        			</tr>
        			<tr>
        				<th>이용시간</th>
        				<td>평일 9:00 - 18:00, 점심시간 12:00 - 13:30 &nbsp;<small>( 주말/공휴일 휴무 )</small></td>
        			</tr>
        			<tr>
        				<th>팩스번호</th>
        				<td>0504-123-1234</td>
        			</tr>
        			<tr>
        				<th>이메일</th>
        				<td>delibrary@book.com</td>
        			</tr>
        		</tbody>
        	</table>
			<br>
			<br>
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>

<script type="text/javascript">

window.onload = function() {
	const home_heading = document.getElementById('home-heading');

	const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
	const getImage = Math.floor(Math.random() * images.length);
	
	home_heading.style.background = "url('../img/" + images[getImage] + "')";
	
	const home_display = document.getElementById('home-display');
	const quotes = ['무슨 책 읽을래?', '글짓기가 창조인 것처럼 글 읽기 또한 창조이다.', '진정한 책을 만났을 때 그것은 사랑에 빠지는 것과도 같다.', '다다익선 다독익선.','책은 한 권, 한 권이 하나의 세계이다.','네가 읽는 책들이 너를 말해준다.', '한 시간 독서로 누그러지지 않은 걱정은 결코 없다.'];
	const getQuote = Math.floor(Math.random() * quotes.length);
	
	home_display.textContent = quotes[getQuote];
	
} 


</script>

</body>
</html>