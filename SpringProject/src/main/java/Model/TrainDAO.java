package Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import service.AbstractRepository;

public class TrainDAO extends AbstractRepository {
	private final String namespace = "mapper.TrainMapper";
	@Autowired
	TrainStatinDTO trainsdto;

	public List<TrainStatinDTO> searchStation(String stationName) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectSearchStation";
		List<TrainStatinDTO> station = new ArrayList<TrainStatinDTO>();
		try {
			trainsdto.setStationName(stationName);
			station = sqlSession.selectList(statement, trainsdto);

			return station;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<TrainDTO> customerTicket(Map<String, Object> listTrain) {

		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCustomerTrain";
		List<TrainDTO> station;
		try {

			station = sqlSession.selectList(statement, listTrain);
			return station;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<TrainRegistrationDTO> trainInfo(String trainCode) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectCustomerTrain";
		List<TrainRegistrationDTO> station;
		try {

			station = sqlSession.selectList(statement, trainCode);
			return station;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
