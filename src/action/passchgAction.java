package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class passchgAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new MemberDao().selectOne(id);
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		if(!pass.equals(mem.getPass()) || (chgpass==null || chgpass.equals(""))) { // ����̴ٸ��ų� �ٲܺ���� �Է¾��Ѱ��
			if(chgpass==null || chgpass.equals("")) {
				request.setAttribute("url", "passchgForm.me?id="+id);
				request.setAttribute("msg", id+"�� �ٲ� ��й�ȣ�� �Է��ϼ���.");
				return new ActionForward(false, "../alert.jsp");
			}
			request.setAttribute("url", "passchgForm.me?id="+id);
			request.setAttribute("msg", id+"�� ��й�ȣ�� Ʋ���ϴ�.");
			return new ActionForward(false, "../alert.jsp");
		} else {//�����ġ -> �������
			if(new MemberDao().updatepass(id,chgpass) > 0) {
				request.setAttribute("url", "passchg.jsp");
				request.setAttribute("msg", id+"�� ��й�ȣ ���� ����!!");
				return new ActionForward(false, "../alert.jsp");
			} else {
				request.setAttribute("url", "passchgForm.me?id="+id);
				request.setAttribute("msg", id+"�� ��й�ȣ ���� ����!!");
				return new ActionForward(false, "../alert.jsp");
			}
		}
	}
}
