package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class UpdateAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		mem = dao.selectOne(id);
		mem.setPicture(request.getParameter("picture"));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setAddress(request.getParameter("address"));
		mem.setRemember(request.getParameter("remember"));
		if (!mem.getPass().equals(request.getParameter("pass"))) {//�������
			request.setAttribute("url", "updateForm.me?id=" + login);
			request.setAttribute("msg", id+"�� ��й�ȣ�� Ʋ���ϴ�");
			return new ActionForward(false, "../alert.jsp");
		} else {//�������
			if (dao.update(mem) > 0) {// ��������
				request.setAttribute("url", "info.me?id=" + login);
				if(login.equals("admin")) request.setAttribute("url", "list.me?id=" + login);
				request.setAttribute("msg", id+"�� ��������");
				return new ActionForward(false, "../alert.jsp");
			} else {// ��������
				request.setAttribute("url", "updateForm.me?id=" + login);
				request.setAttribute("msg", id+"�� ��������");
				return new ActionForward(false, "../alert.jsp");
			}
		}
	}
}
