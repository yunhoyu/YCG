package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.User;
import user.UserDAO;

public class JoinActionService implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		
		User user = new User();
		user.setUserID(request.getParameter("userID"));
		user.setUserPassword(request.getParameter("userPassword"));
		user.setUserNumber(request.getParameter("userNumber"));
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserAge(request.getParameter("userAge"));
		
		
		
		
        String userID = null;
        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        if(userID != null)
        {
        	request.setAttribute("errorMessage", "이미 로그인 되었습니다.");
        	return "main";
        }
        if(request.getParameter("userID") == null || request.getParameter("userPassword")== null ||
        		request.getParameter("userEmail") == null || 
        				request.getParameter("userAge") == null || request.getParameter("userNumber") == null)
        {
        	request.setAttribute("errorMessage", "입력이 안된 사항이 있습니다.");
        	return "join";
    } else {
        UserDAO userDAO = new UserDAO();
        int result = userDAO.join(user);
            if(result == -1){
            	request.setAttribute("errorMessage", "이미 존재하는 아이디입니다.");
            	return "join";
            }
            else {
                session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
            	return "main";
                }
        }
	}
}
