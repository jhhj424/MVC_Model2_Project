package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
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

import action.Action;
import action.ActionForward;
/*
 * urlPatterns = { "*.me" } : xxx.me 요청시 ControllerServlet 서블릿 호출
 *   /model2/hello.me 요청시 ControllerServlet 서블릿 호출
 */
@WebServlet(urlPatterns = { "*.me" }, initParams = { @WebInitParam(name = "properties", value = "action.properties") })
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();

	public ControllerServlet() {
		super();
	}
/* init : 서블릿 처음 호출시 한번 실행되는 메서드
 * config : properties = action.properties config 객체 전달
 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// props : "action.properties" 저장
		String props = config.getInitParameter("properties"); 
		//Pr : Map 객체. (Key, value)
		// Hashtable 클래스 > Properties 클래스. 
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			//f : /WEB-INF/action.properties 파일을 저장
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			pr.load(f);
			/*
			 * /model2/hello.me=action.HelloAction
			 * pr.put("/model2/hello.me","action.HelloAction")
			 */
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			try {
				if (f != null)
					f.close();
			} catch (IOException e) {
			}
		}
		for (Object k : pr.keySet()) { 
			String command = (String) k; //model2/hello.me
			String className = pr.getProperty(command);//action.HelloAction
			try {
				//commandClass : action.HelloAction 클래스를 로드
				Class commandClass = Class.forName(className);
				//newInstance : 객체와 시킴
				//commandInstance : action.HelloAction 클래스의 객체 저장
				Object commandInstance = commandClass.newInstance();
				//commandMap : /model2/hello.me, action.HelloAction객체
				commandMap.put(command, (Action)commandInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//commandMap 객체 :  action.HelloAction 
		request.setCharacterEncoding("euc-kr");//파라미터 인코딩
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			//request.getRequestURI() : jspStudy2/model2/hello.me
			//request.getContextPath() : /jspStudy2
			//command : /model2/hello.me 저장. commandMap객체의 key값 중 한개
			command =request.getRequestURI().substring(request.getContextPath().length()); // /model2/hello.me
			//action : action.HelloAction 객체를 저장
			action = commandMap.get(command); //HelloAction객체
			//forward : new ActionForward(false,"hello.jsp")
			forward = action.execute(request,response); //HelloAction객체를 실행 
		}catch (NullPointerException e) {
			forward = new ActionForward(false, null);
		}catch (Exception e) {
			throw new ServletException(e);
		}
		if(forward !=null) {
			if(forward.isRedirect()) { //false 가 되서 else로 빠짐 
				response.sendRedirect(forward.getView());
			}else {
				//forward 대상 페이지를 설정
				if(forward.getView() == null) {
					forward.setView(command.replace(".me", ".jsp"));
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getView());
				dispatcher.forward(request,response);
			}
		}else {
			response.sendRedirect("nopage.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}