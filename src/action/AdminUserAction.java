package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class AdminUserAction implements Action {
	protected String login;
	protected String id;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if(login==null) {
			request.setAttribute("msg", "�α����ϼ���");
			request.setAttribute("url", "loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		} else {
			if(!login.equals("admin")) {
				request.setAttribute("msg", "�����ڸ� ��ȸ �����մϴ�");
				request.setAttribute("url", "main.jsp");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		return doExecute(request, response);
	}
	public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
