package service;


import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;


import Model.TrainDAO;
import Model.TrainStatinDTO;

public class TrainService {
	
	@Autowired
	TrainDAO traindao;
	HashMap<String, String> stationName;
	public HashMap<String,String> getSearchTrain(String stationName){
			
		int i = 0;
		List<TrainStatinDTO> station = traindao.searchStation(stationName);
		this.stationName = new HashMap<String,String>();
		for(TrainStatinDTO st: station ) {
			this.stationName.put("train"+(++i), (String)st.getStationName());
		}
		
		return this.stationName;
	}
	
}
