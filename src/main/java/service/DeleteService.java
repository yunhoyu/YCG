package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookDAO;
import show.ShowDAO;
import theater.TheaterDAO;

public class DeleteService implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
    	String bNo = request.getParameter("bNo");
    	String showNo = request.getParameter("showNo");

   	
        String userID = null;
        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        
        if(userID == null)
        {
        	request.setAttribute("errorMessage", "로그인을 하세요.");
            return "login";
        } 
        TheaterDAO theaterDAO = new TheaterDAO();
        ShowDAO showDAO = new ShowDAO();
        BookDAO bookDAO = new BookDAO();
        
        int result1 = theaterDAO.delete(showNo);
        int result2 = showDAO.delete(showNo);
        int result3 = bookDAO.delete(bNo);
        
            
                if(result1 == -1 ||result2 == -1 ||result3 == -1){ // 글삭제에 실패했을 경우
                	request.setAttribute("errorMessage", "영화 예약 취소가 되지 않았습니다.");
                    return "myPage";
                }
                else { // 글삭제에 성공했을 경우
                	return "main";
                }
            
        
        
	}

}
