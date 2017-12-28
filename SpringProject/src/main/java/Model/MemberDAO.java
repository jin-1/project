package Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import service.AbstractRepository;

@Repository
public class MemberDAO extends AbstractRepository {
	private final String namespace = "mapper.Mapper";

	public MemberDTO Login(MemberDTO memberDto) {
		System.out.println(memberDto.getMemberId()+"dd");
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
	
	//일반회원 아이디 찾기
	
	public MemberDTO memIdFind(MemberDTO listMember){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectIdFind";
		MemberDTO member=null;
		
		try {
			member = sqlSession.selectOne(statement, listMember);
			return member;
		}catch(Exception e) {
			System.out.println("aaaA");
			e.printStackTrace();
			return null;
		}
		
	}
	
	//일반회원 비밀번호 찾기
	
	public MemberDTO memPwFind(MemberDTO listMember){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectPwFind";
		MemberDTO member=null;
		
		try {
			member = sqlSession.selectOne(statement, listMember);
			return member;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//기업회원 아이디 찾기
	public CorporDTO corIdFind(CorporDTO cor){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCorporIdFind";
		CorporDTO copor;
	
		try {
			copor = sqlSession.selectOne(statement, cor);
			
			return copor;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
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
	public List<AccountDTO> selectAccount(HttpSession session){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectAccount";
		MemberDTO member= (MemberDTO) session.getAttribute("login");
		List<AccountDTO> d = new ArrayList<AccountDTO>();
		String memberId = member.getMemberId();
		try {
			d = sqlSession.selectList(statement, memberId);
			return d;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void insertAccount(HttpSession session,AccountDTO actdto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertAccount";
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		actdto.setMemberId(memberDTO.getMemberId());	
		actdto.setGrossProfit(actdto.getExpense());
		int result = 0;
		try {
			result = sqlSession.insert(statement, actdto);
			if(result>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	public AccountDTO selectAccountOne(String budgeCode){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectAccountOne";
		
		try {
			AccountDTO d = sqlSession.selectOne(statement, budgeCode);
			return d;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public void insertAccountDetail(AccountDetailDTO actdto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertAccountDetail";
		
		int result = 0;
		try {
			result = sqlSession.insert(statement, actdto);
			if(result>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
}
