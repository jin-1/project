package Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import service.AbstractRepository;

@Repository
public class CoperDAO extends AbstractRepository {
	private final String namespace = "mapper.CoperMapper";
	//관리지 리스트
		public List<CoperDTO> CoperAll() {
			SqlSession sqlSession = this.getSqlSessionFactory().openSession();
			String statement = namespace + ".selectCoperAll";

			try {
				List<CoperDTO> coperDTO = sqlSession.selectList(statement);

				return coperDTO;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}

		}
		//회원삭제
		public int deleteCoper(String userId) {
			SqlSession sqlSession = this.getSqlSessionFactory().openSession();
			String statement = namespace + ".deleteCoper";
			int result = 0;
			try {
				result = sqlSession.delete(statement, userId);
				if (result > 0) {
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}

			} catch (Exception e) {
				sqlSession.rollback();
				e.printStackTrace();

			}
			return result;
		}
}
