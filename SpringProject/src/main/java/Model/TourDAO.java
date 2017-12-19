package Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import service.AbstractRepository;

@Repository
public class TourDAO extends AbstractRepository{
	private String namespace = "mapper.TourMapper";
	
	public List<TourDTO> tourSearch(TourDTO dto){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".tourSearch";
		return sqlSession.selectList(statement, dto);
	}
	
	public TourDTO tourInfo(TourDTO dto){
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".tourInfo";
		return sqlSession.selectOne(statement, dto);
	}
	
	public List<CommentDTO> tourComment(CommentDTO dto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".tourComment";
		return sqlSession.selectList(statement, dto);
	}
	
	public void insertComment(CommentDTO dto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".tourCommentInsert";
		
		int result = sqlSession.insert(statement, dto);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
	}
	
	public List<CommentDTO> selectComment(String localCode) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".tourCommentSelect";
		return sqlSession.selectList(statement, localCode);
	}
}
