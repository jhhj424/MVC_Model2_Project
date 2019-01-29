package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");
		if(login.equals("") || login==null) { //로그아웃
			return new ActionForward(false, "loginForm.jsp");
		} else {//로그인 된 경우
			return new ActionForward(false, "main.jsp");
		}
	}

}
