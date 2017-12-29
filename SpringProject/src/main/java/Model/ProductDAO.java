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
	
	public List<ProductDTO> adminProductMain(ProductDTO pDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".adminProductMain";
		return sqlSession.selectList(statement, pDTO);
	}
	
	public List<ProductDTO> viewPrd(ProductDTO pDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".viewPrd";
		return sqlSession.selectList(statement, pDTO);
	}
	
	public int updatePrd(ProductDTO pDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".adjustPrd";
		
		int result = 0;
		result = sqlSession.update(statement, pDTO);
		System.out.println("tourDAO session Result = " + result);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		return sqlSession.selectOne(statement, pDTO);
	}
	public int insertProduct(ProductDTO pDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".insertProduct";
		int result =0;
		result = sqlSession.insert(statement, pDTO);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		return result;
	}
	
	public List<PurchaseDTO> getOrderList(String memberId) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".getOrderList";
		return sqlSession.selectList(statement, memberId);
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
	
	
	public void placePayment(PurchaseDTO purchaseDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".placePayment";
		System.out.println("dao다");
		int result = sqlSession.insert(statement, purchaseDTO);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
	}
	
	
	public void addPoint(MemberDTO memberDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".addPoint";
		System.out.println("dao다");
		int result = sqlSession.update(statement, memberDTO);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
	}
	
	public List<RentRegDTO> getOrder(RentRegDTO rrDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".getOrder";
		return sqlSession.selectList(statement, rrDTO);
	}
	
	public List<EventDTO> couponOpen(String memberId) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".couponOpen";
		return sqlSession.selectList(statement, memberId);
	}
	
	public List<EventDTO> couponDelete(EventDTO eventDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".couponDelete";
		return sqlSession.selectList(statement, eventDTO);
	}
	
	
	
	
	public List<PurchaseDTO> RefundOrderList(PurchaseDTO purchaseDTO) {
	      SqlSession sqlSession = this.getSqlSessionFactory().openSession();
	      String statement = namespace+".RefundOrderList";
	      return sqlSession.selectList(statement, purchaseDTO);
	   }

	public List<PurchaseDTO> adminViewResult(PurchaseDTO purchaseDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".adminViewOrder";
		return sqlSession.selectList(statement, purchaseDTO);
	}
	
	public List<PurchaseDTO> adminUpdateOrder(PurchaseDTO purchaseDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".adminUpdateOrder";
		return sqlSession.selectList(statement, purchaseDTO);
	}
	public List<RentRegDTO> adminViewOrder(RentRegDTO rrDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".getOrder";
		return sqlSession.selectList(statement, rrDTO);
	}
	
	public List<ProductDTO> adminPrdModfy(ProductDTO pDTO){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace+".viewPrd";
		return sqlSession.selectList(statement, pDTO);
	}
}
