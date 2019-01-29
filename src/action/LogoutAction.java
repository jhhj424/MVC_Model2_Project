package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login");
		String msg = id + "´Ô ·Î±×¾Æ¿ô µÇ¼Ì½À´Ï´Ù.";
		String url = "main.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		session.invalidate();
		return new ActionForward(false, "../alert.jsp");
	}
}
