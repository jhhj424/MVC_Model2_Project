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
		if(!pass.equals(mem.getPass()) || (chgpass==null || chgpass.equals(""))) { // 비번이다르거나 바꿀비번을 입력안한경우
			if(chgpass==null || chgpass.equals("")) {
				request.setAttribute("url", "passchgForm.me?id="+id);
				request.setAttribute("msg", id+"님 바꿀 비밀번호를 입력하세요.");
				return new ActionForward(false, "../alert.jsp");
			}
			request.setAttribute("url", "passchgForm.me?id="+id);
			request.setAttribute("msg", id+"님 비밀번호가 틀립니다.");
			return new ActionForward(false, "../alert.jsp");
		} else {//비번일치 -> 비번변경
			if(new MemberDao().updatepass(id,chgpass) > 0) {
				request.setAttribute("url", "passchg.jsp");
				request.setAttribute("msg", id+"님 비밀번호 수정 성공!!");
				return new ActionForward(false, "../alert.jsp");
			} else {
				request.setAttribute("url", "passchgForm.me?id="+id);
				request.setAttribute("msg", id+"님 비밀번호 수정 실패!!");
				return new ActionForward(false, "../alert.jsp");
			}
		}
	}
}
