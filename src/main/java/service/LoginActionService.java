package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

public class LoginActionService implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
        String userID = null; 
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        if(userID != null)
        {
        	request.setAttribute("errorMessage", "이미 로그인 되었습니다.");
        	return "login";
        }
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(request.getParameter("userID"),request.getParameter("userPassword") );
        if (result == 1){
            session.setAttribute("userID",request.getParameter("userID")); 
            return "main";
        } 
		
        request.setAttribute("errorMessage", "로그인에 실패하였습니다.");
        return "login";
	}

}
