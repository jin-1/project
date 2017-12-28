package Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public CoperDTO CorLogin(CoperDTO corporDto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCorPorLogin";

		try {
			CoperDTO corporDTO = sqlSession.selectOne(statement, corporDto);

			return corporDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 일반회원 아이디 중복확인
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

	// 기업회원 아이디 중복확인
	public int CorIdCheck(String corporId) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCorporIdCheck";
		try {
			int result = sqlSession.selectOne(statement, corporId);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 일반회원 회원가입
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

	// 기업회원 회원가입
	public int CorRegister(CoperDTO corpordto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertCorPor";
		int result = 0;
		try {
			result = sqlSession.insert(statement, corpordto);
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
	//관리지 리스트
	public List<MemberDTO> MemberAll() {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectMemberAll";

		try {
			List<MemberDTO> memberDTO = sqlSession.selectList(statement);

			return memberDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	//회원삭제
	public int deleteMember(String userId) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".deleteMember";
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
	public List<CoperDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
	    return SqlSession.selectList("board.listAll", map);
	}



	
}
