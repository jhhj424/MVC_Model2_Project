<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String login = (String) request.getSession().getAttribute("login");
Member mem = new Member();
MemberDao dao = new MemberDao();
mem = dao.selectOne(login);
request.setAttribute("pass", mem.getPass());
request.setAttribute("id", mem.getId());
request.setAttribute("login", login);
// ----------------------------ÃßÃµ-------------
BoardDao boarddao = new BoardDao();
int num = Integer.parseInt(request.getParameter("num"));
Board board = new Board();
board = boarddao.selectOne(num, 1);
boarddao.recmd(board);
int rec = board.getRecmd()+1;
%><%=rec %>