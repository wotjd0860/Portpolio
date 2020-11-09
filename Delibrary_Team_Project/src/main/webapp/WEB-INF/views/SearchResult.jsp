<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>

<!-- kakao 검색 API -->
<script type="text/javascript">
	$(function() {
		alert('1');
		alert($("#query").text());
		$.ajax({
			method: "GET",
			url: "https://dapi.kakao.com/v3/search/book?target=title&size=50",
			data: { query:  $("#query").text() },
			headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
		})
			.done(function(msg) {
				/* $('#result').append("<h2>" + msg.documents[0].title + "</h2><br>");
				$('#result').append("<img src='" + msg.documents[0].thumbnail + "'/><br>"); */
				var ul = $('<ul></ul>').addClass('card-list');

				for(let i = 0; i < msg.documents.length; i++) {
					var li = $('<li></li>').addClass('card');
					var a = $('<a></a>').addClass('card-image')
					$(a).css('background-image', 'url(' + msg.documents[i].thumbnail + ')');
					$(a).attr('data-image-full', msg.documents[i].thumbnail);
					//alert(msg.documents[0].thumbnail);
					var img = $('<img>').attr('src', msg.documents[i].thumbnail); 

					$(a).append(img);
					$(li).append(a);
					$(ul).append(li);
					$('.card-body').append(ul);
				}
			});
	});
</script>

<!-- 도서 검색 결과 출력용 card -->
<script type="text/javascript">
	window.addEventListener("load", function () {
		setTimeout(lazyLoad, 1000);
	});
	
	function lazyLoad() {
		var card_images = document.querySelectorAll(".card-image");
	
		card_images.forEach(function (card_image) {
			var image_url = card_image.getAttribute("data-image-full");
			var content_image = card_image.querySelector("img");
	
			content_image.src = image_url;
	
			content_image.addEventListener("load", function () {
				card_image.style.backgroundImage = "url(" + image_url + ")";
				card_image.className = card_image.className + " is-loaded";
			});
		});
	}
</script>
<style type="text/css">
	/* Lazy Load Styles */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
		background-size: cover;
		filter: blur(3px); /* blur the lowres image */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
	}
	
	/* Layout Styles */
	
	.card-list {
		display: block;
		padding: 0;
		font-size: 0;
		text-align: center;
		list-style: none;
	}
	
	.card-body {
		padding: 0;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		height: 300px;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
	}
	
	.card-description {
		display: block;
		color: #515151;
		width: 200px;
		height: 200px;
	}
	
	.card-description > h4 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	
	.searchResult-body {
		margin-left: 60px;
	}
</style>
</head>
<body>
	<a id="query">${query}</a>
	<!-- <div id="result"></div> -->

	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark">
		<div class="container">
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="24"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item">
						<a href="about.html" class="nav-link">도서관소개</a>
					</li>
					<li class="nav-item">
						<a href="books.html" class="nav-link">도서정보</a>
					</li>
					<li class="nav-item active">
						<a href="community.html" class="nav-link">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a href="mypage.html" class="nav-link">나의도서</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="로그인" src="img/login_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="회원가입" src="img/add_user_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="북카트" src="img/book_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="사이트맵" src="img/map_bg_dark.png" height="50"></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>도서 검색 결과</h1>
			</div>
		  </div>
		</div>
	</header>
	
    <!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<div class="container">
		  <div class="row">
			<div class="searchResut-options">
			  <h4>Options</h4>
			  <br>
			  	리스트 출력 옵션들
			  	
			</div>
			<div class="searchResult-body">
				<div class="card-body">
				  <ul class="card-list">
					<li class="card">
						<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
						</a>
						<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
							<h4>Psychopomp</h4>
							<p>Japanese Breakfast</p>
						</a>
					</li>
				
					<li class="card">
						<a class="card-image" href="https://inlovewithaghost.bandcamp.com/album/lets-go" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/lets-go-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/lets-go-500.jpg">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/lets-go-100.jpg" alt="let's go" />
						</a>
						<a class="card-description" href="https://inlovewithaghost.bandcamp.com/album/lets-go" target="_blank">
							<h4>let's go</h4>
							<p>In Love With A Ghost</p>
						</a>
					</li>
				
					<li class="card">
						<a class="card-image" href="https://vulfpeck.bandcamp.com/album/the-beautiful-game" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/beautiful-game-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/beautiful-game-500.jpg">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/beautiful-game-100.jpg" alt="The Beautiful Game" />
						</a>
						<a class="card-description" href="https://vulfpeck.bandcamp.com/album/the-beautiful-game" target="_blank">
							<h4>The Beautiful Game</h4>
							<p>Vulfpeck</p>
						</a>
					</li>
				
					<li class="card">
						<a class="card-image" href="https://convergecult.bandcamp.com/album/jane-doe" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/jane-doe-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/jane-doe-500.jpg">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/jane-doe-100.jpg" alt="Jane Doe" />
						</a>
						<a class="card-description" href="https://convergecult.bandcamp.com/album/jane-doe" target="_blank">
							<h4>Jane Doe</h4>
							<p>Converge</p>
						</a>
					</li>
				  </ul>
				</div>
			</div>
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

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

  </script>
</body>
</html>