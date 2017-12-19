package Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import service.AbstractRepository;

public class ProductDAO extends AbstractRepository {
	private String namespace = "mapper.ProductMapper";
	
	public List<ProductDTO> searchList(ProductDTO pDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".searchList";
		return sqlSession.selectList(statement, pDTO);
	}

	public List<ProductDTO> productIndex(ProductDTO pDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".productIndex";
		return sqlSession.selectList(statement, pDTO);
	}
}
