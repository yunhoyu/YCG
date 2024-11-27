package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutActionService implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// main.do 요청을 처리하는 부분
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "main";
	}

}
