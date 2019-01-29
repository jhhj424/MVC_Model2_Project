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
 * urlPatterns = { "*.me" } : xxx.me ��û�� ControllerServlet ���� ȣ��
 *   /model2/hello.me ��û�� ControllerServlet ���� ȣ��
 */
@WebServlet(urlPatterns = { "*.me" }, initParams = { @WebInitParam(name = "properties", value = "action.properties") })
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();

	public ControllerServlet() {
		super();
	}
/* init : ���� ó�� ȣ��� �ѹ� ����Ǵ� �޼���
 * config : properties = action.properties config ��ü ����
 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// props : "action.properties" ����
		String props = config.getInitParameter("properties"); 
		//Pr : Map ��ü. (Key, value)
		// Hashtable Ŭ���� > Properties Ŭ����. 
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			//f : /WEB-INF/action.properties ������ ����
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
				//commandClass : action.HelloAction Ŭ������ �ε�
				Class commandClass = Class.forName(className);
				//newInstance : ��ü�� ��Ŵ
				//commandInstance : action.HelloAction Ŭ������ ��ü ����
				Object commandInstance = commandClass.newInstance();
				//commandMap : /model2/hello.me, action.HelloAction��ü
				commandMap.put(command, (Action)commandInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//commandMap ��ü :  action.HelloAction 
		request.setCharacterEncoding("euc-kr");//�Ķ���� ���ڵ�
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			//request.getRequestURI() : jspStudy2/model2/hello.me
			//request.getContextPath() : /jspStudy2
			//command : /model2/hello.me ����. commandMap��ü�� key�� �� �Ѱ�
			command =request.getRequestURI().substring(request.getContextPath().length()); // /model2/hello.me
			//action : action.HelloAction ��ü�� ����
			action = commandMap.get(command); //HelloAction��ü
			//forward : new ActionForward(false,"hello.jsp")
			forward = action.execute(request,response); //HelloAction��ü�� ���� 
		}catch (NullPointerException e) {
			forward = new ActionForward(false, null);
		}catch (Exception e) {
			throw new ServletException(e);
		}
		if(forward !=null) {
			if(forward.isRedirect()) { //false �� �Ǽ� else�� ���� 
				response.sendRedirect(forward.getView());
			}else {
				//forward ��� �������� ����
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