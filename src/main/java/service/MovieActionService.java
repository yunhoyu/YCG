package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookDAO;
import show.ShowDAO;
import theater.TheaterDAO;
import user.UserDAO;

public class MovieActionService implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
	    
	    String mNo = request.getParameter("mNo");
	    String showDate = request.getParameter("showDate");
	    String theater = request.getParameter("theater");
	    String seat = request.getParameter("seat");
	    String[] theaterResult = theater.split("-");
	    showDate = showDate + " " + theaterResult[0];
	    String tName = theaterResult[1];
	   	String[] seatResult = seat.split("-");
	   	String col = seatResult[0];
	   	String row = seatResult[1];
	   	
	        String userID = null;
	        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
	        if(session.getAttribute("userID") != null )
	        {
	            userID = (String) session.getAttribute("userID");
	        }
	        
	        if(userID == null)
	        {
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('로그인을 하세요')");
	            script.println("location.href = 'login.jsp'");
	            script.println("</script>");
	        } else {
	        if(mNo == null || showDate == null || theater == null || seat == null) {
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('입력이 안된 사항이 있습니다.')");
	            script.println("history.back()");
	            script.println("</script>");
	        } else {
	            TheaterDAO theaterDAO = new TheaterDAO();
	            ShowDAO showDAO = new ShowDAO();
	            BookDAO bookDAO = new BookDAO();
	            int result1 = theaterDAO.write(tName,col,row);
	            int result2 = showDAO.write( mNo, showDate);
	            int result3 = bookDAO.write( userID);
	                if(result1 == -1 || result2 == -1 || result3 == -1){ // 글쓰기에 실패했을 경우
	                  
	                    request.setAttribute("errorMessage", "예약에 실패했습니다.");
	                    return "seat";
	                }
	                else { 
	                	request.setAttribute("errorMessage", "예약하셨습니다.");
	                    return "main";
	                    }
	            }
	        }
	        request.setAttribute("errorMessage", "오류가 발생했습니다. 다시 시도해주세요");
            return "main";
	}

}
