package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * ȸ�������� ���� Action Ŭ����
 * 1. �Ķ���� ���� Member��ü ����
 * 2. Member��ü�� db�� insert .
 * 3. ��ϼ��� : loginForm.me�̵�
 *    ��Ͻ��� : joinForm.me�̵�
 */
public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setPass(request.getParameter("pass"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setEmail(request.getParameter("email"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		mem.setBirth(year+"-"+month+"-"+day);
		mem.setAddress(request.getParameter("address"));
		mem.setRemember(request.getParameter("remember"));
		int result = new MemberDao().insert(mem);
		if (result > 0) {
			request.setAttribute("msg", "ȸ�������� ���������� �Ϸ�Ǽ̽��ϴ�. �α��� �� �ּ���!");
			request.setAttribute("url", "loginForm.jsp");
		}else {
			request.setAttribute("msg", "ȸ�����Կ� �����ϼ̽��ϴ�. �ٽ� �õ� �� �ּ���!");
			request.setAttribute("url", "joinForm.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}
}
