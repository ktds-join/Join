<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지목록 페이지</title>
<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/member.css"/>" />
<!-- 추가 -->
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  <!-- Favicons :: 브라우저 주소창에 표시되는 대표아이콘-->
  <link href="<c:url value="static/img/favicon.png"/>" rel="icon">
  <link href="<c:url value="static/img/apple-touch-icon.png"/>" rel="apple-touch-icon">
  <!-- Google Fonts -->
  <link href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"/>" rel="stylesheet">
  <!-- Bootstrap CSS File -->
  <link href="<c:url value="static/lib/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
  <!-- Libraries CSS Files -->
    <link href="<c:url value="static/lib/ionicons/css/ionicons.min.css"/>" rel="stylesheet">
  <link href="<c:url value="static/lib/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
  <link href="<c:url value="static/lib/animate/animate.min.css"/>" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="<c:url value="static/css/style.css"/>" rel="stylesheet">
<!-- 모달 추가 -->
<link rel="stylesheet" href="<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>">
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"/>"></script>
  <script src="<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3913b3b1f3a3e3eafd8d3f0724829e06&libraries=services"></script>

<!-- 추가 -->	
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
	
<script type="text/javascript">
$().ready(function(){
	$("#myBtn").click(function(){
		$("#myModal").modal("show");
	});
	$("#myModal").on('shown.bs.modal', function(){
		/* $("#modalMap").show(); */
		alert("나와");
	});
});

</script>
</head>
<body>
<br><br><br><!-- 나중에 수정해야됨.... -->
<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	

	<!--==========================
      Section
    ============================-->
    <section id="about">
      <div class="container">

        <header class="section-header">
          <h3>map --> tendency</h3>
			<a id ="moveToTendency" href = "/Join/tendency">성향선택페이지로 이동</a>
          <p>--</p>
        </header>

        <div class="row about-cols">

          <div class="col-md-4 wow fadeInUp">
            <div class="about-col">
              <div class="img">
                <img src="<c:url value="static/img/cities/seoul.jpg"/>" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">SEOUL</a></h2>
              <p>새벽까지 서울의 밤은 결코 멈추지 않는다. <br>남대문시장의 혼잡함 속에서 쇼핑을 하고, 북촌에서 과거의 한 장면에 빠져보자. 이태원으로 자리를 옮겨 지쳐 쓰러질 때까지 파티를 즐기는 것도 좋다. 호떡으로 허기를 달랜 후에는 다시 전력을 다해 이 도시를 즐길 준비를 하자!</p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
            <div class="about-col">
              <div class="img">
                <img src="<c:url value="static/img/cities/busan.jpg"/>" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-list-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">BUSAN</a></h2>
              <p>
                아름다운 바다와 풍부한 볼거리, 부산<br> 
대한민국 제2의 도시인 부산에는 해수욕장뿐만 아니라 아름다운 자연 경관을 즐기며 걸을 수 있는 산책로, 부산의 옛 모습을 엿볼 수 있는 골목까지 있어 여행에서 생각하는 모든 볼거리가 모여있는 곳이다.</p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
            <div class="about-col">
              <div class="img">
                <img src="<c:url value="static/img/cities/jeju.png"/>" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-eye-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">JEJU</a></h2>
              <p>
                불과 물이 빚어낸 화산섬 제주도는 대한민국 최남단에 위치한 세계적인 휴양지<br>
                많은 사람들이 제주도로 휴가를 떠나지만 그곳에서 꿈꾸는 휴가는 모두 제 각각이고 아주 다양하다. 한라산 등반, 스쿠버 다이빙, 산사에서의 템플스테이, 올레길 산책, 식도락 여행 등</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #about -->

<hr>
<h2>Modal Example</h2>
<!-- Button to Open the Modal -->
<button type="button" id="myBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Open modal
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div id="modalMap" style="width:100%;height:350px;"></div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<hr>

	<!-- 여기에 지도 넣을까봥 
	모달을 3개 정도 만들어서 클릭하면 지역에 대한 지도를 보여주고 우리가 가지고 있는 랜드마크 -->
	<!--  -->
	<h2>다음 지도 API</h2>
	<jsp:include page="/WEB-INF/view/landmark/map.jsp" />
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
	  <!-- JavaScript Libraries -->
	  <script src="<c:url value="static/lib/jquery/jquery.min.js"/>"></script>
	  <script src="<c:url value="static/lib/easing/easing.min.js"/>"></script><!-- go to top  -->
	  <script src="<c:url value="static/lib/superfish/superfish.min.js"/>"></script><!-- dropdown pointer -->
	  <script src="<c:url value="static/lib/wow/wow.min.js"/>"></script><!-- 메인 글자 가운데 정렬   -->
	  <script src="<c:url value="static/js/main.js"/>"></script>
	  <!-- 지도 -->
<script>
var mapContainer = document.getElementById('modalMap'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new daum.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new daum.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new daum.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new daum.maps.LatLng(33.451393, 126.570738)
    }
];
// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
for (var i = 0; i < positions.length; i ++) {
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
</body>
</html>