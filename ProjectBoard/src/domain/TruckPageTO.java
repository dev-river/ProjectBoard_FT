package domain;

import java.util.List;

import domain.TruckDTO;

public class TruckPageTO {

	private int amount;
	private int curPage;
	private int perPage;
	private int totalPage;
	private int startNum;
	private int endNum;
	private List<TruckDTO> list;
	
	public TruckPageTO() {
		perPage=3;
	}

	public TruckPageTO(int curPage) {
		this.curPage = curPage;
		perPage=3;
	}

	private void change() {
		
		totalPage = (amount-1)/perPage +1;
		startNum = (curPage-1)*perPage+1;
		endNum = curPage * perPage;
		endNum = endNum < amount ? endNum : amount;
		
	}
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		change();
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
		change();
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
		change();
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public List<TruckDTO> getList() {
		return list;
	}

	public void setList(List<TruckDTO> list) {
		this.list = list;
	}
	
	
}
