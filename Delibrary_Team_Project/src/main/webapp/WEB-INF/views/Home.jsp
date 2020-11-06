<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>

<!-- 이 아래로는 따로 빼야하는 CSS, JavaScript -->
<!-- 추천도서 -->
<!-- <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    // Configure Slider
    $('.carousel').carousel({
		interval: 6000,
		pause: 'hover'
    });

    // Lightbox Init
    $(document).on('click', '[data-toggle="lightbox"]', function (event) {
		event.preventDefault();
		$(this).ekkoLightbox();
    });

    // Video Play
    $(function () {
		// Auto play modal video
		$(".video").click(function () {
			var theModal = $(this).data("target"),
			videoSRC = $(this).attr("data-video"),
			videoSRCauto = videoSRC + "?modestbranding=1&rel=0&controls=0&showinfo=0&html5=1&autoplay=1";
			$(theModal + ' iframe').attr('src', videoSRCauto);
			$(theModal + ' button.close').click(function () {
				$(theModal + ' iframe').attr('src', videoSRC);
			});
		});
    });
	
	
    $('.slider').slick({
		infinite: true,
		slideToShow: 1,
		slideToScroll: 1
    });
</script>
<style type="text/css">
	@import url(https://fonts.googleapis.com/css?family=PT+Sans);
	
	#img_title {
	  text-align: center;
	  font-size: 48px;
	  text-transform: uppercase;
	  letter-spacing: 3px;
	  color: #222;
	}
	
	#showcase {
		margin-top: 50px;
	}
	
	.RecoImg {
	  display: inline-block;
	  width: 200px;
	  height: 250px;
	  margin-right: 200px;
	}
	  
	.carousel {
	  width: 1200px;
	  height: 300px;
	  overflow: hidden;
	  padding: 8px;
	  box-sizing: border-box;
	  border: 2px solid #999;
	  box-shadow: 0 0 4px #000;
	  margin: 0 auto;
	  border-radius: 5px;
	  
	}
	
	.holder {
	  animation: carousel 25s linear infinite;
	  white-space: nowrap;
	  will-change: transform;
	}
	
	.holder:hover {
    	animation-play-state: paused;
  	}
  	
	@keyframes carousel {
	  0% {
	    transform: translateX(0);
	  }
	  
	  50% {
	    transform: translateX(-100%);
	  }
	  
	  100% {
	    transform: translateX(0);
	  }
	}
</style> -->
<!-- carousel -->
<style type="text/css">
	.carousel-indicators1 {
	  right: 0;
	  bottom: -30px;
	}
	.carousel-indicators1 li {
	  outline: 1px solid lightgray;
	}
	.carousel-indicators1 .active {
	  outline: 1px solid black;
	}
	
	.img-fluid {
	  height: 250px;
	}
	.card-body {
		height: 60px;
		padding: 0;
		text-align: center;
	}
	.book-title {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	.controls-bottom {
		display: inline-block;
		float: right;
	}
	.carousel-inner {
		height: 340px;
	}
</style>

<script type="text/javascript">
	$('.carousel.carousel-multi .carousel-item').each(function () {
		var next = $(this).next();
		if (!next.length) {
			next = $(this).siblings(':first');
		}
		next.children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));
	
		if (next.next().length > 0) {
			next.next().children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));
		}
		else {
			$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
		}
	});
</script>
<!-- 탭 -->
<style type="text/css">
	#tabs:after {
		 content: "";
		 display: block;
		 clear: both;
	}
	.tab {
		float: left;
		width: 25%;
		text-align: center;
	}
	.content {
		display: none;
		text-align: center;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		let tabs = document.getElementsByClassName('tab');
		let contents = document.getElementsByClassName('content');

		contents[0].style.display = 'block';
		
		for(let i = 0; i < tabs.length; i++) {
			tabs[i].addEventListener('click', function(e) {
				for(let i = 0; i < tabs.length; i++) {
					contents[i].style.display = 'none';
				}
				contents[i].style.display = 'block';
			}, true);
		};
	}
</script>

<!-- 검색 -->
<script type="text/javascript">
	$(function() {
		$('#search').click(function() {
			location.href = "http://localhost:8088/SearchResult.do?query=" + $("#bookName").val();
		})
	});
</script>

</head>
<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-light bg-light">
		<div class="container-fluid">
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark2.jpg" height="40"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-0">
					<li class="nav-item">
						<a href="about.html" class="nav-link"><b>도서관소개</b></a>
					</li>
					<li class="nav-item">
						<a href="books.html" class="nav-link"><b>도서정보</b></a>
					</li>
					<li class="nav-item">
						<a href="community.html" class="nav-link"><b>커뮤니티</b></a>
					</li>
					<li class="nav-item">
						<a href="mypage.html" class="nav-link"><b>나의도서</b></a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="로그인" src="img/login.png"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="회원가입" src="img/add_user.png"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="북카트" src="img/book.png"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="사이트맵" src="img/map.png"></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
  <!-- HOME HEADING SECTION -->
	<section id="home-heading" class="p-5">
		<div class="dark-overlay">
		  <div class="row">
			<div class="col">
			  <div class="container pt-5">
				<div class="input-group mb-3 pt-5">
					<input class="form-control searchbar" id="bookName" type="text" placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary btn-r" type="button" id="search">검색</button>
					</div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	</section>
  
	<!-- PHOTO GALLERY -->
	<section id="gallery" class="py-5">
		<div class="container">
		  <h4 class="text-center">도서관 소식</h4>
		  <div class="row mb-4">
				<div class="col-md-4">
					ddd
				</div>

				<div class="col-md-4">
					이벤트 소식을 넣어보아요
				</div>

				<div class="col-md-4">
					로그인 비번 이쪽에서 하기
				</div>
		  </div>
		</div>
	</section>
  
	<!-- SHOWCASE SLIDER   -->
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col">
				<!--Carousel Wrapper-->
				<div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example">
					<h3 class="d-inline-block mb-3">추천 도서</h3><!--Controls-->
					<div class="controls-bottom pull-right">
						<a class="btn btn-outline-secondary prev" data-slide="prev" href="#multi-item-example"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-secondary next" data-slide="next" href="#multi-item-example"><i class="fa fa-chevron-right"></i></a>
					</div><!--/.Controls-->
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-3">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.First slide-->
						<!--Second slide-->
						<div class="carousel-item">
							<div class="row">
								<div class="col-md-3">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
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
	
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col">
				<!--Carousel Wrapper-->
				<div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example2">
					<h3 class="d-inline-block mb-3">이번달 신작 도서</h3><!--Controls-->
					<div class="controls-bottom pull-right">
						<a class="btn btn-outline-secondary prev" data-slide="prev" href="#multi-item-example2"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-secondary next" data-slide="next" href="#multi-item-example2"><i class="fa fa-chevron-right"></i></a>
					</div><!--/.Controls-->
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-3">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5495847%3Ftimestamp%3D20201106153628">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508720%3Ftimestamp%3D20201106153718">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">먹을수록 강해지는 폭식투수. 5</div>
												<h6>키르슈</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508612%3Ftimestamp%3D20201103160903">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">하늘과 땅의 수호자. 2(수호자 시리즈 9)</div>
												<h6>우에하시 나호코</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508526%3Ftimestamp%3D20201106140927">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">남극해</div>
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
								<div class="col-md-3">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508519%3Ftimestamp%3D20201106141009">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">그대의 강</div>
												<h6>전진우</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507591%3Ftimestamp%3D20201103160737">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">하조대 해수욕장에서 생긴 일</div>
												<h6>꿀데이</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507544%3Ftimestamp%3D20201103160931">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">정조의 비밀사관, 은서</div>
												<h6>베이다</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507512%3Ftimestamp%3D20201103160818">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title">삼각산에는 호랑이가 산다</div>
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
	
	<!--HOME ICON SECTION  -->
	<section id="home-icons" class="py-5">
		<div class="container">
			<div class="tabs">
				<div class="tab"><h4>공지사항</h4></div>
				<div class="tab"><h4>창작물 게시판</h4></div>
				<div class="tab"><h4>중고장터</h4></div>
				<div class="tab"><h4>자유게시판</h4></div>
			</div>
			
			<div class="contents">
				<div class="content">
					공지사항 게시물
				</div>
				
				<div class="content">
					창작물 게시물
				</div>
				
				<div class="content">
					중고장터 게시물
				</div>
				
				<div class="content">
					자유게시판 게시물
				</div>
			</div>
		</div>
	</section>

	<!-- TESTIMONIALS -->
	<section id="testimonials" class="p-4 bg-danger text-white">
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





	
</body>
</html>