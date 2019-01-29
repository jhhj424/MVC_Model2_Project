package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.AccompanyMapper;

public class AccompanyDao {
	private static final String ns = "mapper.AccompanyMapper.";

	public boolean insert(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(AccompanyMapper.class).insert(board);
			if (result > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public boolean chkupdate(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(AccompanyMapper.class).chkupdate(board);
			if (result > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public boolean chkupdate2(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(AccompanyMapper.class).chkupdate2(board);
			if (result > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean delete(Board board) {
		SqlSession session = DBConnection.getSession();
		try {
			int result = session.getMapper(AccompanyMapper.class).delete(board);
			if (result > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Integer> selectnum(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(AccompanyMapper.class).selectnum(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public List<String> selectid(int num) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(AccompanyMapper.class).selectid(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int selectchk(String id, int num) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("num", num);
			map.put("id", id);
			return session.selectOne(ns + "selectchk", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Accompany> accompanylist(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(AccompanyMapper.class).accompanylist(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public List<Accompany> accompanylist2(int num) {
		SqlSession session = DBConnection.getSession();
		try {
			return session.getMapper(AccompanyMapper.class).accompanylist2(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int accompanyCount(String column, String find, String id) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("column", column);
			map.put("find", find);
			map.put("id", id);
			return session.selectOne(ns + "accompanyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int maxpno(int num) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("num", num);
			return session.selectOne(ns + "maxpno", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int mycnt(String id) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("id", id);
			return session.selectOne(ns + "mycnt", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int accompanyCount2(String column, String find, String name) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			if (column == name) {
				map.put("column", name);
			} else {
				map.put("column", column);
			}
			map.put("find", find);
			map.put("name", name);
			return session.selectOne(ns + "accompanyCount2", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int myaccompanyCount(String column, String find, String id) {
		SqlSession session = DBConnection.getSession();
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("column", column);
			map.put("find", find);
			map.put("id", id);
			return session.selectOne(ns + "myaccompanyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
}
