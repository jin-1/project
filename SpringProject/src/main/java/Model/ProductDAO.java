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
	
	public void insertProduct(ProductDTO pDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".insertProduct";
		int result = sqlSession.insert(statement, pDTO);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
	}
	
	public void placeOrder(RentRegDTO rrDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".placeOrder";
		/*System.out.println("dao다");*/
		int result = sqlSession.insert(statement, rrDTO);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
	}
	
	public List<RentRegDTO> getOrder(String memberId){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".getOrder";
		return sqlSession.selectList(statement, memberId);
	}
	
	public List<EventDTO> couponOpen(String memberId) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".couponOpen";
		return sqlSession.selectList(statement, memberId);
	}
}
