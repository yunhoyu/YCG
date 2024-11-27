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
  <script>
    function checkSeatSelection() {
      // 선택된 자리 수 확인
      var selectedSeats = document.querySelectorAll('input[name="seat"]:checked');
      
      if (selectedSeats.length > 1) { // 2개 이상의 자리가 선택된 경우
        alert("자리는 회원당 한 자리만 예약이 가능합니다.");
        return false; // 폼 전송 방지
      }
      
      // 2개 이하의 자리가 선택된 경우
      return true; // 폼 제출
    }
  </script>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
}

.seat {
    float: left;
    display: block;
    margin: 5px;
    background: #949494;
    width: 30px;
    height: 30px;
	border:0.5px solid #858585;
	border-radius:3px;
	color:#FFFFFF;
	text-align:center;
	padding-top:4px;
}

.seat-select {
    display: none;
}

.seat-select:checked+.seat {
    background: #00b509;
	border:0.5px solid #03a103;
	border-radius:3px;
}

.screen{
	margin:0;
	padding:20px;
}

.cust-rows{
	margin-top:30px;
	font-family:verdana;
	font-size:14px;
}

.cust-rows ul{
	list-style:none;
}

.cust-rows ul li{
	margin-top:18px;
}

.last-row{
	margin-left:5px;
}


.sc h1{
	text-align:center;
	color:#FFFFFF;
	background-color:#fd003b;
	padding:10px;
}

.sc h5{
	font-family:verdana;
	text-align:center;
}

.seat-details{
	margin-top:50px;
	font-family:verdana;
}
</style>
</head>
<body>
<% 
String mNo = request.getParameter("mNo");
String showDate = request.getParameter("showDate");
String theater = request.getParameter("theater");

%>
<jsp:include page="header.jsp"></jsp:include>

<br><br>
	
	<form onsubmit="return checkSeatSelection();" action="movieAction.do" method="GET">
	<input type="hidden" name="mNo" value=<%=mNo %>>
	<input type="hidden" name="showDate" value=<%=showDate %>>
	<input type="hidden" name="theater" value=<%=theater %>>
	<div class="container">
				<div class="sc">
					<h1>SCREEN</h1><br>
					<h5>RS. 150</h5>
				</div>
				<div class="row justify-content-center">
				
				
						<div class="col-sm-1">
							<div class="cust-rows">
							<ul>
								<li>ROW_1</li>
								<li>ROW_2</li>
							</ul>
							<br>
							<ul>
								<li>ROW_3</li>
								<li>ROW_4</li>
								<li>ROW_5</li>
								<li>ROW_6</li>
								<li>ROW_7</li>
								<li>ROW_8</li>
								<li>ROW_9</li>
								<li>ROW_10</li>
							</ul>
							</div>
						</div>
						<div class="col-sm-5 screen">
							
								<section id="seats">
								
								  <div class="row justify-content-center">
								  <div class="col-sm-12">
								  <input id="seat-1" class="seat-select" type="checkbox" value="R1-1" name="seat">
								  <label for="seat-1" class="seat">1</label>
								  <input id="seat-2" class="seat-select" type="checkbox" value="R1-2" name="seat">
								  <label for="seat-2" class="seat">2</label>
								  <input id="seat-3" class="seat-select" type="checkbox" value="R1-3" name="seat" />
								  <label for="seat-3" class="seat">3</label>
								  <input id="seat-4" class="seat-select" type="checkbox" value="R1-4" name="seat" />
								  <label for="seat-4" class="seat">4</label>
								  <input id="seat-5" class="seat-select" type="checkbox" value="R1-5" name="seat" />
								  <label for="seat-5" class="seat">5</label>
								  <input id="seat-6" class="seat-select" type="checkbox" value="R1-6" name="seat" />
								  <label for="seat-6" class="seat">6</label>
								  <input id="seat-7" class="seat-select" type="checkbox" value="R1-7" name="seat" />
								  <label for="seat-7" class="seat">7</label>
								  <input id="seat-8" class="seat-select" type="checkbox" value="R1-8" name="seat" />
								  <label for="seat-8" class="seat">8</label>
								  <input id="seat-9" class="seat-select" type="checkbox" value="R1-9" name="seat" />
								  <label for="seat-9" class="seat">9</label>
								  <input id="seat-10" class="seat-select" type="checkbox" value="R1-10" name="seat" />
								  <label for="seat-10" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-11" class="seat-select" type="checkbox" value="R2-1" name="seat" />
								  <label for="seat-11" class="seat">1</label>
								  <input id="seat-12" class="seat-select" type="checkbox" value="R2-2" name="seat" />
								  <label for="seat-12" class="seat">2</label>
								  <input id="seat-13" class="seat-select" type="checkbox" value="R2-3" name="seat" />
								  <label for="seat-13" class="seat">3</label>
								  <input id="seat-14" class="seat-select" type="checkbox" value="R2-4" name="seat" />
								  <label for="seat-14" class="seat">4</label>
								  <input id="seat-15" class="seat-select" type="checkbox" value="R2-5" name="seat" />
								  <label for="seat-15" class="seat">5</label>
								  <input id="seat-16" class="seat-select" type="checkbox" value="R2-6" name="seat" />
								  <label for="seat-16" class="seat">6</label>
								  <input id="seat-17" class="seat-select" type="checkbox" value="R2-7" name="seat" />
								  <label for="seat-17" class="seat">7</label>
								  <input id="seat-18" class="seat-select" type="checkbox" value="R2-8" name="seat" />
								  <label for="seat-18" class="seat">8</label>
								  <input id="seat-19" class="seat-select" type="checkbox" value="R2-9" name="seat" />
								  <label for="seat-19" class="seat">9</label>
								  <input id="seat-20" class="seat-select" type="checkbox" value="R2-10" name="seat" />
								  <label for="seat-20" class="seat">10</label>
								  </div>
								  <br><br><br>
								  <div class="col-sm-12">
								  <input id="seat-21" class="seat-select" type="checkbox" value="R3-1" name="seat" />
								  <label for="seat-21" class="seat">1</label>
								  <input id="seat-22" class="seat-select" type="checkbox" value="R3-2" name="seat" />
								  <label for="seat-22" class="seat">2</label>
								  <input id="seat-23" class="seat-select" type="checkbox" value="R3-3" name="seat" />
								  <label for="seat-23" class="seat">3</label>
								  <input id="seat-24" class="seat-select" type="checkbox" value="R3-4" name="seat" />
								  <label for="seat-24" class="seat">4</label>
								  <input id="seat-25" class="seat-select" type="checkbox" value="R3-5" name="seat" />
								  <label for="seat-25" class="seat">5</label>
								  <input id="seat-26" class="seat-select" type="checkbox" value="R3-6" name="seat" />
								  <label for="seat-26" class="seat">6</label>
								  <input id="seat-27" class="seat-select" type="checkbox" value="R3-7" name="seat" />
								  <label for="seat-27" class="seat">7</label>
								  <input id="seat-28" class="seat-select" type="checkbox" value="R3-8" name="seat" />
								  <label for="seat-28" class="seat">8</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-31" class="seat-select" type="checkbox" value="R4-1" name="seat" />
								  <label for="seat-31" class="seat">1</label>
								  <input id="seat-32" class="seat-select" type="checkbox" value="R4-2" name="seat" />
								  <label for="seat-32" class="seat">2</label>
								  <input id="seat-33" class="seat-select" type="checkbox" value="R4-3" name="seat" />
								  <label for="seat-33" class="seat">3</label>
								  <input id="seat-34" class="seat-select" type="checkbox" value="R4-4" name="seat" />
								  <label for="seat-34" class="seat">4</label>
								  <input id="seat-35" class="seat-select" type="checkbox" value="R4-5" name="seat" />
								  <label for="seat-35" class="seat">5</label>
								  <input id="seat-36" class="seat-select" type="checkbox" value="R4-6" name="seat" />
								  <label for="seat-36" class="seat">6</label>
								  <input id="seat-37" class="seat-select" type="checkbox" value="R4-7" name="seat" />
								  <label for="seat-37" class="seat">7</label>
								  <input id="seat-38" class="seat-select" type="checkbox" value="R4-8" name="seat" />
								  <label for="seat-38" class="seat">8</label>
								  <input id="seat-39" class="seat-select" type="checkbox" value="R4-9" name="seat" />
								  <label for="seat-39" class="seat">9</label>
								  <input id="seat-40" class="seat-select" type="checkbox" value="R4-10" name="seat" />
								  <label for="seat-40" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-41" class="seat-select" type="checkbox" value="R5-1" name="seat" />
								  <label for="seat-41" class="seat">1</label>
								  <input id="seat-42" class="seat-select" type="checkbox" value="R5-2" name="seat" />
								  <label for="seat-42" class="seat">2</label>
								  <input id="seat-43" class="seat-select" type="checkbox" value="R5-3" name="seat" />
								  <label for="seat-43" class="seat">3</label>
								  <input id="seat-44" class="seat-select" type="checkbox" value="R5-4" name="seat" />
								  <label for="seat-44" class="seat">4</label>
								  <input id="seat-45" class="seat-select" type="checkbox" value="R5-5" name="seat" />
								  <label for="seat-45" class="seat">5</label>
								  <input id="seat-46" class="seat-select" type="checkbox" value="R5-6" name="seat" />
								  <label for="seat-46" class="seat">6</label>
								  <input id="seat-47" class="seat-select" type="checkbox" value="R5-7" name="seat" />
								  <label for="seat-47" class="seat">7</label>
								  <input id="seat-48" class="seat-select" type="checkbox" value="R5-8" name="seat" />
								  <label for="seat-48" class="seat">8</label>
								  <input id="seat-49" class="seat-select" type="checkbox" value="R5-9" name="seat" />
								  <label for="seat-49" class="seat">9</label>
								  <input id="seat-50" class="seat-select" type="checkbox" value="R5-10" name="seat" />
								  <label for="seat-50" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-51" class="seat-select" type="checkbox" value="R6-1" name="seat" />
								  <label for="seat-51" class="seat">1</label>
								  <input id="seat-52" class="seat-select" type="checkbox" value="R6-2" name="seat" />
								  <label for="seat-52" class="seat">2</label>
								  <input id="seat-53" class="seat-select" type="checkbox" value="R6-3" name="seat" />
								  <label for="seat-53" class="seat">3</label>
								  <input id="seat-54" class="seat-select" type="checkbox" value="R6-4" name="seat" />
								  <label for="seat-54" class="seat">4</label>
								  <input id="seat-55" class="seat-select" type="checkbox" value="R6-5" name="seat" />
								  <label for="seat-55" class="seat">5</label>
								  <input id="seat-56" class="seat-select" type="checkbox" value="R6-6" name="seat" />
								  <label for="seat-56" class="seat">6</label>
								  <input id="seat-57" class="seat-select" type="checkbox" value="R6-7" name="seat" />
								  <label for="seat-57" class="seat">7</label>
								  <input id="seat-58" class="seat-select" type="checkbox" value="R6-8" name="seat" />
								  <label for="seat-58" class="seat">8</label>
								  <input id="seat-59" class="seat-select" type="checkbox" value="R6-9" name="seat" />
								  <label for="seat-59" class="seat">9</label>
								  <input id="seat-60" class="seat-select" type="checkbox" value="R6-10" name="seat" />
								  <label for="seat-60" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-61" class="seat-select" type="checkbox" value="R7-1" name="seat" />
								  <label for="seat-61" class="seat">1</label>
								  <input id="seat-62" class="seat-select" type="checkbox" value="R7-2" name="seat" />
								  <label for="seat-62" class="seat">2</label>
								  <input id="seat-63" class="seat-select" type="checkbox" value="R7-3" name="seat" />
								  <label for="seat-63" class="seat">3</label>
								  <input id="seat-64" class="seat-select" type="checkbox" value="R7-4" name="seat" />
								  <label for="seat-64" class="seat">4</label>
								  <input id="seat-65" class="seat-select" type="checkbox" value="R7-5" name="seat" />
								  <label for="seat-65" class="seat">5</label>
								  <input id="seat-66" class="seat-select" type="checkbox" value="R7-6" name="seat" />
								  <label for="seat-66" class="seat">6</label>
								  <input id="seat-67" class="seat-select" type="checkbox" value="R7-7" name="seat" />
								  <label for="seat-67" class="seat">7</label>
								  <input id="seat-68" class="seat-select" type="checkbox" value="R7-8" name="seat" />
								  <label for="seat-68" class="seat">8</label>
								  <input id="seat-69" class="seat-select" type="checkbox" value="R7-9" name="seat" />
								  <label for="seat-69" class="seat">9</label>
								  <input id="seat-70" class="seat-select" type="checkbox" value="R7-10" name="seat" />
								  <label for="seat-70" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-71" class="seat-select" type="checkbox" value="R8-1" name="seat" />
								  <label for="seat-71" class="seat">1</label>
								  <input id="seat-72" class="seat-select" type="checkbox" value="R8-2" name="seat" />
								  <label for="seat-72" class="seat">2</label>
								  <input id="seat-73" class="seat-select" type="checkbox" value="R8-3" name="seat" />
								  <label for="seat-73" class="seat">3</label>
								  <input id="seat-74" class="seat-select" type="checkbox" value="R8-4" name="seat" />
								  <label for="seat-74" class="seat">4</label>
								  <input id="seat-75" class="seat-select" type="checkbox" value="R8-5" name="seat" />
								  <label for="seat-75" class="seat">5</label>
								  <input id="seat-76" class="seat-select" type="checkbox" value="R8-6" name="seat" />
								  <label for="seat-76" class="seat">6</label>
								  <input id="seat-77" class="seat-select" type="checkbox" value="R8-7" name="seat" />
								  <label for="seat-77" class="seat">7</label>
								  <input id="seat-78" class="seat-select" type="checkbox" value="R8-8" name="seat" />
								  <label for="seat-78" class="seat">8</label>
								  <input id="seat-79" class="seat-select" type="checkbox" value="R8-9" name="seat" />
								  <label for="seat-79" class="seat">9</label>
								  <input id="seat-80" class="seat-select" type="checkbox" value="R8-10" name="seat" />
								  <label for="seat-80" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-12">
								  <input id="seat-81" class="seat-select" type="checkbox" value="R9-1" name="seat" />
								  <label for="seat-81" class="seat">1</label>
								  <input id="seat-82" class="seat-select" type="checkbox" value="R9-2" name="seat" />
								  <label for="seat-82" class="seat">2</label>
								  <input id="seat-83" class="seat-select" type="checkbox" value="R9-3" name="seat" />
								  <label for="seat-83" class="seat">3</label>
								  <input id="seat-84" class="seat-select" type="checkbox" value="R9-4" name="seat" />
								  <label for="seat-84" class="seat">4</label>
								  <input id="seat-85" class="seat-select" type="checkbox" value="R9-5" name="seat" />
								  <label for="seat-85" class="seat">5</label>
								  <input id="seat-86" class="seat-select" type="checkbox" value="R9-6" name="seat" />
								  <label for="seat-86" class="seat">6</label>
								  <input id="seat-87" class="seat-select" type="checkbox" value="R9-7" name="seat" />
								  <label for="seat-87" class="seat">7</label>
								  <input id="seat-88" class="seat-select" type="checkbox" value="R9-8" name="seat" />
								  <label for="seat-88" class="seat">8</label>
								  <input id="seat-89" class="seat-select" type="checkbox" value="R9-9" name="seat" />
								  <label for="seat-89" class="seat">9</label>
								  <input id="seat-90" class="seat-select" type="checkbox" value="R9-10" name="seat" />
								  <label for="seat-90" class="seat">10</label>
								  </div>
								  
								  <div class="col-sm-8 last-row">
								  <input id="seat-91" class="seat-select" type="checkbox" value="R10-1" name="seat" />
								  <label for="seat-91" class="seat">1</label>
								  <input id="seat-92" class="seat-select" type="checkbox" value="R10-2" name="seat" />
								  <label for="seat-92" class="seat">2</label>
								  <input id="seat-93" class="seat-select" type="checkbox" value="R10-3" name="seat" />
								  <label for="seat-93" class="seat">3</label>
								  <input id="seat-94" class="seat-select" type="checkbox" value="R10-4" name="seat" />
								  <label for="seat-94" class="seat">4</label>
								  <input id="seat-95" class="seat-select" type="checkbox" value="R10-5" name="seat" />
								  <label for="seat-95" class="seat">5</label>
								  <input id="seat-96" class="seat-select" type="checkbox" value="R10-6" name="seat" />
								  <label for="seat-96" class="seat">6</label>
								  </div>
								  <br><br><br>
								  <div class="col-sm-5">
								  	<div class="form-group">
										<input type="submit" value="예약 완료" class="btn cust-btn">
									</div>
								  </div>
								  </div>
								</section>
							
						</div>
						
				</div>
				<div class="text-end">
       			  <input type="submit" style="height: 50px;width: 100px;" class="btn bg-black text-white form-control" value="예약 완료">
				</div>
			</div>
		</form>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>