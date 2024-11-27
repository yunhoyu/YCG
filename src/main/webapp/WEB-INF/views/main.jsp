<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>YCG</title>
<style>
    /* 이미지 스타일링 (예시) */
    .image {
      width: 100%; /* 이미지 너비 조정 */
      height: auto; /* 이미지 높이 자동 조정 */
      margin-bottom: 10px; /* 이미지 간격 조정 */
      border-radius: 15px; /* 이미지 모서리를 둥글게 깎음 */
      
    }
  </style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<br>
<div class="text-center" >
	<img id="main_Picture" src="media/YCGmain.PNG">
</div>
<br>
<div class="row">
	<div class="col d-flex justify-content-center">
    <div class="container">
  <div class="row">
    <div class="col-sm-4">
      <img src="media/Movie_img/img1.jpg" class="image" alt="Image 1">
    </div>
    <div class="col-sm-4">
      <img src="media/Movie_img/img2.jpg" class="image" alt="Image 2">
    </div>
    <div class="col-sm-4">
      <img src="media/Movie_img/img3.jpg" class="image" alt="Image 3">
    </div>
    <div class="col-sm-4">
      <img src="media/Movie_img/img4.jpg" class="image" alt="Image 3">
    </div>
    <div class="col-sm-4">
      <img src="media/Movie_img/img5.jpg" class="image" alt="Image 3">
    </div>
    <div class="col-sm-4">
      <img src="media/Movie_img/img6.jpg" class="image" alt="Image 3">
    </div>
  </div>
</div>
</div>
	<div class="col d-flex justify-content-center">

		<br>
		<table class="table mx-5" style="text-align:center; border:1px solid #dddddd">
                <thead>
                <tr>
                <th class="fw-bolder">안내글</th>
                </tr>
                </thead>
                <tbody>
                    <tr height="30">
                      <td>이 사이트는 영화 예약을 위한 사이트 입니다.</td>
                    </tr>
                    <tr height="30">
                      <td>영화 예약은 로그인 후 가능합니다.</td>
                    </tr>
                    <tr height="30">
                      <td>계정이 없다면 회원가입을 해주십시오.</td>
                    </tr>
                    <tr height="30">
                      <td>예약 취소는 마이 페이지에서 가능합니다. 
                      모든 영화의 가격은 14500원임을 가정하고 진행되었습니다.</td>
				    </tr>
                </tbody>
            </table>
	</div>
</div>
<br>
<br>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>