package service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import Model.CustomerTicketDTO;
import Model.TrainDAO;
import Model.TrainDTO;
import Model.TrainRegistrationDTO;
import Model.TrainStatinDTO;

public class TrainService {

	@Autowired
	TrainDAO traindao;
	HashMap<String, String> stationName;

	public HashMap<String, String> getSearchTrain(String stationName) {

		int i = 0;
		List<TrainStatinDTO> station = traindao.searchStation(stationName);
		this.stationName = new HashMap<String, String>();
		for (TrainStatinDTO st : station) {
			this.stationName.put("train" + (++i), (String) st.getStationName());
		}

		return this.stationName;
	}

	public List<TrainDTO> getCustomerTicket(CustomerTicketDTO customerTicketDTO) {

		Map<String, Object> listTrain = new HashMap<String, Object>();

		List<String> trainType = new ArrayList<String>();
		for (String s : customerTicketDTO.getTrainType()) {
			trainType.add(s);
		}
		listTrain.put("dateTrain", customerTicketDTO.getDateTrain());
		List<String> Station = new ArrayList<String>();
		Station.add(customerTicketDTO.getStartTrain());
		Station.add(customerTicketDTO.getEndTrain());
		listTrain.put("station", Station);
		listTrain.put("trainType", trainType);

		List<TrainDTO> list = traindao.customerTicket(listTrain);

		for (int i = 0; i < list.size(); i++) {
			String time[] = list.get(i).getTime().split(",");
			Calendar time1 = Calendar.getInstance();
			Calendar time2 = Calendar.getInstance();

			String[] n = time[0].split(":");
			String[] n1 = time[1].split(":");
			time1.set(Calendar.HOUR_OF_DAY, Integer.parseInt(n[0]));
			time1.set(Calendar.MINUTE, Integer.parseInt(n[1]));

			time2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(n1[0]));
			time2.set(Calendar.MINUTE, Integer.parseInt(n1[1]));

			long difference = Math.abs(time2.getTimeInMillis() - time1.getTimeInMillis()) / 1000;
			if (list.get(i).getTrainName().equals("KTX")) {
				if (difference <= 900) {
					list.get(i).setTrainPrice(8400);
				} else if (difference > 900 && difference <= 1800) {
					list.get(i).setTrainPrice(9600);
				} else if (difference > 1800 && difference <= 2400) {
					list.get(i).setTrainPrice(12900);
				} else if (difference > 2400 && difference <= 3600) {
					list.get(i).setTrainPrice(23700);
				} else if (difference > 3600 && difference <= 4200) {
					list.get(i).setTrainPrice(35100);

				} else if (difference > 4200 && difference <= 6000) {
					list.get(i).setTrainPrice(43500);
				} else if (difference > 6000 && difference <= 7200) {
					list.get(i).setTrainPrice(49300);
				} else if (difference > 7200 && difference <= 7800) {
					list.get(i).setTrainPrice(53500);
				} else {
					list.get(i).setTrainPrice(59800);
				}

			}
		}

		return list;
	}
	
	public List<TrainRegistrationDTO> getTrainInfo(Map<String,Object> info) {
		List<TrainRegistrationDTO> trainDto = traindao.trainInfo(info);
		
		return trainDto;
	}
}
