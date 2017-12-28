package Model;

import java.util.ArrayList;
import java.util.HashMap;
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
		System.out.println(memberDto.getMemberId() + "dd");
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

	// 일반회원 아이디 찾기

	public MemberDTO memIdFind(MemberDTO listMember) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectIdFind";
		MemberDTO member = null;

		try {
			member = sqlSession.selectOne(statement, listMember);
			return member;
		} catch (Exception e) {
			System.out.println("aaaA");
			e.printStackTrace();
			return null;
		}

	}

	// 일반회원 비밀번호 찾기

	public MemberDTO memPwFind(MemberDTO listMember) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectPwFind";
		MemberDTO member = null;

		try {
			member = sqlSession.selectOne(statement, listMember);
			return member;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 기업회원 아이디 찾기
	public CorporDTO corIdFind(CorporDTO cor) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCorporIdFind";
		CorporDTO copor;

		try {
			copor = sqlSession.selectOne(statement, cor);

			return copor;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	public int CorRegister(CorporDTO corpordto) {
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

	// 일반회원 내정보 수정
	public int myPageRe(MemberDTO memberDto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".updateMypageRe";
		int result = 0;
		try {
			result = sqlSession.update(statement, memberDto);
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
	
	// 일반회원 회원탈퇴
	public int memberDel(MemberDTO memberDto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".deleteMember";
		int result = 0;
		try {
			result = sqlSession.delete(statement, memberDto);
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

	// 1:1문의 등록
	public int inquiryAdd(InquiryDTO dto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertInquiry";
		int result = 0;
		try {
			result = sqlSession.insert(statement, dto);
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

	// 공지사항 등록
	public int noticeAdd(NoticeDTO dto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertNotice";
		int result = 0;
		try {
			result = sqlSession.insert(statement, dto);
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

	public List<InquiryDTO> inquirySel(String memberId) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectInquiry";

		try {
			List<InquiryDTO> list = sqlSession.selectList(statement, memberId);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 1:1문의 상세페이지 보기
	public InquiryDTO inquiryCon(int num) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectInquiryCon";

		try {
			InquiryDTO inquiry = sqlSession.selectOne(statement, num);
			return inquiry;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 공지사항 상세페이지 보기
	public NoticeDTO noticeCon(int num) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectNoticeCon";

		try {
			NoticeDTO notice = sqlSession.selectOne(statement, num);
			return notice;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 공지사항 조회수
	public void noticeCount(int num) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".updateNoticeCount";
		try {
			int notice = sqlSession.update(statement, num);
			if (notice > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// 1:1문의 페이징
	public List<InquiryDTO> writeGetCount(int offset, int noOfRecords, HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectpaging";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		Map<String, String> param = new HashMap<String, String>();
		param.put("param1", String.valueOf(offset));
		param.put("param2", String.valueOf(noOfRecords));
		param.put("id", memberDTO.getMemberId());

		try {
			List<InquiryDTO> list = sqlSession.selectList(statement, param);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	//기업회원 비밀번호 찾기
		public CorporDTO corPwFind(CorporDTO cor){
			SqlSession sqlSession = this.getSqlSessionFactory().openSession();
			String statement = namespace + ".selectCorporPwFind";
			CorporDTO corpor=null;
			
			try {
				corpor = sqlSession.selectOne(statement, cor);
				return corpor;
			}catch(Exception e) {
				e.printStackTrace();
				return null;
			}
			
		}

	public int getNumberOfRecords(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".getNumberOfRecords";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String id = memberDTO.getMemberId();
		try {
			int num = sqlSession.selectOne(statement, id);
			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 공지사항 페이징
	public List<NoticeDTO> writeGetCount2(int offset, int noOfRecords, HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectpaging2";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		Map<String, String> param = new HashMap<String, String>();
		param.put("param1", String.valueOf(offset));
		param.put("param2", String.valueOf(noOfRecords));
		param.put("id", memberDTO.getMemberId());

		try {
			List<NoticeDTO> list = sqlSession.selectList(statement, param);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getNumberOfRecords2(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".getNumberOfRecords2";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String id = memberDTO.getMemberId();
		try {
			int num = sqlSession.selectOne(statement, id);
			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public List<InquiryDTO> writeGetCount3(int offset, int noOfRecords, HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectpaging3";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		Map<String, String> param = new HashMap<String, String>();
		param.put("param1", String.valueOf(offset));
		param.put("param2", String.valueOf(noOfRecords));
		param.put("id", memberDTO.getMemberId());

		try {
			List<InquiryDTO> list = sqlSession.selectList(statement, param);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public int getNumberOfRecords3(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".getNumberOfRecords3";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String id = memberDTO.getMemberId();
		try {
			int num = sqlSession.selectOne(statement, id);
			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 1:1문의 답변등록
	public int ripplyadd(InquiryDTO dto) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".updateRiply";
		int result = 0;
		try {
			result = sqlSession.update(statement, dto);
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

	// 기업 1:1문의
	public List<InquiryDTO> writeGetCount4(int offset, int noOfRecords, HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectpaging3";
		CorporDTO CorporDTO = (CorporDTO) session.getAttribute("corlogin");

		System.out.println(CorporDTO.getCorporId() + "기업아이디");
		Map<String, String> param = new HashMap<String, String>();
		param.put("param1", String.valueOf(offset));
		param.put("param2", String.valueOf(noOfRecords));
		param.put("id", CorporDTO.getCorporId());

		try {
			List<InquiryDTO> list = sqlSession.selectList(statement, param);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public int getNumberOfRecords4(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".getNumberOfRecords3";
		CorporDTO corporDTO = (CorporDTO) session.getAttribute("corlogin");
		String id = corporDTO.getCorporId();
		try {
			int num = sqlSession.selectOne(statement, id);
			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public List<AccountDTO> selectAccount(HttpSession session) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectAccount";
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		List<AccountDTO> d = new ArrayList<AccountDTO>();
		String memberId = member.getMemberId();
		try {
			d = sqlSession.selectList(statement, memberId);
			return d;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public void insertAccount(HttpSession session, AccountDTO actdto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertAccount";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		actdto.setMemberId(memberDTO.getMemberId());
		actdto.setGrossProfit(actdto.getExpense());
		int result = 0;
		try {
			result = sqlSession.insert(statement, actdto);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<AccountDTO> selectAccounts(String budgeCode) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectAccounts";

		try {
			List<AccountDTO> d = sqlSession.selectList(statement, budgeCode);
			return d;
		} catch (Exception e) {
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
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updatePoint(Map<String, Object> pointMap) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".updatePoint";

		int result = 0;
		try {
			result = sqlSession.update(statement, pointMap);
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
