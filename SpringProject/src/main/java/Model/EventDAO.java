package Model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import service.AbstractRepository;

@Repository
public class EventDAO extends AbstractRepository {
	
	private final String namespace = "mapper.EventMapper";
	@Autowired
	MemberDTO memberdto;
	
	//이벤트 쿠폰 리슽
	public List<EventDTO> Coupon(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCoupon";
		memberdto = (MemberDTO) session.getAttribute("login");
		String memberId = memberdto.getMemberId();
		try {
			List<EventDTO> eventDTO = sqlSession.selectList(statement,memberId);

			return eventDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		

	}
	// 쿠폰지급
		public void CouponIn(HttpSession Session) {
			MemberDTO memberdto = (MemberDTO) Session.getAttribute("login");
			SqlSession sqlSession = this.getSqlSessionFactory().openSession();
			String statement = namespace + ".insertCoupon";
			String memberId = memberdto.getMemberId();
			int result = 0;
			try {
				result = sqlSession.insert(statement, memberId);
				if (result > 0) {
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}

			} catch (Exception e) {
				e.printStackTrace();

			}
		
	}

}