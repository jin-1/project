package Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	public List<TrainDTO> selectTrainAll(){
		
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectTrainAll";
		List<TrainDTO> train = new ArrayList<TrainDTO>();
		try {
			
			train = sqlSession.selectList(statement);

			return train;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	public List<TrainStationTimeDTO> selectTrainTimeAll(String t){
		
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectTrainTimeAll";
		String trainCode = t;
		List<TrainStationTimeDTO> time = new ArrayList<TrainStationTimeDTO>();
		try {
			
			time = sqlSession.selectList(statement,trainCode);

			return time;
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

	public List<TrainRegistrationDTO> trainInfo(Map<String, Object> info) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectTrainInfo";
		List<TrainRegistrationDTO> station;
		try {

			station = sqlSession.selectList(statement, info);
			return station;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public void insertTicketing(TrainRegistrationDTO trainRegistrationDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".trainRegCode";
		int result = 0;
		try {

			result = sqlSession.insert(statement, trainRegistrationDTO);

			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	

	public void insertPurchase(TrainPurchaseDTO tpdto) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertPurchase";
		int result = 0;
		try {

			result = sqlSession.insert(statement, tpdto);

			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public List<TrainRegistrationDTO> selectTrainPuchase(HttpSession session) {
		MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
		Map<String,String> id = new HashMap<String,String>();
		id.put("memberId", memberdto.getMemberId());
		
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectTicketPurchase";
		List<TrainRegistrationDTO> purchase;
		try {

			purchase = sqlSession.selectList(statement, id);
			return purchase;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<TrainRegistrationDTO> getTrainTicket(HashMap<String, Object> temp) {
	
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectTicketD";
		List<TrainRegistrationDTO> ticket;
		try {

			ticket = sqlSession.selectList(statement, temp);
			return ticket;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<TrainRegistrationDTO> getUseTicket(HashMap<String, Object> temp) {
		
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".selectUseHistory";
		List<TrainRegistrationDTO> ticket;
		try {

			ticket = sqlSession.selectList(statement, temp);
			return ticket;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	public void updetePurchase(String code) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".updetePurchase";
		try {
			
			int result = sqlSession.update(statement, code);
			if(result>0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public void updateSeat(String[] seat) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".updateSeat";
		
		Map<String,String> seatMap = new HashMap<String,String>();
		try {
			seatMap.put("seat", seat[0]);
			seatMap.put("code", seat[1]);
			int result = sqlSession.update(statement, seatMap);
			if(result>0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	public void insertTrain(TrainDTO trainDTO) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertTrain";
		try {
			
			int result = sqlSession.insert(statement, trainDTO);
			if(result>0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public void insertTime(TrainStationTimeDTO trainStationTimeDTO, String d) {
		SqlSession sqlSession = this.getSqlSessionFactory().openSession();
		String statement = namespace + ".insertTime";
		Map<String,String> map =  new HashMap<String,String>();
		map.put("trainCode", String.valueOf(trainStationTimeDTO.getTrainCode()));
		map.put("time", trainStationTimeDTO.getTime());
		map.put("start", d);
		System.out.println(map);
		try {
			
			int result = sqlSession.insert(statement, map);
			if(result>0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
