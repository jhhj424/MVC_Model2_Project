package model;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class DBConnection {
	private static SqlSessionFactory sqlMap;
	static {
		String resource = "mapper/mybatis-config.xml";
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		}catch (IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(reader);
	}
	private DBConnection() {}//������. ���������� private : ��ü�����Ұ�
	static SqlSession getSession() {
		return sqlMap.openSession();
	}
	static void close(SqlSession session) {
		session.commit();
		session.close();
	}
}
