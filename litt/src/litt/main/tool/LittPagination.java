package litt.main.tool;

public class LittPagination {
	
	/**
	 * 通过开始页号和每页条数来进行分页计算
	 * @param rows
	 * @param page
	 */
	public LittPagination(int page, int rows){
		setStartNum((page - 1) * rows);
		setRows(rows);
		setPage(page);
		setPagination(true);
	}
	
	public LittPagination(){
		
	}
	
	private boolean isPagination = false;
	private int rows; // 该页有多少条记录
	private int page; // 要查询第几页
	
	private int startNum;
	
	public int getRows() {
		return rows;
	}
	private void setRows(int rows) {
		this.rows = rows;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartNum() {
		return startNum;
	}
	private void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public boolean isPagination() {
		return isPagination;
	}
	public void setPagination(boolean isPagination) {
		this.isPagination = isPagination;
	}
}
