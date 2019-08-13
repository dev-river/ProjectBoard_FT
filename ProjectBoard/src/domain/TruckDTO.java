package domain;

import java.io.Serializable;

public class TruckDTO implements Serializable, Comparable<TruckDTO>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int tNum;
	private String tPhone;
	private String tIntro;
	private String tInfo;
	private String tName;
	private String tTime;
	private int tOpen;
	private String foodCategory;
	private String tAddress;
	private String tNotice;
	private String tMenu;
	
	public TruckDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public TruckDTO(int tNum, String tName, String tTime, int tOpen, String foodCategory, String tAddress) {
		super();
		this.tNum = tNum;
		this.tName = tName;
		this.tTime = tTime;
		this.tOpen = tOpen;
		this.foodCategory = foodCategory;
		this.tAddress = tAddress;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + tNum;
		return result;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TruckDTO other = (TruckDTO) obj;
		if (tNum != other.tNum)
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "TruckDTO [tNum=" + tNum + ", tPhone=" + tPhone + ", tIntro=" + tIntro + ", tInfo=" + tInfo + ", tName="
				+ tName + ", tTime=" + tTime + ", tOpen=" + tOpen + ", foodCategory=" + foodCategory + ", tAddress="
				+ tAddress + ", tNotice=" + tNotice + ", tMenu=" + tMenu + "]";
	}



	public int gettNum() {
		return tNum;
	}



	public void settNum(int tNum) {
		this.tNum = tNum;
	}



	public String gettPhone() {
		return tPhone;
	}



	public void settPhone(String tPhone) {
		this.tPhone = tPhone;
	}



	public String gettIntro() {
		return tIntro;
	}



	public void settIntro(String tIntro) {
		this.tIntro = tIntro;
	}



	public String gettInfo() {
		return tInfo;
	}



	public void settInfo(String tInfo) {
		this.tInfo = tInfo;
	}



	public String gettName() {
		return tName;
	}



	public void settName(String tName) {
		this.tName = tName;
	}



	public String gettTime() {
		return tTime;
	}



	public void settTime(String tTime) {
		this.tTime = tTime;
	}



	public int gettOpen() {
		return tOpen;
	}



	public void settOpen(int tOpen) {
		this.tOpen = tOpen;
	}



	public String getFoodCategory() {
		return foodCategory;
	}



	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}



	public String gettAddress() {
		return tAddress;
	}



	public void settAddress(String tAddress) {
		this.tAddress = tAddress;
	}



	public String gettNotice() {
		return tNotice;
	}



	public void settNotice(String tNotice) {
		this.tNotice = tNotice;
	}



	public String gettMenu() {
		return tMenu;
	}



	public void settMenu(String tMenu) {
		this.tMenu = tMenu;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public TruckDTO(int tNum, String tPhone, String tIntro, String tInfo, String tName, String tTime, int tOpen,
			String foodCategory, String tAddress, String tNotice, String tMenu) {
		super();
		this.tNum = tNum;
		this.tPhone = tPhone;
		this.tIntro = tIntro;
		this.tInfo = tInfo;
		this.tName = tName;
		this.tTime = tTime;
		this.tOpen = tOpen;
		this.foodCategory = foodCategory;
		this.tAddress = tAddress;
		this.tNotice = tNotice;
		this.tMenu = tMenu;
	}



	@Override
	public int compareTo(TruckDTO o) {
		// TODO Auto-generated method stub
		return this.tName.compareTo(o.gettName());	
	}
	
	

}
