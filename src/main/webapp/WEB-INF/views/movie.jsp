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
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<br>
<br>
<form method = "get" action="seat.do">
<div class="container">
<div class="row">
	<div class="col d-flex justify-content-center bg-warning border border-5">
       <div class ="form-group" style="text-align: center;">
       <h3 class="fw-bolder">영화</h3>
          <div class="btn-group-vertical" data-toggle="buttons">
              <label class="btn btn-light active">
                  <input type="radio" name="mNo" autocomplete="off" value="1" >기생충
              </label>
              <label class="btn btn-light">
                  <input type="radio" name="mNo" autocomplete="off" value="2" >탑건
              </label>
              <label class="btn btn-light">
                  <input type="radio" name="mNo" autocomplete="off" value="3" >스파이더맨
              </label>
          </div>    
       </div>
	</div>
	<div class="col d-flex justify-content-center bg-warning border border-5">
		<div class ="form-group" style="text-align: center;">
				<h3 class="fw-bolder">시간</h3>
		          <div class="btn-group-vertical" data-toggle="buttons">
		              <label class="btn btn-light active">
		                  <input type="radio" id="s1" name="showDate" autocomplete="off" value="2023-12-05" >2023-12-05
		              </label>
		              <label class="btn btn-light">
		                  <input type="radio" id="s2" name="showDate" autocomplete="off" value="2023-12-06" >2023-12-06
		              </label>
		              <label class="btn btn-light">
		                  <input type="radio" id="s3" name="showDate" autocomplete="off" value="2023-12-07" >2023-12-07
		              </label>
		              <label class="btn btn-light">
		                  <input type="radio" id="s4" name="showDate" autocomplete="off" value="2023-12-08" >2023-12-08
		              </label>
		          </div>    
		       </div>
	</div>
	<div class="col d-flex justify-content-center bg-warning border border-5" >
		<div class ="form-group" style="text-align: center;">
					<h3 class="fw-bolder">상영관</h3>
		          <div class="btn-group-vertical" data-toggle="buttons">
		              <label class="btn btn-light active">
		                  <input type="radio" id="t1" name="theater" autocomplete="off" value="14시-1관" >14시-1관
		              </label>
		              <label class="btn btn-light">
		                  <input type="radio" id="t2" name="theater" autocomplete="off" value="14시-2관" >14시-2관
		              </label>
		              <label class="btn btn-light active">
		                  <input type="radio" id="t3" name="theater" autocomplete="off" value="14시-3관" >14시-3관
		              </label>
		          </div>   
		       </div>
	</div>
	<br>
	<br>
</div>
<br>

	<div class="text-end">
         <input type="submit" style="height: 50px;width: 100px;" class="btn bg-black text-white form-control" value="좌석 선택">
	</div>
</div>
</form>
<br>
<br>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>