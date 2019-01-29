package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.AccompanyAllAction;

@WebServlet(urlPatterns = {"*.ao"},
			initParams= {@WebInitParam(name="properties",
										value="method.properties")})
public class ControllerAccompanyMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//Properties : Map<String,String> 객체
	private Properties pr = new Properties();       
    public ControllerAccompanyMethodServlet() {
        super();
    }
    @Override
    public void init(ServletConfig config) throws ServletException {
    	//props : "method.properties"저장
    	String props = config.getInitParameter("properties");
    	FileInputStream f = null;
    	try {
    		//f: WEB-INF/method.properties 파일 읽기 위한 입력 스트림.
    		f=new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
    		pr.load(f);
    	}catch (IOException e) {throw new ServletException(e);}
    	finally {
			try {
				if(f !=null) f.close();
			}catch(IOException e) {}
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		ActionForward forward = null;
		String command = null;
		try {
			//command : "/model2/hello.bo"
			command = request.getRequestURI().substring(request.getContextPath().length());
			Class[] paramType = new Class[] 
					{HttpServletRequest.class, HttpServletResponse.class};
			Object[] paramObjs = new Object[]{request,response};
			//methodName : "hello"
			String methodName = pr.getProperty(command);
			//method : AccompanyAllAction 클래스에서 hello(HttpServletRequest,HttpServletResponse)이름의 메서드 리턴
			//			설정된 이름에 해당하는 메서드 객체
			Method method = AccompanyAllAction.class.getMethod(methodName, paramType);
			//invoke : method를 호출.
			// forward = new AccompanyAllAction().hello(request,response);
			forward = (ActionForward)method.invoke(new AccompanyAllAction(), paramObjs);
		}catch(NullPointerException e) {
			forward = new ActionForward(false,null);
		}catch (Exception e) {
			throw new ServletException(e);
		}
		if(forward !=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".bo", ".jsp"));
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getView());
				dispatcher.forward(request, response);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
