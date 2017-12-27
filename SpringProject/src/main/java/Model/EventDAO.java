package Model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import service.AbstractRepository;

@Repository
public class EventDAO extends AbstractRepository {
	
	private final String namespace = "mapper.EventMapper";

	public BudgetDTO event(BudgetDAO dto){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".event";
		return sqlSession.selectOne(statement, dto);
	}
	
	public List<EventDTO> Coupon(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCoupon";
		MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
		String memberId = memberdto.getMemberId();
		try {
			List<EventDTO> eventDTO = sqlSession.selectList(statement,memberId);

			return eventDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
