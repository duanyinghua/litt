package litt.main.pojo;

import java.util.Date;
import java.util.Map;

public class LittCondition {
	
	private boolean isMapNull = false;
	private boolean isDateNull = false;
	
	private Map<String,Object> map;
	private Date startDate; 
	private Date endDate;
	private String dateProp;
	
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
		this.isMapNull = true;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getDateProp() {
		return dateProp;
	}
	public void setDateProp(String dateProp) {
		this.dateProp = dateProp;
		this.isDateNull = true;
	}
	public boolean isMapNull() {
		return isMapNull;
	}
	public void setMapNull(boolean isMapNull) {
		this.isMapNull = isMapNull;
	}
	public boolean isDateNull() {
		return isDateNull;
	}
	public void setDateNull(boolean isDateNull) {
		this.isDateNull = isDateNull;
	}
}
