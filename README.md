# [Delibrary📚]

- 프로젝트명 : 딜리브러리 - 도서관 웹 어플리케이션 프로젝트
- 팀명 : 탈주금지
- 참여인원 : 6명
- 개발기간 : 2020.10.1 ~ 2020.11.30
- 내용 : SpringMVC패턴을 활용한 온라인 도서관 대여 서비스 제공하는 웹사이트 제작
- 개발환경 : MyBatis, Oracle, Spring Boot 4, Bootstrap 4,  JSP & Servlet, Javascript, Vue.js, jQuery
- 담당업무 : QNA게시판 게시글 및 댓글 CRUD, 페이징처리, 검색기능, 인기도서페이지, 신착도서페이지, faq, 오시는길페이지 등
<hr>  

1️⃣ 홈화면   
✔️모든 페이지는 부트스트랩을 적용해 반응형으로 만들어주었다.
 ![홈화면](img/homefull.png)
✔️ 홈화면을 새로고침 할때마다 랜덤으로 도서관 도서에 관련된 헤드라인 글귀, 도서관 이미지, 이미지에 맞는 장소가
나오도록 구현하였다.    
 ![홈화면검색창디자인](img/01.home.gif)  
  ⚫홈헤딩 이미지 랜덤출력 구현예시
 ```javascript 
         const home_heading = document.getElementById('home-heading');
      
         const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
         const getImage = Math.floor(Math.random() * images.length);
         
         home_heading.style.background = "url('../img/" + images[getImage] + "')";
  ```  
✔️ 캐러셀 : 홈화면에서 캐러셀을 이용해서 도서목록과 광고목록을 보여주도록 하였다.
 ![홈화면검색창디자인](img/carousel.gif)  
✔️ 푸터도 자바스크립트를 이용해서 페이지를 새로고침 할때마다 도서관련 명언문구를 랜덤으로 지정해주었다.  
 ![홈화면 푸터](img/footer.gif)  
  
2️⃣ 도서관소개 페이지    
 ![도서관소개](img/info.gif)  
  
3️⃣ 도서정보 페이지    
✔️DB에서 가장 빌린 도서가 많은 순으로 12개의 도서의 정보를 인기도서 페이지에 출력. 도서를 누르면 바로 책의 상세페이지로 연결.
 ![인기도서목록](img/10.pop.gif)  

  ⚫인기도서 목록을 뽑아오기 위한 DB Select 문  
  ```xml
	<!-- 이달의 인기도서 목록 -->
	<select id="getPopBook" resultType="bookVO">
		<![CDATA[select * from(select b_title, b_writer,b_image,count(bor_no) from book, 
		borrow where book.b_no = borrow.b_no group by b_title, b_writer, b_image order by count(bor_no) desc) 
		where rownum<=12 ]]>
	</select>
```
  ⚫신착도서 목록을 뽑아오기 위한 DB Select 문  
  ✔️book테이블의 입고일자 컬럼인 b_year를 기준으로 최근 날짜부터 12개의 도서의 정보를 신착도서 페이지에 출력. 마찬가지로 도서를 누르면 바로 책의 상세페이지로 연결.  
  ```xml
	<!-- 신착도서 목록  -->
	<select id="selectAllNew" resultType="bookVO">
		<![CDATA[ select * from (select * from book order by b_year desc) where rownum <=12 ]]>
	</select>  
```
  
4️⃣ 게시판  
&emsp;[PostController 소스코드](https://github.com/ohna93/Delibrary/blob/master/Delibrary_final_1130/src/main/java/com/example/demo/controller/PostController.java)  
&emsp;[QnaController 소스코드](https://github.com/ohna93/Delibrary/blob/master/Delibrary_final_1130/src/main/java/com/example/demo/controller/QnaController.java)  


✔️ Read : 게시판의 전체 목록을 보여주고 전체 게시글수 확인이 가능하다. 현재 페이지에 배경색을 주어 몇번째 페이지에 있는지 알 수 있다. 

![read, pagination](img/pagination.gif)

✔️ Insert : 로그인을 하지 않고 **글쓰기**를 클릭 할 경우 로그인 페이지로 이동시킨다. 글 작성시에는 말머리를 선택하고 제목, 내용을 쓰고 파일첨부가 가능하다.


> 비로그인 상태에서 글쓰기 시도할 경우  
> ![redirect to login](img/alert_login.gif)
>
> 로그인 된 상태에서 글쓰기  
> ![insert a post](img/postInsert.gif)

✔️ Update : 글 수정은 본인과 관리자만 가능하다. 말머리, 제목, 내용, 첨부파일 전부 수정 가능하다.

 ![update a post](img/postUpdate.gif)

✔️ Delete : 글 삭제 또한 본인과 관리자만 가능하다. **삭제**버튼을 클릭할 경우 경고창을 띄워 확인시킨 후 삭제를 진행 또는 취소할 수 있다.
 
![delete a post](img/postDelete.gif)

✔️ 게시판 댓글

- Insert : 댓글입력란에 내용을 입력하지 않은 상태에서 **등록** 버튼을 클릭할 경우 경고창을 띄운다.

- Update, Delete : 댓글 수정 및삭제는 본인과 관리자만 가능하다. **삭제** 버튼을 클릭할 경우 경고창을 띄워 확인시킨 후 삭제를 진행 또는 취소할 수 있다.

> 댓글 등록  
> ![insert a reply](img/replyInsert.gif)
>
> 댓글 수정 및 삭제  
> ![update/delete a post](img/replyUpDel.gif)


✔️ 검색기능

- 제목, 작성자, 내용에 따라 검색이 가능하고, 검색으로 세션에 저장해 검색결과가 여러페이지일 경우에 페이지를 넘겨도 검색한 내용이 남아있어서 정상적으로 페이징 처리가 가능하게 해주었다.

> 검색조건에 따른 결과 
> ![search](img/QNAsearch.gif)
  
5️⃣ 부수적인 페이지  
🔹자주묻는질문 페이지  
서브메뉴바나 내비게이션바로 활용하는 아코디언 효과를 자주묻는질문 게시판에 사용하였습니다.  
자주묻는 질문의 내용과 답변은 미리 간단하게 페이지에 입력해놓고 각각의 라벨에 input type을 radio로 두고 숨긴다음 클릭했을때 트랜지션을 주어 한 개의 질문을 클릭할때마다 답변부분이 열리도록 css효과를 나타내었습니다.  
🔹오시는길 페이지  
오시는길은 비트캠프 신촌센터 주소를 기준으로 사용하였습니다.  
다른 HTML페이지를 현재 페이지에 포함시키는 중첩된 브라우저로 iframe요소를 이용하였습니다.  
src에 삽입할 페이지주소를 삽입하여 오시는길 웹 페이지 안에 구글맵 페이지를 불러왔습니다.  
