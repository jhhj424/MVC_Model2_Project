package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
 * 1. id, pass 파라미터 저장
 * 2. id로 db에서 회원 정보 조회. 없으면 해당 아이디 없음. loginForm.jsp 이동
 * 3. 비밀번호 검증
 *    비밀번호 일치 : id + 님이 로그인 하셨습니다. main.me 페이지 이동
 *    비밀번호불일치: 비밀번호가 틀립니다. loginForm.jsp 이동
 */
public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		String msg = "해당 아이디 없음";
		String url = "loginForm.jsp";
		if(mem!=null) { // 회원 존재하는 경우
			if(pass.equals(mem.getPass())) {
				msg = id + "님이 로그인 하셨습니다.";
				url = "main.me";
				request.getSession().setAttribute("login", id);
			}else { // 비밀번호가 틀린경우
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
