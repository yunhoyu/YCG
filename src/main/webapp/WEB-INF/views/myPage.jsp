<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="book.BookDAO" %>
<%@ page import="book.Book" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>YCG</title>
<style type = "text/css">
	#a_1,a_1:hover
    {
        color: #000000;
        text-decoration: none;
    }
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<%
String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
if (session.getAttribute("userID") != null)
{
    userID = (String)session.getAttribute("userID");
}
%>
<br>
<br>
<div class="row">
	<div class="col-lg-8 d-flex justify-content-center">
		<table class="table " style="text-align:center; border:1px solid #dddddd">
                <thead>
                <tr>
                    <th>예매번호</th>
                    <th>상영번호</th>
                    <th>예약자</th>
                    <th>예약날짜</th>
                    <th>가격</th>
                    <th>예약 취소</th>
                </tr>
                </thead>
                <tbody>
                <%
                    BookDAO bookDAO = new BookDAO();
                	ArrayList<Book> list = bookDAO.getList();
                
                    for(int i = 0; i < list.size(); i++)
                    {
                    	if(userID.equals(list.get(i).getUserID()) ){
                %>
                    <tr>
                      <td>예매번호 = <br><%=list.get(i).getbNo() %></td> <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                      <td>상영번호 = <br><%=list.get(i).getShowNo()%></td>
                      <td>예약자  = <br><%=list.get(i).getUserID()%></td>
                      <td>예약날짜 = <br><%=list.get(i).getbDate().substring(0,11) + list.get(i).getbDate().substring(11, 13) + "시"%></td>
					  <td>가격 = <br><%=list.get(i).getBcash()%> </td>
					  <td><a type="button" class="btn btn-primary" href="delete.do?bNo=<%=list.get(i).getbNo()%>&showNo<%=list.get(i).getShowNo()%>">예약 취소</a></td>
                    </tr>
                <%
                }  }
                %>
                </tbody>
            </table>
	</div>
	<div class="col-lg-4 d-flex justify-content-center">

		<br>
		<table class="table " style="text-align:center; border:1px solid #dddddd">
                <thead>
                <tr><th>내 정보</th></tr>
                </thead>
                <tbody>
                <%
                    UserDAO userDAO = new UserDAO();
                	User user = userDAO.getUser(userID);
                %>
                    
                    
                     <tr><td>내 아이디 = <%=user.getUserID()%></td></tr>
                      
                    <tr><td>내 비밀번호 = <%=user.getUserPassword()%></td></tr>
                      
                    <tr><td>내 이메일  = <%=user.getUserEmail()%></td></tr>
                      
                    <tr><td>나이 = <%=user.getUserAge()%></td></tr>
                      
					<tr><td>전화번호 = <%=user.getUserNumber()%></td></tr>
					  
                    
                
                </tbody>
            </table>
	</div>
<br>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>