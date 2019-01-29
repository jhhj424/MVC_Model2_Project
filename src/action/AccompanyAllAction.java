package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Accompany;
import model.AccompanyDao;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.Member;
import model.MemberDao;

public class AccompanyAllAction {
	protected String login;
	protected String id;
	protected String name;
//http://localhost:8080/jspStudy2/model2/hello.bo
	private BoardDao bdao = new BoardDao();
	private MemberDao mdao = new MemberDao();
	private AccompanyDao adao = new AccompanyDao();
	private Board board = new Board();
	private Member member = new Member();
	private Accompany accompany = new Accompany();

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello, World");
		return new ActionForward(false, "hello.jsp");
	}

	// http://localhost:8080/jspStudy2/model2/board/list.bo
	public ActionForward accompany(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num")); // ���� ����Խ����� �Խñ� ��ȣ
		int type = Integer.parseInt(request.getParameter("type"));
		String id = request.getParameter("id"); // ���� ��û�� ����id
		board = bdao.selectOne(num, type); // ����Խ����� ������ board
		String boid = board.getId(); // �������� id
		board.setId(id);// ��û�� ���� id�� board��ü id����
		// ���� �����û�� �ο� ���ϱ�
		int max = adao.maxpno(num);
		// ���� ���� ��û�� ����� ���ϱ�
		int mycnt = adao.mycnt(id);
		request.setAttribute("url", "../board/info.bo?num=" + num + "&type=" + type);
		if (id.equals(boid)) {
			request.setAttribute("msg", "���� �ۼ��� ���� �ۿ��� ��û�� �� �����ϴ�!");

		} else {
			if (mycnt > 9)
				request.setAttribute("msg", "�ִ� ���� ��û���� �ʰ��Ͽ� ��û�� �� �����ϴ�!");
			else {
				if (board.getMaxpno() <= max)
					request.setAttribute("msg", "�ִ��ο��� �ʰ��Ͽ� ��û�� �� �����ϴ�!");
				else {
					if (adao.insert(board)) {
						request.setAttribute("msg", "�����û�� �Ϸ�Ǿ����ϴ�. ���������� Ȯ�����ּ���!");
					} else {
						request.setAttribute("msg", "�����û�� �����߽��ϴ�. �̹� ��û�� �������� �ٽ� Ȯ���� �ּ���!");
					}

				}
			}
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward acmgroup(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id"); // �� id
		List<Integer> num = adao.selectnum(id);
		List<Accompany> accompanylist = adao.accompanylist(id);
		Board acbo = new Board();
		List<Board> aclist = new ArrayList<Board>();
		for (int i = 0; i < num.size(); i++) {
			// System.out.println("1 ) num="+num.get(i));
			acbo = bdao.selectOne(num.get(i), 2);
			aclist.add(acbo);
		}
		int pageNum = 1;
		int limit = 10;
		int type = 2;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		// �˻�����
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column == null || column.equals("")) {
			column = null;
		}
		if (find == null || find.equals("")) {
			find = null;
		}
		int boardcount = adao.accompanyCount(column, find, id);
//		System.out.println(boardcount);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		int boardnum = (boardcount - (pageNum - 1) * limit);// �۹�ȣ����
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("find", find);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("boardnum", boardnum);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));

		request.setAttribute("aclist", aclist);
		request.setAttribute("accompanylist", accompanylist);

		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false, "acmgroup.jsp");
	}

	public ActionForward myacmgroup(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id"); // �� id
		List<Integer> num = adao.selectnum(id);
		List<Accompany> accompanylist = adao.accompanylist(id);
		Board acbo = new Board();
		List<Board> aclist = new ArrayList<Board>();
		for (int i = 0; i < num.size(); i++) {
			// System.out.println("1 ) num="+num.get(i));
			acbo = bdao.selectOne(num.get(i), 2);
			aclist.add(acbo);
		}
		int pageNum = 1;
		int limit = 10;
		int type = 2;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		// �˻�����
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column == null || column.equals("")) {
			column = null;
		}
		if (find == null || find.equals("")) {
			find = null;
		}
		request.setAttribute("find", find);
		int boardcount = adao.myaccompanyCount(column, find, id);
		// ------------------������-----------------------------

		if (id.equals("admin")) {
			boardcount = 0;
			boardcount = bdao.boardCount(column, find, 2);
		}

		// ------------------������-----------------------------
//		System.out.println(boardcount);

		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		int boardnum = (boardcount - (pageNum - 1) * limit);// �۹�ȣ����
		if (endpage > maxpage)
			endpage = maxpage;
		List<Board> list = bdao.list(pageNum, limit, column, find, type, id);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("boardnum", boardnum);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));

		request.setAttribute("aclist", aclist);
		request.setAttribute("accompanylist", accompanylist);

		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);

		// ------------------������-----------------------------

		if (id.equals("admin")) {
			List<Board> adminlist = bdao.list(pageNum, limit, column, find, type);
			request.setAttribute("list", adminlist);
		}

		// ------------------������-----------------------------
		return new ActionForward(false, "myacmgroup.jsp");
	}

	public ActionForward accompanylist(HttpServletRequest request, HttpServletResponse response) { // ���� ���� ����Խù��� ��û��
																									// ��� ����Ʈ �����ֱ�
		int type = 2; // ����Խ��� type
		int num = Integer.parseInt(request.getParameter("num")); // ������ �Խñ� ��ȣ
		// select id from accompany where num = ${num} <<-- ��û�� ȸ�� id ����Ʈ
		// select * from member where id = ${id} <<-- ������ �޾ƿ� id�� �־ ȸ�� ����Ʈ �̾ƿ���
		List<String> id = adao.selectid(num);
		List<Member> list = new ArrayList<Member>();
		List<Integer> chk = new ArrayList<Integer>();
		List<Accompany> accompanylist2 = adao.accompanylist2(num);
		for (int i = 0; i < id.size(); i++) {
			list.add(mdao.selectOne(id.get(i)));
		}
		Accompany ac = new Accompany();
		List<Accompany> aclist = new ArrayList<Accompany>();
		for (int i = 0; i < id.size(); i++) {
			int chkno = adao.selectchk(id.get(i), num);
			chk.add(chkno);
//			System.out.println("chkno : " + chkno);
//			System.out.println("id.get(i) : " + id.get(i));
//			System.out.println("num : " + num);
			ac.setChk(chkno);
			ac.setId(id.get(i));
			ac.setNum(num);
			aclist.add(ac);
//			System.out.println("ac : " + ac);
		}
		String login = (String) request.getSession().getAttribute("login");
//		System.out.println(chk);
		request.setAttribute("list", list);
		request.setAttribute("accompanylist2", accompanylist2);
		request.setAttribute("login", login);
		return new ActionForward(false, "accompanylist.jsp");
	}

	public ActionForward accept(HttpServletRequest request, HttpServletResponse response) {// �������
		String id = request.getParameter("id"); // ���� ��û�� ����id
		int num = Integer.parseInt(request.getParameter("num")); // ���� ����Խ����� �Խñ� ��ȣ
		board = bdao.selectOne(num, 2);
		board.setId(id);
		board.setNum(num);
		int max = adao.maxpno(num);
		if (max >= board.getMaxpno()) { //�ο��ʰ�
			request.setAttribute("msg", "���� �ִ��ο����� �ʰ��Ͽ� ������ �� �����ϴ�.");
			request.setAttribute("url", "accompanylist.ao?id=" + id + "&num=" + num);
		} else {//�ο��� �� ������
			if (adao.chkupdate(board)) {
				request.setAttribute("msg", id + " ���� �����û�� �����ϼ̽��ϴ�.");
				request.setAttribute("url", "accompanylist.ao?id=" + id + "&num=" + num);
			} else {
				request.setAttribute("msg", id + " ���� �����û�� �����ϴµ� �����ϼ̽��ϴ�.");
				request.setAttribute("url", "accompanylist.ao?id=" + id + "&num=" + num);
			}
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward refusal(HttpServletRequest request, HttpServletResponse response) {// �������
		String id = request.getParameter("id"); // ���� ��û�� ����id
		int num = Integer.parseInt(request.getParameter("num")); // ���� ����Խ����� �Խñ� ��ȣ
		board = bdao.selectOne(num, 2);
		board.setId(id);
		board.setNum(num);
		if (adao.chkupdate2(board)) {
			request.setAttribute("msg", id + " ���� �����û�� �����ϼ̽��ϴ�.");
			request.setAttribute("url", "accompanylist.ao?id=" + id + "&num=" + num);
		} else {
			request.setAttribute("msg", id + " ���� �����û�� �����ϴµ� �����ϼ̽��ϴ�.");
			request.setAttribute("url", "accompanylist.ao?id=" + id + "&num=" + num);
		}
		return new ActionForward(false, "../alert.jsp");
	}
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		//�޾ƾߵǴ°� : id, 
		String id = request.getParameter("id"); // �� id
		int bnum = Integer.parseInt(request.getParameter("num"));
		if(bnum!=0) {
			Board board = new BoardDao().selectOne(bnum, 2);
			board.setId(id);
			adao.delete(board);
		}
		List<Integer> num = adao.selectnum(id);
		List<Accompany> accompanylist = adao.accompanylist(id);
		Board acbo = new Board();
		List<Board> aclist = new ArrayList<Board>();
		for (int i = 0; i < num.size(); i++) {
			// System.out.println("1 ) num="+num.get(i));
			acbo = bdao.selectOne(num.get(i), 2);
			aclist.add(acbo);
		}
		int pageNum = 1;
		int limit = 10;
		int type = 2;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		// �˻�����
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column == null || column.equals("")) {
			column = null;
		}
		if (find == null || find.equals("")) {
			find = null;
		}
		int boardcount = adao.accompanyCount(column, find, id);
//		System.out.println(boardcount);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		int boardnum = (boardcount - (pageNum - 1) * limit);// �۹�ȣ����
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("find", find);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("boardnum", boardnum);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));

		request.setAttribute("aclist", aclist);
		request.setAttribute("accompanylist", accompanylist);

		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false, "acmgroup.jsp");
	}
}
