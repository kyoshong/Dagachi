package dagachi.model.board;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FranchiseNewlistDto {
	
	private String restaurant_Num;
	private String owner_name;
	private String owner_email;
	private String owner_password;
	private String owner_phonenumber;
	private String restaurant_Address;
	private String restaurant_detail_Address;
	private String owner_SecurityNum;
	private String restaurant_Name;
	
	
	
	public String getRestaurant_detail_Address() {
		return restaurant_detail_Address;
	}
	public void setRestaurant_detail_Address(String restaurant_detail_Address) {
		this.restaurant_detail_Address = restaurant_detail_Address;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date owner_JoinRequest_Date;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date owner_Join_Date;
	
	public String getRestaurant_Num() {
		return restaurant_Num;
	}
	public void setRestaurant_Num(String restaurant_Num) {
		this.restaurant_Num = restaurant_Num;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public String getOwner_email() {
		return owner_email;
	}
	public void setOwner_email(String owner_email) {
		this.owner_email = owner_email;
	}
	public String getOwner_password() {
		return owner_password;
	}
	public void setOwner_password(String owner_password) {
		this.owner_password = owner_password;
	}
	public String getOwner_phonenumber() {
		return owner_phonenumber;
	}
	public void setOwner_phonenumber(String owner_phonenumber) {
		this.owner_phonenumber = owner_phonenumber;
	}
	public String getRestaurant_Address() {
		return restaurant_Address;
	}
	public void setRestaurant_Address(String restaurant_Address) {
		this.restaurant_Address = restaurant_Address;
	}
	public String getOwner_SecurityNum() {
		return owner_SecurityNum;
	}
	public void setOwner_SecurityNum(String owner_SecurityNum) {
		this.owner_SecurityNum = owner_SecurityNum;
	}
	public String getRestaurant_Name() {
		return restaurant_Name;
	}
	public void setRestaurant_Name(String restaurant_Name) {
		this.restaurant_Name = restaurant_Name;
	}
	public Date getOwner_JoinRequest_Date() {
		return owner_JoinRequest_Date;
	}
	public void setOwner_JoinRequest_Date(Date owner_JoinRequest_Date) {
		this.owner_JoinRequest_Date = owner_JoinRequest_Date;
	}
	public Date getOwner_Join_Date() {
		return owner_Join_Date;
	}
	public void setOwner_Join_Date(Date owner_Join_Date) {
		this.owner_Join_Date = owner_Join_Date;
	}
	
	@Override
	public String toString() {
		return "FranchiseNewlistDto [restaurant_Num=" + restaurant_Num + ", owner_name=" + owner_name + ", owner_email="
				+ owner_email + ", owner_password=" + owner_password + ", owner_phonenumber=" + owner_phonenumber
				+ ", restaurant_Address=" + restaurant_Address + ", restaurant_detail_Address="
				+ restaurant_detail_Address + ", owner_SecurityNum=" + owner_SecurityNum + ", restaurant_Name="
				+ restaurant_Name + ", owner_JoinRequest_Date=" + owner_JoinRequest_Date + ", owner_Join_Date="
				+ owner_Join_Date + "]";
	}
	
	
}
