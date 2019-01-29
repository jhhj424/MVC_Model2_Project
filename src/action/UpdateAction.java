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
		if (!mem.getPass().equals(request.getParameter("pass"))) {//비번오류
			request.setAttribute("url", "updateForm.me?id=" + login);
			request.setAttribute("msg", id+"님 비밀번호가 틀립니다");
			return new ActionForward(false, "../alert.jsp");
		} else {//비번성공
			if (dao.update(mem) > 0) {// 수정성공
				request.setAttribute("url", "info.me?id=" + login);
				if(login.equals("admin")) request.setAttribute("url", "list.me?id=" + login);
				request.setAttribute("msg", id+"님 수정성공");
				return new ActionForward(false, "../alert.jsp");
			} else {// 수정실패
				request.setAttribute("url", "updateForm.me?id=" + login);
				request.setAttribute("msg", id+"님 수정실패");
				return new ActionForward(false, "../alert.jsp");
			}
		}
	}
}
