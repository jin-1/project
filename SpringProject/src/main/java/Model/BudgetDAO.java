package Model;

import org.apache.ibatis.session.SqlSession;

import service.AbstractRepository;


public class BudgetDAO extends AbstractRepository {
	
	private final String namespace = "mapper.Mapper";

	public BudgetDTO budgetgrap(BudgetDTO dto){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".budgetgrap";
		return sqlSession.selectOne(statement, dto);
	}

}
