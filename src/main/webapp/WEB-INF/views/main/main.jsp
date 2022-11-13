<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<!-- alert 모달 필수  --> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>

<!-- login 성공 메세지 불러오기 -->
<script>
$(document).ready(function(){	
	let message = "${msg}";
	if(message!="") {
		login(message);
	}
 });
</script>

<!-- login 성공 alert 모달 -->
<script>
function login(message) {
  	Swal.fire({
	  title: message,
	  text: '',
	  padding: '3em',
	  background: '#fff',
	  backdrop: 'rgba(122, 28, 246, 0.2)',	  
	  imageUrl: '${pageContext.request.contextPath}/resources/img/logo.png',
	  imageWidth: 200,
	  imageHeight: 50,
	  imageAlt: 'Custom image',
   	})
}
</script>


<!-- 뉴스 시작 -->
<script type="text/javascript">
$(document).ready(function(){
		$.ajax({
			url:"https://fs.jtbc.co.kr//RSS/economy.xml",
			success:function(rData){
				$(rData).find("item").each(function(index){
					if (index < 3) {
						// 기사 3개만 나타나도록
						var title = $(this).find("title").text();
						var link = $(this).find("link").text();
						var desc = $(this).find("description").text();
						$('#newsDiv').append(title+"<br>"+desc+"<br><a href='"+link+"' target='_blank'>기사 보러 ㄱㄱ</a><hr>");
					} else return false;
				});
			},
			error:function(){
				alert("페이지 다녀오기 실패");
			}
		}); // ajax
});//jquery
</script>

<div class="container">
   <hr>

<!-- 뉴스끝 -->
<!-- mainslide -->
  <section id="mainslide">
    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
          aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000" style="display: flex;">
          <img src="${pageContext.request.contextPath}/resources/img/banner2.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="2000">
          <img src="${pageContext.request.contextPath}/resources/img/banner1.png" class="d-block w-100" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </section>
  <!-- End mainslide -->

  <!-- cardNews -->
  <section id="cardnews" class="mt-5">
    <div class="container">
      <h2 class="ms-5"><b>금융뉴스</b></h2>
      <p class="me-5" align="right"><b>더보기></b></p>
      <div class="row row-cols-1 row-cols-md-3 g-3 me-5 ms-5">
        <div class="col">
          <!-- Card with default left text alignment -->
          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some dummy text to make up the card's content. You can replace it anytime.</p>
              <a href="#" class="btn btn-primary" style="border: none; background: #5107B0;">자세히보기</a>
            </div>
          </div>
        </div>
        <div class="col">
          <!-- Card with center text alignment -->
          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some dummy text to make up the card's content. You can replace it anytime.</p>
              <a href="#" class="btn btn-primary" style="border: none; background: #5107B0;">자세히보기</a>
            </div>
          </div>
        </div>
        <div class="col">
          <!-- Card with right text alignment -->
          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some dummy text to make up the card's content. You can replace it anytime.</p>
              <a href="#" class="btn btn-primary" style="border: none; background: #5107B0;">자세히보기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End cardNews -->

  <br><br>
  <hr><br><br>
  <div class="m-4">
    <div class="container">
      <div class="row row-cols-md-3 g-3" style="display: flex; justify-content: space-between; flex-flow: row nowrap; margin-bottom: 10px;">
        <!-- News! -->
        <div class="container" style="margin: 0px 20px; width: 45%;">
          <h2>공지사항</h2>
          <p align="right"><a href="/main/noticeList?page=1">더보기></a></p>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>제목</th>
                  <th>작성일자</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="list" items="${noticeList }" >
                <tr>
                  <td>${list.nno}</td>
                  <td>${list.n_title}</td>
                  <td>${list.n_regdate}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <!-- End News! -->

        <!-- community -->
        <div class="container" style="margin: 0px 20px; width: 45%;">
          <h2>커뮤니티</h2>
          <p align="right">더보기></p>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>내용</th>
                  <th>작성일자</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>커뮤니티입니다.</td>
                  <td>2022.10.28</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End community -->
  <br><br><br><br><br><br>



<h3><a href='/main/NoticeListPage'>공지사항 목록</a></h3> <br>
<h3><a href='/board/list?page=1'>커뮤니티 목록</a></h3> <br>
<a href='/calendar/sample'>달력 샘플</a> <br>
<h3><a href='/book/list?year=<%=year%>&month=<%=month%>&page=1'>가계부 목록으로 이동</a></h3> <br>
<h3><a href='/report/categoryList'>리포트로 이동</a></h3> <br>
<h3><a href='/book/top3?year=<%=year%>&month=<%=month%>'>top3 이동</a></h3> <br>
<h3><a href='/openbank/goal'>자산관리 목표 설정 이동</a></h3> <br>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<div>
<canvas id="myChart" width="400" height="400"></canvas>
</div>
<script>
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['9월', '10월', '11월', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '합계',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 206, 86)',
                'rgb(75, 192, 192)',
                'rgb(153, 102, 255)',
                'rgb(255, 159, 64)'
            ]
        }]
    },
    options: {
  	  responsive: false
    }

});
</script>

<hr>

<!-- 뉴스 뜨는 공간 -->
<div id="newsDiv"></div>


<%@ include file="../include/footer.jsp"%>