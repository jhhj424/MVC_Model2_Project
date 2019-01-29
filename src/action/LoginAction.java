package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
 * 1. id, pass �Ķ���� ����
 * 2. id�� db���� ȸ�� ���� ��ȸ. ������ �ش� ���̵� ����. loginForm.jsp �̵�
 * 3. ��й�ȣ ����
 *    ��й�ȣ ��ġ : id + ���� �α��� �ϼ̽��ϴ�. main.me ������ �̵�
 *    ��й�ȣ����ġ: ��й�ȣ�� Ʋ���ϴ�. loginForm.jsp �̵�
 */
public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		String msg = "�ش� ���̵� ����";
		String url = "loginForm.jsp";
		if(mem!=null) { // ȸ�� �����ϴ� ���
			if(pass.equals(mem.getPass())) {
				msg = id + "���� �α��� �ϼ̽��ϴ�.";
				url = "main.me";
				request.getSession().setAttribute("login", id);
			}else { // ��й�ȣ�� Ʋ�����
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
