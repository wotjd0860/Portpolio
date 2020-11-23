<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/postCss.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
  <title>커뮤니티 - 딜리브러리</title>
</head>

<body class="d-flex flex-column">
	<div id="page-content">
	<nav class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=60">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage_main.do?cust_no=${cust_no }" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<c:if test="${empty cust_no }">
						<li class="nav-item" v-bind:title="login">
							<a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a><p class="sr-only">로그인</p>
						</li>
						<li class="nav-item" v-bind:title="signup">
							<a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a><p class="sr-only">회원가입</p>
						</li>
					</c:if>
					<c:if test="${not empty cust_no }">
						<li class="nav-item p-1"><small class="text-light">${custName} 님</small></li>
						<li class="nav-item" v-bind:title="logout">
							<a href="logout.do?cust_no=${cust_no }" class="nav-link"><i class="fas fa-sign-out-alt"></i></a><p class="sr-only">로그아웃</p>
						</li>
					</c:if>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="#" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
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
								logout: '로그아웃'
							}});
					</script>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 커뮤니티 헤더 -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <c:if test="${group eq 10}">
					<h3>공지사항<br>&nbsp;</h3>
				</c:if>
			  <c:if test="${group eq 20}">
					<h3>창작물 게시판<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 30}">
					<h3>중고장터<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 40}">
					<h3>묻고답하기<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 60}">
					<h3>자유게시판<br>&nbsp;</h3>
				</c:if>
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
				<c:choose>
					<c:when test="${group eq 10 || group eq 40 }">
						<div class="sidebar">
							<div class="side-head">
								<h4 class="text-light">도서관소개</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item"><a href="#">대출/반납/연장</a></li>
								<li id="post10" class="list-group-item"><a href="postList.do?group=10">공지사항</a></li>
								<li class="list-group-item"><a href="faqViewpage.do">자주묻는질문</a></li>
								<li id="post40" class="list-group-item"><a href="postList.do?group=40">묻고답하기</a></li>
								<li class="list-group-item"><a href="addrViewpageAPI.do">오시는길</a></li>
							</ul>
					  </div>		
					</c:when>
					<c:otherwise>
						<div class="sidebar">
							<div class="side-head">
								<h4 class="text-light">커뮤니티</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li id="post20" class="list-group-item"><a href="postList.do?option=p_title&search=&group=20" class="returnAll">창작물게시판</a></li>
								<li id="post30" class="list-group-item"><a href="postList.do?option=p_title&search=&group=30" class="returnAll">중고장터</a></li>
								<li id="post60" class="list-group-item"><a href="postList.do?option=p_title&search=&group=60" class="returnAll">자유게시판</a></li>
							</ul>
					  </div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!-- 메인내용 -->
			<div class="col-md-9">
				<div class="row py-4">
         	<div class="col pb-4">
         	  <button class="btn btn-outline-info" onclick="postInsert()">글쓰기</button>
         	  <!-- 비로그인시 cust_no를 0으로 설정 -->
         	  <c:if test="${empty cust_no }">
	         	  <c:set var="cust_no" value="0"></c:set>
         	  </c:if>
					</div>
					<div class="text-right mb-2">
						<form action="postList.do" method="get" class="search form-inline">
							<div class="form-group">
								<p class="mr-2 mb-0">총 ${totalCount}건</p>
							</div>
							<div class="form-group">
	              <select name="option" size="1" class="form-control">
				           <option value="p_title">제목</option>
				           <option value="p_writer">작성자</option>
				           <option value="p_content">내용</option>
				        </select>
	              <input type="search" name="search" class="form-control mr-2">
	              <input type="hidden" name="group" value="${group }">
							</div>
							<div class="form-group px-2">
	              <button class="btn btn-outline-secondary"><i class="fas fa-search"></i></button>
							</div>
		        </form>
					</div>
					<table class="table table-hover ">
						<thead class="thead">
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
										<a href="postDetail.do?p_id=${p.p_id}&&group=${group}">
											<c:choose>
												<c:when test="${group==10 }">[공지]</c:when>
												<c:when test="${group==20||group==30 }">[${p.p_option}]</c:when>
											</c:choose>
											${p.p_title }
											<c:if test="${group==40 }">
												<c:if test="${not empty p.p_option}"><i class="fas fa-check-circle"></i></c:if>
											</c:if>
										</a>
									</td>
									<td>${p.p_writer }</td>
									<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${p.p_regdate }" /></td>
									<td>${p.p_hit }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- PAGINATION -->
				첫페이지: ${start }, ${end }, ${totalCount }, ${totalPage }
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
								<a href="postList.do?group=${group}&&pageNUM=${i }" class="page-link">${i }</a>
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
	</div>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
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
  <script type="text/javascript">
	  <!-- 미로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
		function postInsert(){
				if(${cust_no}==0){
					alert("로그인 후 사용하세요.")
					window.location="LoginPage.do";
				}else{
					window.location="postInsert.do?group="+${group}+"&&cust_no="+${cust_no};
				}
			}
		
  	<!-- 사이드바 열려있는 게시판에 active 속성 붙여주기 -->
  	if(${group}){
			document.getElementById('post'+${group}).classList.add('active');
		}
  </script>
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
	  <!-- 게시판 목록 클릭시에 파지네이션 세션 파기 -->
		$('.returnAll').click(function(){
			search="";
		});
  </script>  
  ${search }
</body>

</html>