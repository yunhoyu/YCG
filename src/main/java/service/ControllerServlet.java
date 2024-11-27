package service;

import java.awt.RenderingHints.Key;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerServlet
 */

//@WebServlet("/ControllerServlet")

@WebServlet(urlPatterns = "*.do", 
		initParams = {@WebInitParam(name = "config", 
		value = "/WEB-INF/commandHandler.properties")})
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//<커맨드, 핸들러클래스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	//서블릿 생성 후 초기화시 가장 먼저 호출되는 init() 메소드를 이용함
	public void init(ServletConfig config) throws ServletException {
		
		//초기 파라미터 값을 읽는 부분
		String configFile = config.getInitParameter("config");
		String configFilePath = config.getServletContext().getRealPath(configFile);
		
		Properties prop = new Properties();
		
		//설정 파일을 prop 객체에 로드시키는 부분
		try (FileInputStream fis = new FileInputStream(configFilePath)) {
			prop.load(fis);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		//설정 파일을 하나씩 읽어서 키값(호출되는 패턴)과 실행핸들러명을 읽어 맵에 저장 
		Iterator<Object> KeyIter = prop.keySet().iterator();
		while(KeyIter.hasNext()) {
			//키 = hello.do
			String command = (String) KeyIter.next();
			
			//클래스 문자열 --> 실제 인스턴스 객체로 생성
			String handlerClassName = prop.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = 
						(CommandHandler) handlerClass.newInstance();
				
				commandHandlerMap.put(command, handlerInstance);
				
			} catch (ClassNotFoundException | InstantiationException | 
					IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		//비즈니스 로직을 처리하는 부분
		
		//request.getRequestURI() => /week11/hello.do
		String command = request.getRequestURI();
		
		//getContextPath() => /week11
		command = command.substring(request.getContextPath().length()+1);
		//위 명령문을 실행하면 hello.do
		
		//인터페이스 변수 선언
		//인터페이스 변수에는 구현 객체가 대입될 수 있음 
		CommandHandler handler = commandHandlerMap.get(command);
		
		String viewPage = null;
		try {
		viewPage = handler.process(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		//서블릿에서 다음 페이지로 넘기늰 법
		if (viewPage != null) {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/"+viewPage+".jsp");
		rd.forward(request, response);
		}
	}

}
