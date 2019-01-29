package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import model.MemberDao;

public class DeleteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pass = request.getParameter("pass");// �Է��� ��й�ȣ��
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		mem = dao.selectOne(id); // �Ѿ�� id������ mem��ü �ϳ� ����
//		System.out.println(id + "," + login + "," + pass);
//		System.out.println(mem);
		HttpSession session = request.getSession();
		String msg = null;
		String url = null;
		if (id.equals("admin")) {
			msg = "�����ڴ� Ż��Ұ�";
			url = "list.me";
		} else {
			if (login.equals("admin") || pass.equals(mem.getPass())) { // ����� ������� or admin �ΰ��
				dao.deleteA(id);
				dao.deleteB(id);
				dao.deleteC(id);
				if (dao.delete(id) > 0) {
					if (login.equals("admin")) {
						msg = id + "�� ���� Ż��";
						url = "list.me";
					} else {
						session.invalidate();
						msg = id + "�� Ż���ϼ̽��ϴ�";
						url = "main.jsp";
					}
				} else {
					msg = id + "�� Ż�� ����";
					if (login.equals("admin")) {
						url = "list.me";
					} else
						url = "deleteForm.me?id=" + id;
				}
			} else {
				msg = id + "�� ��й�ȣ Ʋ��";
				url = "deleteForm.me?id=" + id;
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
	}
}