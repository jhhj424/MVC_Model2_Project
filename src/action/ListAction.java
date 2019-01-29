package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class ListAction extends AdminUserAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDao dao = new MemberDao();
		List<Member> list = dao.list();
		request.setAttribute("list", list);
		return new ActionForward(false,"list.jsp");
	}
}
