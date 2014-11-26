package litt.main.tool;

import java.util.Date;
import java.util.Map;

public class LittCondition {
	
	private boolean isMapNotNull = false;
	private boolean isDateNotNull = false;
	
	private Map<String,Object> map;
	private Date startDate; 
	private Date endDate;
	private String dateProp;
	
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
		setMapNotNull(true);
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
		setDateNotNull(true);
	}
	public boolean isMapNotNull() {
		return isMapNotNull;
	}
	private void setMapNotNull(boolean isMapNotNull) {
		this.isMapNotNull = isMapNotNull;
	}
	public boolean isDateNotNull() {
		return isDateNotNull;
	}
	private void setDateNotNull(boolean isDateNotNull) {
		this.isDateNotNull = isDateNotNull;
	}
}
