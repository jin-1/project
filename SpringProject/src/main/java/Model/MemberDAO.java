package Model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import service.AbstractRepository;

@Repository
public class MemberDAO extends AbstractRepository {
	private final String namespace = "mapper.Mapper";

	public MemberDTO Login(MemberDTO memberDto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectMemberLogin";

		try {
			MemberDTO memberDTO = sqlSession.selectOne(statement, memberDto);

			return memberDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public CorporDTO CorLogin(CorporDTO corporDto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCorPorLogin";
		
		try {
			CorporDTO corporDTO = sqlSession.selectOne(statement, corporDto);
			
			return corporDTO;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	//일반회원 아이디 중복확인
	public int IdCheck(String memberId) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectMemberIdCheck";

		try {
			int result = sqlSession.selectOne(statement, memberId);
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	
	}
	
	//기업회원 아이디 중복확인
	public int CorIdCheck(String corporId) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCorporIdCheck";
		try {
			int result = sqlSession.selectOne(statement, corporId);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	//일반회원 회원가입
	public int Register(MemberDTO memberDto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertMember";
		int result = 0;
		try {
			result = sqlSession.insert(statement, memberDto);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}
	
	//기업회원 회원가입
	public int CorRegister(CorporDTO corpordto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertCorPor";
		int result = 0;
		try {
			result = sqlSession.insert(statement, corpordto);
			if(result>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return result;	
	}
}
