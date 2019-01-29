package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;

public class BoardDao {
	private static final String ns = "mapper.BoardMapper.";
	public int maxNum() { // board ���̺��� ����� num �÷��� �ִ밪 return
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(BoardMapper.class).maxNum();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int cmaxNum() { // board ���̺��� ����� num �÷��� �ִ밪 return
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(BoardMapper.class).cmaxNum();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public boolean insert(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(BoardMapper.class).insert(board);
			if(result > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public int myboardCount(String column, String find,String id) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object,Object> map = new HashMap<Object,Object>();
			map.put("column", column);
			map.put("find", find);
			map.put("id", id);
			return session.selectOne(ns + "myboardCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}public int boardCount(String column, String find,int type) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object,Object> map = new HashMap<Object,Object>();
			map.put("column", column);
			map.put("find", find);
			map.put("type", type);
			return session.selectOne(ns + "boardCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}public int boardCountmain(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object,Object> map = new HashMap<Object,Object>();
			map.put("id", id);
			return session.selectOne(ns + "boardCountmain", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}public int adminboardCount(String column, String find) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object,Object> map = new HashMap<Object,Object>();
			map.put("column", column);
			map.put("find", find);
			return session.selectOne(ns + "adminboardCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}public int commentCount(int num) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object,Object> map = new HashMap<Object,Object>();
			map.put("num", num);
			return session.selectOne(ns + "commentCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public List<Board> list(int pageNum, int limit, String column, String find, int type) {
		SqlSession session = DBConnection.getSession();
		try {
			int startrow = (pageNum -1) * limit;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startrow", startrow);
			map.put("limit", limit);
			map.put("column", column);
			map.put("find", find);
			map.put("type", type);
			return session.selectList(ns+"select", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}public List<Board> list(int pageNum, int limit, String column, String find) {
		SqlSession session = DBConnection.getSession();
		try {
			int startrow = (pageNum -1) * limit;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startrow", startrow);
			map.put("limit", limit);
			map.put("column", column);
			map.put("find", find);
			return session.selectList(ns+"adminselect", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public List<Board> list(int pageNum, int limit, String column, String find, String id) {
		SqlSession session = DBConnection.getSession();
		try {
			int startrow = (pageNum -1) * limit;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startrow", startrow);
			map.put("limit", limit);
			map.put("column", column);
			map.put("find", find);
			map.put("id", id);
			return session.selectList(ns+"selectmain", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public List<Board> list(int pageNum, int limit, String column, String find, int type,String id) {
		SqlSession session = DBConnection.getSession();
		try {
			int startrow = (pageNum -1) * limit;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startrow", startrow);
			map.put("limit", limit);
			map.put("column", column);
			map.put("find", find);
			map.put("type", type);
			map.put("id", id);
			return session.selectList(ns+"select", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public List<Board> myboard(int pageNum, int limit, String column, String find,String id) {
		SqlSession session = DBConnection.getSession();
		try {
			int startrow = (pageNum -1) * limit;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startrow", startrow);
			map.put("limit", limit);
			map.put("column", column);
			map.put("find", find);
			map.put("id", id);
			return session.selectList(ns+"myboard", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public Board selectOne(int num,int type) {
		SqlSession session = DBConnection.getSession();
		try {
			//System.out.println("2)"+num+"==="+type);
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("num", num);
			map.put("type", type);
			return session.selectOne(ns + "select",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	public List<Comment> commentselectlist(int num,int pageNum, int limit) {
		SqlSession session = DBConnection.getSession();
		try {
			int startrow = (pageNum -1) * limit;
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("num", num);
			map.put("startrow", startrow);
			map.put("limit", limit);
			return session.selectList(ns+"commentselectlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	public Comment commentselectone(int cnum) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("cnum", cnum);
			return session.getMapper(BoardMapper.class).commentselectone(cnum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	public int readcntadd(int num) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(BoardMapper.class).readcntadd(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	/*
	 * bo : ������ ���� : num,ref,reflevel,refstep
	 * 		����� ���� : name, pass, subject, content
	 */
	/*public boolean reply(Board bo) {
		SqlSession session = DBConnection.getSession();
		int num = this.maxNum(); //�ִ� num �� ����.
//		int ref = bo.getRef(); //������ ref �� <�׷�>
//		int reflevel = bo.getReflevel(); // ������ ���� reflevel ��
//		int refstep = bo.getRefstep();// ������ refstep ��
		try {

 * 	����� ��ȸ ���� : ref desc, refstep asc
 *		num ref reflevel refstep
 *		 3	 3		0		0	=> ����
 *		 2	 2		0		0	=> ����
 *		 6	 2		1		1	=> ���
 *		 5	 2		1		2	=> ���
 *		 7	 2		2		3	=> ��� ���
 *		 4	 2		1		4	=> ���
 *		 1	 1		0		0	=> ����
 
			//������ ����� �ִ� ��� refstep�� 1�� ���� ���� ��ġ�� �缳��
			String sql = "update board set refstep = refstep+1 where ref=? and refstep > ? ";
			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("ref", ref);
//			map.put("refstep", refstep);
			session.getMapper(BoardMapper.class).refstepadd(map);
//			bo.setRef(ref);
//			bo.setReflevel(++reflevel);
//			bo.setRefstep(++refstep);
			bo.setNum(++num);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return this.insert(bo);
	}*/
	public boolean update(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(BoardMapper.class).update(board);
			//System.out.println("2="+board.toString());
			if(result > 0)return true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean delete(int num) {
		SqlSession session = DBConnection.getSession();
		try {session.getMapper(BoardMapper.class).deletecom(num);
				session.getMapper(BoardMapper.class).deleteacom(num);
			if(session.getMapper(BoardMapper.class).delete(num) > 0)return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean commentdelete(int cnum) {
		SqlSession session = DBConnection.getSession();
		try {
			if(session.getMapper(BoardMapper.class).commentdelete(cnum) > 0)return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean recmd(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(BoardMapper.class).recmd(board);
			if(result > 0)return true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	//---------------------------------------------��۱���--------------------------------
	public boolean commentinsert(Comment comment) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(BoardMapper.class).commentinsert(comment);
			if(result > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
}
