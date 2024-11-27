<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>YCG</title>
</head>
<body>
<% 
String errorMessage = (String)request.getAttribute("errorMessage");
if(errorMessage != null && !errorMessage.isEmpty()) {
%>
    <script>
        alert('<%= errorMessage %>');
    </script>
<% } %>
<jsp:include page="header.jsp"></jsp:include>
<br>
<div class="text-center" >
<img id="main_Picture" src="media/YCGmain.PNG">
</div>
<div class="container position-absolute top-50 start-50 translate-middle">
        <div class="col-lg-4 text-center"></div>
        <div class="col-lg-4 position-absolute top-50 start-50 translate-middle">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="loginAction.do">
                    <h3 style="text-align:center;">로그인 화면</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
                    </div>
                    <input type="submit" class="btn bg-black text-white form-control" value="로그인">
                </form>
                YCG가 처음이신가요? <a href="join.do">회원가입 하기</a>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>

    
</body>
</html>