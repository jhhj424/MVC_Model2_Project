package action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Board;
import model.BoardDao;

/*
 * 로그인 후 처리
 * 로그인 검증이 필요함. 로그인상태 : main.jsp로 forward
 *                 로그아웃상태:loginForm.jsp redirect 함.
 */
public class MainAction implements Action {
	BoardDao dao = new BoardDao();
	Board board = new Board();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login");	
		request.setAttribute("login", login);
		
		int pageNum = 1;
		int limit = 10;
		int type = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		// 검색정보
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column == null || column.equals("")) {
			column = null;
		}
		if (find == null || find.equals("")) {
			find = null;
		}
		request.setAttribute("find", find);
		int boardcount = dao.boardCountmain("admin");
//		System.out.println(boardcount);
		List<Board> list = dao.list(pageNum, limit, column, find, "admin");
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		int boardnum = (boardcount - (pageNum - 1) * limit);// 글번호정렬
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardnum);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));
		
		return new ActionForward(false, "main.jsp"); //false - forward
	}
}
