package Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	public Integer insertComment(CommentDTO dto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".tourCommentInsert";
		return sqlSession.insert(statement, dto);
	}
}
