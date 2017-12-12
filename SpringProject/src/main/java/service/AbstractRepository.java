package service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.io.Resources;

public abstract class AbstractRepository {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		setSqlSessionFactory();
	}
	private static void setSqlSessionFactory() {
		String resource = "spring-mybatis.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory =
				new SqlSessionFactoryBuilder().build(inputStream);
	}
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
}
