<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="StyleSheet" type="text/css" href="resource/TeamCSS.css">
	<style type="text/css">
	 
	 #id_css{
      text-shadow: 0 0 3px red, 0 0 10px blue;
     }
     
	 #nick_css{
       text-shadow: 2px 2px 1px red;
     }
	</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	
	</script>
</head>
<body>
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
		<nav id="main_lnb">
			<div class="menu"><a>도서대여</a></div>
			<div class="menu"><a href="postList.do?group=10">커뮤니티</a></div>
				<div class="dropdown">
					<img src="resource/img/community icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="postList.do?group=10">공지사항</a></div><br>
						<div class="sub"><a href="postList.do?group=20">창작물 게시판</a></div><br>
						<div class="sub"><a href="postList.do?group=30">중고장터</a></div>
					</div>
				</div>
			<div class="menu"><a href="faqViewpage.do">고객지원</a></div>
				<div class="dropdown">
					<img src="resource/img/customer service icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="faqViewpage.do">FAQ</a></div><br>
						<div class="sub"><a href="QnaList.do">Q&A</a></div><br>
						<div class="sub"><a href="addrViewpageAPI.do">오시는길</a></div>
					</div>
				</div>
			<div class="menu"><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></div>
				<div class="dropdown">
					<img src="resource/img/mypage icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="MyPage_Info.do?cust_no=${cust_no}">내정보</a></div><br>
						<div class="sub"><a href="MyPage_Folder.do?cust_no=${cust_no}">나의서재</a></div><br>
						<div class="sub"><a href="optOutCustomer.do">회원탈퇴</a></div>
					</div>
				</div>
			<div class="menu"><a href="siteMap.do">사이트맵</a></div>
		</nav>
	</header>
   
   <div id="content">
      <aside id="main_aside">
         <h2>마이페이지</h2>
			<ul>
				<li><a href="MyPage_Info.do?cust_no=${c.cust_no}">&nbsp;&nbsp;내정보</a></li>
				<li><a href="MyPage_Folder.do?cust_no=${c.cust_no}">&nbsp;&nbsp;나의서재</a></li>
				<li><a href="optOutCustomer.do">&nbsp;&nbsp;회원탈퇴</a></li>
			</ul>
      </aside>
      
      <section id="main_section">
         <form action="UpdateCustomer.do" method="post" enctype="multipart/form-data"><br>
              <input type="hidden" name="cust_no" value="${c.cust_no}"><br>
              <input type="hidden" name="birthday" value="${c.birthday }">
              <input type="hidden" name="name" value="${c.name }">
              <img src="img/${c.fname}" width="100" height="100"><br>
			  <input type="hidden" name="fname" value="${c.fname}">
		      <input type="file" name="uploadFile" ><br><br>
                <h2 id="id_css">아이디 : NoEscape</h2>
                <br>
                <hr style="border: #e6e6e6 1px dotted">
              <p style="color: black; font-size: small; font-weight: bold;" id="nick_css">* 닉네임 필수</p>
              <input type="text" name="nickname" value="${c.nickname}" size="60px;"><br>
              <p style="color: gray; font-size: small;">욕설 비속어 사용 시 서비스 이용이 제한될 수 있습니다.</p>
              <br>
              <p style="font-weight: bold; font-size: large;">* 비밀번호</p>
              <input type="text" name="pw" value="${c.pw }" size="60px;"><br><br>
              <hr style="border: #e6e6e6 1px dotted">
			  <p style="font-weight: bold; font-size: large;">휴대폰 번호</p>
              <input type="text" name="m_phone" value="${c.m_phone }" size="60px;"><br><br>
               <hr style="border: #e6e6e6 1px dotted">
             <p style="font-weight: bold; font-size: large;">주소</p>
              <select name="option" size="1">
                 <option value="자택">자택</option>
                 <option value="회사">회사</option>
                 <option value="그외">그외</option>
              </select>
              <input type="text" name="addr" value="${c.addr }" size="60px;">
              <input type="submit" value="우편번호찾기" style="background: white; font-weight: bold;"><br>
              상세주소 
              <input type="text" value="addr2" size="45px;"><br><br>
                <hr style="border: #e6e6e6 1px dotted">
              <p style="font-weight: bold; font-size: large;">이메일</p>
              <input type="text" value="${id }" size="25px;" name="id"> @ <input type="text" value="${email }" size="25px" name="email">
              <select>
                 <option value="naver">naver.com</option>
                 <option value="google">gmail.com</option>
                 <option value="daum">daum.net</option>
                 <option value="nate">nate.com</option>
              </select>
              <br><br>
              <hr style="border: #e6e6e6 1px dotted">
              <p style="font-weight: bold; font-size: large;">관심장르</p>
              <c:set var="interest" value="${c.interest }"/>
            <c:if test="${fn:contains(interest, '인문')}">
                  <input type="checkbox" name="genre" value="인문" CHECKED="checked">인문
            </c:if>   
               &nbsp;
            <c:if test="${!fn:contains(interest, '인문')}">
                  <input type="checkbox" name="genre" value="인문">인문
            </c:if>   
               &nbsp;
            <c:if test="${fn:contains(interest, '경영')}">
               <input type="checkbox" name="genre" value="경영" CHECKED="checked">경영       
            </c:if>   
               &nbsp;
            <c:if test="${!fn:contains(interest, '경영')}">
               <input type="checkbox" name="genre" value="경영">경영       
            </c:if>   
               &nbsp;
            <c:if test="${fn:contains(interest, '소설')}">
               <input type="checkbox" name="genre" value="소설" CHECKED="checked">소설  
            </c:if>   
            <c:if test="${!fn:contains(interest, '소설')}">
               <input type="checkbox" name="genre" value="소설">소설       
            </c:if>   
               <br>
            <c:if test="${fn:contains(interest, '역사')}">
               <input type="checkbox" name="genre" value="역사" CHECKED="checked">역사 
            </c:if>   
               &nbsp;
            <c:if test="${fn:contains(interest, '순수과학')}">
               <input type="checkbox" name="genre" value="순수과학" CHECKED="checked">순수과학
            </c:if>   
               &nbsp;
            <c:if test="${fn:contains(interest, '응용과학')}">
               <input type="checkbox" name="genre" value="응용과학" CHECKED="checked">응용과학
            </c:if>   
            <c:if test="${!fn:contains(interest, '역사')}">
               <input type="checkbox" name="genre" value="역사">역사 
            </c:if>   
               &nbsp;
            <c:if test="${!fn:contains(interest, '순수과학')}">
               <input type="checkbox" name="genre" value="순수과학">순수과학
            </c:if>   
               &nbsp;
            <c:if test="${!fn:contains(interest, '응용과학')}">
               <input type="checkbox" name="genre" value="응용과학">응용과학
            </c:if>   
            <br><br>
            <div class="hr"></div>
              <br>
              <input type="checkbox" name="agree" value="agree">개인정보 수집 및 이용 동의
              <p style="font-size: small; color: gray;">원활한 서비스 사용을 위해 개인정보를 수집합니다. 수집항목: 프로필 이미지, 닉네임, 아이디, 나의서재</p>
              <p style="font-size: small; color: gray;">개인정보 이용기간, 회원탈퇴 시 또는 개인정보 처리방침에 따라 보유 및 파기 됩니다.</p>
              
             <input type="submit" value="변경하기" style="background: white; font-weight: bold;"><br><br>
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