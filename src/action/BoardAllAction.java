package action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.AccompanyDao;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.Member;
import model.MemberDao;

public class BoardAllAction {
	protected String login;
	protected String id;
	protected String name;
//http://localhost:8080/jspStudy2/model2/hello.bo
	private BoardDao dao = new BoardDao();

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello, World");
		return new ActionForward(false, "hello.jsp");
	}

	// http://localhost:8080/jspStudy2/model2/board/list.bo
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {

		int pageNum = 1;
		int limit = 10;
		int type = 1;
		type = Integer.parseInt(request.getParameter("type"));
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
		int boardcount = dao.boardCount(column, find, type);
//		System.out.println(boardcount);
		List<Board> list = dao.list(pageNum, limit, column, find, type);
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
		request.setAttribute("boardnum", boardnum);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));
		request.setAttribute("type", type);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);

		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		if (type == 1)
			return new ActionForward(false, "list.jsp");
		if (type == 2)
			return new ActionForward(false, "list2.jsp");
		return new ActionForward(false, "list3.jsp");
	}

	public ActionForward list2(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		name = request.getParameter("name");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인이 필요한 게시판 입니다.");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		int pageNum = 1;
		int limit = 10;
		int type = 2;
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
		int boardcount = dao.boardCount(column, find, type);
//		System.out.println(boardcount);
		List<Board> list = dao.list(pageNum, limit, column, find, type);
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

		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false, "list2.jsp");
	}

	public ActionForward list3(HttpServletRequest request, HttpServletResponse response) {

		int pageNum = 1;
		int limit = 10;
		int type = 3;
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
		int boardcount = dao.boardCount(column, find, type);
//		System.out.println(boardcount);
		List<Board> list = dao.list(pageNum, limit, column, find, type);
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

		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false, "list3.jsp");
	}

	// 게시물등록 요청시 호출되는 메서드
	public ActionForward write // 추천리뷰게시판글쓰기
	(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		name = request.getParameter("name");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board bo = new Board();
			bo.setId(multi.getParameter("name"));
			bo.setPass(multi.getParameter("pass"));
			bo.setSubject(multi.getParameter("subject"));
			bo.setContent(multi.getParameter("content"));
			bo.setFile1(multi.getFilesystemName("file1"));
			bo.setCountry(multi.getParameter("country"));
			bo.setLoc(multi.getParameter("loc"));
			String syear = multi.getParameter("syear");
			String smonth = multi.getParameter("smonth");
			String sday = multi.getParameter("sday");
			String eyear = multi.getParameter("eyear");
			String emonth = multi.getParameter("emonth");
			String eday = multi.getParameter("eday");
			bo.setSdate(syear + smonth + sday);
			bo.setEdate(eyear + emonth + eday);
			bo.setType(Integer.parseInt(multi.getParameter("type")));
			int num = dao.maxNum();
			bo.setNum(++num);
//			bo.setRef(num);
			// ------------------------------비밀번호 확인
			String pass = bo.getPass(); // 입력한 비번
			Member mem = new Member();
			MemberDao mdao = new MemberDao();
			mem = mdao.selectOne(login);
			if (!mem.getPass().equals(pass)) { // 로그인사용자의 비번이랑 입력한 비밀번호가 다를때
				request.setAttribute("msg", "비밀번호가 틀렸습니다.");
				request.setAttribute("url", "writeForm.jsp");
				request.setAttribute("login", login);
				return new ActionForward(false, "../alert.jsp");
			}
			// ----------------------------------------------------
			if (dao.insert(bo)) {
				request.setAttribute("msg", "게시물 등록 성공");
			} else {
				request.setAttribute("msg", "게시물 등록 실패(날짜를 다시 확인하세요!)");
			}
			request.setAttribute("url", "list.bo?type=1");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward write2 // 동행게시판글쓰기
	(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		name = request.getParameter("name");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board bo = new Board();
			bo.setId(multi.getParameter("name"));
			bo.setPass(multi.getParameter("pass"));
			bo.setSubject(multi.getParameter("subject"));
			bo.setContent(multi.getParameter("content"));
			bo.setFile1(multi.getFilesystemName("file1"));
			bo.setCountry(multi.getParameter("country"));
			bo.setLoc(multi.getParameter("loc"));
			String syear = multi.getParameter("syear");
			String smonth = multi.getParameter("smonth");
			String sday = multi.getParameter("sday");
			String eyear = multi.getParameter("eyear");
			String emonth = multi.getParameter("emonth");
			String eday = multi.getParameter("eday");
			bo.setSdate(syear + smonth + sday);
			bo.setEdate(eyear + emonth + eday);
			bo.setType(Integer.parseInt(multi.getParameter("type")));
			bo.setMaxpno(Integer.parseInt(multi.getParameter("maxpno")));
			int num = dao.maxNum();
			bo.setNum(++num);
//			bo.setRef(num);
			// ------------------------------비밀번호 확인
			String pass = bo.getPass(); // 입력한 비번
			Member mem = new Member();
			MemberDao mdao = new MemberDao();
			mem = mdao.selectOne(login);
			if (!mem.getPass().equals(pass)) { // 로그인사용자의 비번이랑 입력한 비밀번호가 다를때
				request.setAttribute("msg", "비밀번호가 틀렸습니다.");
				request.setAttribute("url", "writeForm.jsp");
				request.setAttribute("login", login);
				return new ActionForward(false, "../alert.jsp");
			}
			// ----------------------------------------------------
			if (dao.insert(bo)) {
				request.setAttribute("msg", "게시물 등록 성공");
			} else {
				request.setAttribute("msg", "게시물 등록 실패");
			}
			request.setAttribute("url", "list2.bo?type=2");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward write3(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		name = request.getParameter("name");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board bo = new Board();
			bo.setId(multi.getParameter("name"));
			bo.setPass(multi.getParameter("pass"));
			bo.setSubject(multi.getParameter("subject"));
			bo.setContent(multi.getParameter("content"));
			bo.setFile1(multi.getFilesystemName("file1"));
			bo.setType(Integer.parseInt(multi.getParameter("type")));
			int num = dao.maxNum();
			bo.setNum(++num);
//			bo.setRef(num);
			// ------------------------------비밀번호 확인
			String pass = bo.getPass(); // 입력한 비번
			Member mem = new Member();
			MemberDao mdao = new MemberDao();
			mem = mdao.selectOne(login);
			if (!mem.getPass().equals(pass)) { // 로그인사용자의 비번이랑 입력한 비밀번호가 다를때
				request.setAttribute("msg", "비밀번호가 틀렸습니다.");
				request.setAttribute("url", "writeForm3.jsp");
				request.setAttribute("login", login);
				return new ActionForward(false, "../alert.jsp");
			}
			// ----------------------------------------------------
			if (dao.insert(bo)) {
				request.setAttribute("msg", "게시물 등록 성공");
			} else {
				request.setAttribute("msg", "게시물 등록 실패");
			}
			request.setAttribute("url", "list3.bo?type=1");
			if(login.equals("admin")) {
				request.setAttribute("url", "../member/main.me");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		int num = Integer.parseInt(request.getParameter("num")); // 게시물 번호
		int pageNum = 1;
		int limit = 5;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int commentCount = dao.commentCount(num);
		int maxpage = (int) ((double) commentCount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));
		AccompanyDao adao = new AccompanyDao();
		int anum = adao.maxpno(num);
		int type = Integer.parseInt(request.getParameter("type"));
		Board board = dao.selectOne(num, type); // num게시물의 board객체
		List<Comment> comment = dao.commentselectlist(num,pageNum,limit);
		request.setAttribute("comment", comment);
		request.setAttribute("board", board);
		request.setAttribute("anum", anum);
		dao.readcntadd(num);
		request.setAttribute("commentCount", commentCount);
		return new ActionForward(false, "info.jsp");
	}

	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		int num = Integer.parseInt(request.getParameter("num")); // 게시물 번호
		int type = Integer.parseInt(request.getParameter("type"));
		// System.out.println(syear.substring(syear.length()-3));
//		String smonth = request.getParameter("smonth");
//		String sday = request.getParameter("sday");
//		String eyear = request.getParameter("eyear");
//		String emonth = request.getParameter("emonth");
//		String eday = request.getParameter("eday");
//		request.setAttribute("syear", syear);
//		request.setAttribute("smonth", smonth);
//		request.setAttribute("sday", sday);
//		request.setAttribute("eyear", eyear);
//		request.setAttribute("emonth", emonth);
//		request.setAttribute("eday", eday);
		Board board = dao.selectOne(num, type); // num게시물의 board객체
		// System.out.println(board.getSdate() + "끝날짜/" + board.getEdate());
		if ((type != 3)&&(type!=4)) {
			String sdate = board.getSdate();
			String[] array = sdate.split("-");
			request.setAttribute("syear", array[0]);
			request.setAttribute("smonth", array[1]);
			request.setAttribute("sday", array[2]);
			String edate = board.getEdate();
			String[] array1 = edate.split("-");
			request.setAttribute("eyear", array1[0]);
			request.setAttribute("emonth", array1[1]);
			request.setAttribute("eday", array1[2]);
		}
		request.setAttribute("board", board);
		request.setAttribute("login", login);
		return new ActionForward();
	}

	/*
	 * public ActionForward reply(HttpServletRequest request, HttpServletResponse
	 * response) { Board bo = new Board(); int num =
	 * (Integer.parseInt(request.getParameter("num"))); bo = dao.selectOne(num);
	 * //-----------------------------로그인확인 login = (String)
	 * request.getSession().getAttribute("login"); id = request.getParameter("id");
	 * if (login == null) { request.setAttribute("msg", "로그인 하세요");
	 * request.setAttribute("url", "../member/loginForm.jsp"); return new
	 * ActionForward(false, "../alert.jsp"); }
	 * //----------------------------------------------------
	 * //------------------------------비밀번호 확인 String pass =
	 * request.getParameter("pass"); //입력한 비번 Member mem = new Member(); MemberDao
	 * mdao = new MemberDao(); mem = mdao.selectOne(login);
	 * if(!mem.getPass().equals(pass)) { // 로그인사용자의 비번이랑 입력한 비밀번호가 다를때
	 * request.setAttribute("msg", "비밀번호가 틀렸습니다."); request.setAttribute("url",
	 * "replyForm.bo?num="+bo.getNum()); request.setAttribute("login", login);
	 * return new ActionForward(false, "../alert.jsp"); }
	 * //---------------------------------------------------- Board board = new
	 * Board(); board.setNum(Integer.parseInt(request.getParameter("num"))); //
	 * board.setRef(Integer.parseInt(request.getParameter("ref"))); //
	 * board.setReflevel(Integer.parseInt(request.getParameter("reflevel"))); //
	 * board.setRefstep(Integer.parseInt(request.getParameter("refstep"))); //
	 * board.setName(request.getParameter("name"));
	 * board.setPass(request.getParameter("pass"));
	 * board.setSubject(request.getParameter("subject"));
	 * board.setContent(request.getParameter("content")); if(dao.reply(board)) {
	 * return new ActionForward(false, "list.bo"); }else { return new
	 * ActionForward(false, "replyForm.bo?num="+board.getNum()); } }
	 */
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board bo = new Board();
			int num = Integer.parseInt(multi.getParameter("num"));
			String pass = multi.getParameter("pass");
			int type = Integer.parseInt(multi.getParameter("type"));
			Board board = dao.selectOne(num, type); // num게시물의 board객체
			bo = dao.selectOne(num, type);
			// System.out.println(board.toString());
			bo.setNum(num);
			if (type != 3 && type!=4) {
				bo.setCountry(multi.getParameter("country"));
				bo.setLoc(multi.getParameter("loc"));
				String syear = multi.getParameter("syear");
				String smonth = multi.getParameter("smonth");
				String sday = multi.getParameter("sday");
				String eyear = multi.getParameter("eyear");
				String emonth = multi.getParameter("emonth");
				String eday = multi.getParameter("eday");
				bo.setSdate(syear + smonth + sday);
				bo.setEdate(eyear + emonth + eday);
				if (type == 2)
					bo.setMaxpno(Integer.parseInt(multi.getParameter("maxpno")));
			}
			bo.setId(multi.getParameter("name"));
			bo.setSubject(multi.getParameter("subject"));
			bo.setContent(multi.getParameter("content"));
			bo.setFile1(multi.getFilesystemName("file1"));
			bo.setType(type);
			if (bo.getFile1() == null || bo.getFile1().equals("")) {
				// 파일수정을 안했을경우 원래 파일을 그대로 받아옴
				bo.setFile1(multi.getParameter("file2"));
			}
			if (!pass.equals(bo.getPass()) && !login.equals("admin")) {
				request.setAttribute("msg", "비밀번호가 틀렸습니다");
				request.setAttribute("url", "updateForm.bo?num=" + bo.getNum() + "&type=" + type);
			} else {
				if (dao.update(bo)) {
					request.setAttribute("msg", "게시물 수정 성공");
					if (type == 1)
						request.setAttribute("url", "list.bo?type=1");
					if (type == 2)
						request.setAttribute("url", "list2.bo?type=2");
					if (type == 3)
						request.setAttribute("url", "list3.bo?type=3");
					if (type == 4)
						request.setAttribute("url", "../member/main.me");
				} else {
					request.setAttribute("msg", "게시물 수정 실패");
					request.setAttribute("url", "updateForm.bo?num=" + bo.getNum() + "&type=" + type);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		int type = Integer.parseInt(request.getParameter("type"));
		// System.out.println("num="+num+",type="+type);
		Board board = dao.selectOne(num, type); // num게시물의 board객체
		String url = null;
		String msg = null;
		if (!board.getPass().equals(pass) && !login.equals("admin")) { // 비번 틀린경우
			url = "deleteForm.bo?num=" + num + "&type=" + type;
			msg = "비밀번호가 틀렸습니다.";
		} else { // 비번 맞는경우-삭제 진행
			if (dao.delete(num)) { // 삭제성공
				if (type != 1)
					url = "list.bo" + type + "?num=" + num + "&type=" + type;
				url = "list.bo?num=" + num + "&type=" + type;
				msg = "게시물 삭제 성공";
			} else { // 삭제실패
				url = "info.bo?num=" + num + "&type=" + type;
				msg = "게시물 삭제 실패";
				if (type == 2)
					msg = "동행신청이 진행중인 게시물은 삭제가 불가합니다.";
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward writeForm(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		mem = dao.selectOne(login);
		request.setAttribute("pass", mem.getPass());
		request.setAttribute("id", mem.getId());
		request.setAttribute("login", login);
		return new ActionForward(false, "writeForm.jsp");
	}

	public ActionForward writeForm2(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		mem = dao.selectOne(login);
		request.setAttribute("pass", mem.getPass());
		request.setAttribute("id", mem.getId());
		request.setAttribute("login", login);
		return new ActionForward(false, "writeForm2.jsp");
	}

	public ActionForward writeForm3(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		mem = dao.selectOne(login);
		request.setAttribute("pass", mem.getPass());
		request.setAttribute("id", mem.getId());
		request.setAttribute("login", login);
		return new ActionForward(false, "writeForm3.jsp");
	}

	public ActionForward recmd(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		mem = dao.selectOne(login);
		request.setAttribute("pass", mem.getPass());
		request.setAttribute("id", mem.getId());
		request.setAttribute("login", login);
		// ----------------------------추천-------------
		BoardDao boarddao = new BoardDao();
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = new Board();
		board = boarddao.selectOne(num, 1);
		boarddao.recmd(board);
		request.setAttribute("msg", "추천이 완료되었습니다!");
		request.setAttribute("url", "info.bo?type=1&num=" + num);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward myboard(HttpServletRequest request, HttpServletResponse response) {

		int pageNum = 1;
		int limit = 10;
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
		String id = request.getParameter("id");
		int myboardcount = dao.myboardCount(column, find, id);
		// -------------관리자-----------
		if (id.equals("admin")) {
			myboardcount = 0;
			myboardcount = dao.adminboardCount(column, find);
		}
		// -------------관리자-----------
		// System.out.println(id+" : "+myboardcount);
		List<Board> list = dao.myboard(pageNum, limit, column, find, id);
		int maxpage = (int) ((double) myboardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		int boardnum = (myboardcount - (pageNum - 1) * limit);// 글번호정렬
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("myboardcount", myboardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardnum);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("today", df.format(new Date()));
		// -------------관리자-----------
		if (id.equals("admin")) {
			List<Board> adminlist = dao.list(pageNum, limit, column, find);
			request.setAttribute("list", adminlist);
		}
		// -------------관리자-----------
		login = (String) request.getSession().getAttribute("login");
		request.setAttribute("login", login);
		return new ActionForward(false, "myboard.jsp");
	}

	public ActionForward comment // 게시판댓글
	(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		name = request.getParameter("name");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		try {
			Comment comment = new Comment();
			comment.setNum(Integer.parseInt(request.getParameter("num")));
			// System.out.println(Integer.parseInt(request.getParameter("num")));
			comment.setId(login);
			comment.setComment(request.getParameter("comment"));
			int num = dao.cmaxNum();
			comment.setCnum(++num);
			int boardnum = Integer.parseInt(request.getParameter("num"));
			int type = Integer.parseInt(request.getParameter("type"));
			int my = Integer.parseInt(request.getParameter("my"));

			Board board = new Board();
			BoardDao dao = new BoardDao();
			board = dao.selectOne(boardnum, type); // 부모게시물
			// ----------------------------------------------------
			if (dao.commentinsert(comment)) {
				request.setAttribute("msg", "댓글 등록 성공");
				request.setAttribute("board", board);
			} else {
				request.setAttribute("msg", "댓글 등록 실패");
				request.setAttribute("board", board);
			}
			request.setAttribute("url", "info.bo?type=" + type + "&num=" + boardnum + "&my=" + my);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward commentdel(HttpServletRequest request, HttpServletResponse response) {
		// -----------------------------로그인확인
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "../member/loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		// ----------------------------------------------------
		int cnum = Integer.parseInt(request.getParameter("cnum")); // 댓글의번호
		int num = Integer.parseInt(request.getParameter("num")); // 게시글의번호
		int type = Integer.parseInt(request.getParameter("type")); // 게시글의번호
		int my = Integer.parseInt(request.getParameter("my"));
		System.out.println(my);
		Board board = new Board();
		BoardDao dao = new BoardDao();
		board = dao.selectOne(num, type); // 부모게시물
		Comment comment = new Comment();
		comment = dao.commentselectone(cnum); // 현재 댓글
		String url = null;
		String msg = null;
		if (!comment.getId().equals(login) && !login.equals("admin")) { // 현재댓글의 글쓴이와 로그인한 정보가 다를경우
			url = "info.bo?num=" + num + "&type=" + type + "&my=" + my;
			msg = "자신의 댓글만 삭제 가능합니다.";
		} else { // 비번 맞는경우-삭제 진행
			if (dao.commentdelete(cnum)) { // 삭제성공
				url = "info.bo?num=" + num + "&type=" + type + "&my=" + my;
				msg = "댓글 삭제 성공";
			} else { // 삭제실패
				url = "info.bo?num=" + num + "&type=" + type + "&my=" + my;
				msg = "댓글 삭제 실패";
			}
		}
		request.setAttribute("board", board);
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
	}
}
