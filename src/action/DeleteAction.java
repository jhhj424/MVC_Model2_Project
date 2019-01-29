package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import model.MemberDao;

public class DeleteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pass = request.getParameter("pass");// ÀÔ·ÂÇÑ ºñ¹Ð¹øÈ£°ª
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		mem = dao.selectOne(id); // ³Ñ¾î¿Â id°ªÀ¸·Î mem°´Ã¼ ÇÏ³ª »ý¼º
//		System.out.println(id + "," + login + "," + pass);
//		System.out.println(mem);
		HttpSession session = request.getSession();
		String msg = null;
		String url = null;
		if (id.equals("admin")) {
			msg = "°ü¸®ÀÚ´Â Å»ÅðºÒ°¡";
			url = "list.me";
		} else {
			if (login.equals("admin") || pass.equals(mem.getPass())) { // ºñ¹øÀÌ ¸ÂÀ»°æ¿ì or admin ÀÎ°æ¿ì
				dao.deleteA(id);
				dao.deleteB(id);
				dao.deleteC(id);
				if (dao.delete(id) > 0) {
					if (login.equals("admin")) {
						msg = id + "´Ô °­Á¦ Å»Åð";
						url = "list.me";
					} else {
						session.invalidate();
						msg = id + "´Ô Å»ÅðÇÏ¼Ì½À´Ï´Ù";
						url = "main.jsp";
					}
				} else {
					msg = id + "´Ô Å»Åð ½ÇÆÐ";
					if (login.equals("admin")) {
						url = "list.me";
					} else
						url = "deleteForm.me?id=" + id;
				}
			} else {
				msg = id + "´Ô ºñ¹Ð¹øÈ£ Æ²¸²";
				url = "deleteForm.me?id=" + id;
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
	}
}