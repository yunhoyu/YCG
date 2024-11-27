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
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
<%
            // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
                if(userID == null)
                {
            %>
<nav class="navbar navbar-default bg-black">
<div class="container-fluid">
	<a class="navbar-brand fw-bolder text-white" href="index.jsp">YCG</a>
	<a class="navbar-brand text-white active" href="main.do">홈</a>
	<a class="navbar-brand text-white active" href="login.do">로그인</a>
	<a class="navbar-brand text-white active" href="join.do">회원가입</a>
</div>
</nav>        
<%
            // 로그인이 되어있는 사람만 볼수 있는 화면
                } else {
            %>
<nav class="navbar navbar-default bg-black">
<div class="container-fluid">
	<a class="navbar-brand fw-bolder text-white" href="index.jsp">YCG</a>
	<a class="navbar-brand text-white active" href="main.do">홈</a>
		<a class="navbar-brand text-white active" href="movie.do">영화 보기</a>
	<a class="navbar-brand text-white active" href="myPage.do">마이페이지</a>
	<a class="navbar-brand text-white active" href="logoutAction.do">로그아웃</a>
</div>
</nav>  
            <%
                }
            %>
</body>
</html>