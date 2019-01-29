package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * 회원가입을 위한 Action 클래스
 * 1. 파라미터 정보 Member객체 저장
 * 2. Member객체를 db에 insert .
 * 3. 등록성공 : loginForm.me이동
 *    등록실패 : joinForm.me이동
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
			request.setAttribute("msg", "회원가입이 성공적으로 완료되셨습니다. 로그인 해 주세요!");
			request.setAttribute("url", "loginForm.jsp");
		}else {
			request.setAttribute("msg", "회원가입에 실패하셨습니다. 다시 시도 해 주세요!");
			request.setAttribute("url", "joinForm.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}
}
