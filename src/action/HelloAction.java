package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("hello", "Hollo World");
		String login = (String)request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false,"hello.jsp");
	}

}
