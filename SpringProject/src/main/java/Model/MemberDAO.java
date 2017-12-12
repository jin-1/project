package Model;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import service.AbstractRepository;

@Repository
public class MemberDAO extends AbstractRepository  {
	private final String namespace = "mapper.Mapper";
	
	
	public MemberDTO Login(MemberDTO memberDto)  {
		
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectMemberLogin";
		
		try {
		MemberDTO memberDTO = sqlSession.selectOne(statement, memberDto);
		
		return memberDTO;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
}
