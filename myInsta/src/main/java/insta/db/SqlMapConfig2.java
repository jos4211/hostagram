package insta.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig2 {
	/*private static SqlSessionFactory sqlsession;

	static {
		try {
			String resource = "insta/db/config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlsession = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			System.out.println("config.xml 읽기 실패!");
		}

	}

	public static SqlSessionFactory getSqlMapInstance() {
		return sqlsession;
	}*/

}
