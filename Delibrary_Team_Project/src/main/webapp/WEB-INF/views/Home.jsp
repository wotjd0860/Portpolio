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
<script>
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
</style>

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
		display: block;
		text-align: center;
	}
</style>

<!-- 탭 -->
<script type="text/javascript">
	window.onload = function() {
		let tabs = document.getElementsByClassName('tab');
		let contents = document.getElementsByClassName('content');

		for(let i = 0; i < tabs.length; i++) {
			tabs[i].addEventListener('click', function(e) {
				for(let i = 0; i < tabs.length; i++) {
					tabs[i].style.display = 'none';
				}
				tabs[i].style.display = 'block';
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

<style type="text/css">
	#result {
		/* display: none; */
	}
</style>
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
	<section id="showcase">
		<h1 id="img_title">이달의 사서 추천도서</h1>
		<div class="carousel">
		  <div class="holder">
		    <img src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135" class="RecoImg" />
		    <img src="http://fakeimg.pl/300x200" class="RecoImg" />
		    <img src="http://fakeimg.pl/400x300" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		  </div>
		</div>
	</section>
	
	<section id="showcase">
		<h1 id="img_title">(x-1)월의 신작 도서</h1>
		<div class="carousel">
		  <div class="holder">
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/300x200" class="RecoImg" />
		    <img src="http://fakeimg.pl/400x300" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		    <img src="http://fakeimg.pl/200x100" class="RecoImg" />
		  </div>
		</div>
	</section>

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