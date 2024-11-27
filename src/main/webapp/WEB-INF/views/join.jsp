<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
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

    <div class="container-md w-75 col align-self-center">
        <div class="col-lg-4 text-center"></div>
        <div class="col-lg-4 position-absolute top-50 start-50 translate-middle">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="joinAction.do">
                    <h3 style="text-align:center;">회원가입</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
                    </div>
                     <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="휴대폰 번호" name ="userNumber" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="나이" name ="userAge" maxlength='20'>
                    </div>
                    <div class ="form-group ">
                        <input type ="email" class="form-control" placeholder="이메일" name ="userEmail" maxlength='20'>
                    </div>                 
                    <input type="submit" class="btn bg-black text-white form-control" value="회원가입">
                </form>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div> 
   
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
 
