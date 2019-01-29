package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");
		if(login.equals("") || login==null) { //�α׾ƿ�
			return new ActionForward(false, "loginForm.jsp");
		} else {//�α��� �� ���
			return new ActionForward(false, "main.jsp");
		}
	}

}
