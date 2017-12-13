package service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import Model.CustomerTicketDTO;
import Model.TrainDAO;
import Model.TrainDTO;
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
	
	
	public List<TrainDTO> getCustomerTicket(CustomerTicketDTO customerTicketDTO){
		
		Map<String, Object> listTrain = new HashMap<String, Object>();
		
		List<String> trainType = new ArrayList<String>();
		for(String s : customerTicketDTO.getTrainType()) {
			trainType.add(s);
		}
		listTrain.put("dateTrain", customerTicketDTO.getDateTrain());
		List<String> Station = new ArrayList<String>();
		Station.add(customerTicketDTO.getStartTrain());
		Station.add(customerTicketDTO.getEndTrain());
		listTrain.put("station", Station);
		listTrain.put("trainType", trainType);
		return traindao.customerTicket(listTrain);
	}
}
