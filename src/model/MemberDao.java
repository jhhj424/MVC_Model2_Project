package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;

public class MemberDao {
	private static final String ns = "mapper.MemberMapper.";

	public int insert(Member mem) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(MemberMapper.class).insert(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public Member selectOne(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			return session.selectOne(ns + "select", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public List<Member> list() {
		SqlSession session = DBConnection.getSession();
		try {
			return session.selectList(ns + "select");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int update(Member mem) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(MemberMapper.class).update(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int delete(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(MemberMapper.class).delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public boolean deleteA(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(MemberMapper.class).delete4(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean deleteB(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(MemberMapper.class).delete3(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean deleteC(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(MemberMapper.class).delete2(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

//	public int repass(Member mem) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "update member set pass=? where id=?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mem.getPass());
//			pstmt.setString(2, mem.getId());
//			return pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, null);
//		}
//		return 0;
//	}
	public int updatepass(String id, String pass) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pass", pass);
			return session.getMapper(MemberMapper.class).updatepass(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
}
