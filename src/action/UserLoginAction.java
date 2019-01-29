package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class UserLoginAction implements Action {
	protected String login;
	protected String id;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		String type = null;
		if (request.getRequestURI().contains("delete"))
			type = "����";
		else if (request.getRequestURI().contains("update") || request.getRequestURI().contains("passchg"))
			type = "����";
		else
			type = "��ȸ";
		if (login == null) {
			request.setAttribute("msg", "�α��� �� �ŷ� �ϼ���");
			request.setAttribute("url", "loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		} else {
			if (!login.equals(id) && !login.equals("admin")) {
				request.setAttribute("msg", "���� ������" + type + " �����մϴ�.");
				request.setAttribute("url", "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		return doExecute(request, response);
	}
	public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
