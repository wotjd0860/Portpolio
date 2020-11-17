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
  
	<!-- 도서관소개 PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>Q&A</h1>
			</div>
		  </div>
		</div>
	</header>
	
	<!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<!-- 사이드바 -->
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
				<div class="row pb-2">
         	<div class="col">
         	  <a class="btn btn-info" href="QnaInsert.do?cust_no=${cust_no}">글쓰기</a>
					</div>
					<div class="text-right mb-2">
						<form class="form-inline">
							<p class="mr-4 mb-0">총 ${totalCount}건</p>
		                    <form action="QnaList.do" method="get" class="search">
			                     <select name="option" size="1">
						           <option value="p_title">제목</option>
						           <option value="p_writer">작성자</option>
						         </select>
						         <input type="search" name="search"> <!-- 검색단어input태그 -->
							     <button id="button_search">검색</button>
							</form>
		                </form>
					</div>
				</div>
	            <table class="table table-hover">
		            <thead class="thead-dark">
		                <tr>
		                    <th>&nbsp;</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>작성일</th>
		                    <th>조회</th>
		                </tr>
		            </thead>
		            <tbody id="tbody">
								<c:forEach var="p" items="${list }" begin="${start }" end="${end }">
									<tr>
										<td scope="row">${p.p_no%10000 }</td>
										<td>
											<a href="QnaDetail.do?p_id=${p.p_id}">${p.p_title }</a>
										</td>
										<td>${p.p_writer }</td>
										<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${p.p_regdate }" /></td>
										<td>${p.p_hit }</td>
									</tr>
								</c:forEach>
		            </tbody>
		        </table>
				
           		<!-- 페이징처리 -->
	            <nav>
		            <ul class="pagination justify-content-center">
		                <li class="page-item disabled">
		                    <a class="page-link" href="#">
		                        <span>&laquo;</span>
		                        <span class="sr-only">Previous</span>
		                    </a>
		                </li>
		                <c:forEach var="i" begin="1" end="${totalPage }">
			                <li class="page-item">
			                    <a href="QnaList.do?pageNUM=${i }" class="page-link">${i }</a>
			                </li>
		                </c:forEach>
		                <li class="page-item">
		                    <a class="page-link" href="#">
		                        <span>&raquo;</span>
		                        <span class="sr-only">Next</span>
		                    </a>
		                </li>
		            </ul>
		        </nav>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

  </script>
</body>

</html>

<!-- 확인 -->