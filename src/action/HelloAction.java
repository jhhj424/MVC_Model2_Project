package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

public class HelloAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("hello", "Hollo World");
		String login = (String)request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false,"hello.jsp");
	}

}
