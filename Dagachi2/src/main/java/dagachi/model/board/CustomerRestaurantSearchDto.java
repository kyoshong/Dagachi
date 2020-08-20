package dagachi.model.board;

public class CustomerRestaurantSearchDto {
	
	int owner_num;//사장 가맹번호
	String restaurant_Num;// 사업자번호
	String restaurant_Name;// 상호명
    String restaurant_Sector;// 업종 
    String owner_phonenumber;// 매장전화번호 
    String restaurant_Address;// 매장주소
    String opening_hours;// 영업시간 
    String restaurant_Pic;// 음식점 메인사진 
    int capacity;// 예약가능인원
    
    String date;// 데이트
    String group;// 단체 
    String playGround;// 유아놀이방 
    String family;// 가족 
    String friend;// 친구
    String parking_lot;// 주차장
    
    double avg_star_Count;// 리뷰별점평균

	public int getOwner_num() {
		return owner_num;
	}

	public void setOwner_num(int owner_num) {
		this.owner_num = owner_num;
	}

	public String getRestaurant_Num() {
		return restaurant_Num;
	}

	public void setRestaurant_Num(String restaurant_Num) {
		this.restaurant_Num = restaurant_Num;
	}

	public String getRestaurant_Name() {
		return restaurant_Name;
	}

	public void setRestaurant_Name(String restaurant_Name) {
		this.restaurant_Name = restaurant_Name;
	}

	public String getRestaurant_Sector() {
		return restaurant_Sector;
	}

	public void setRestaurant_Sector(String restaurant_Sector) {
		this.restaurant_Sector = restaurant_Sector;
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

	public String getOpening_hours() {
		return opening_hours;
	}

	public void setOpening_hours(String opening_hours) {
		this.opening_hours = opening_hours;
	}

	public String getRestaurant_Pic() {
		return restaurant_Pic;
	}

	public void setRestaurant_Pic(String restaurant_Pic) {
		this.restaurant_Pic = restaurant_Pic;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getPlayGround() {
		return playGround;
	}

	public void setPlayGround(String playGround) {
		this.playGround = playGround;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getFriend() {
		return friend;
	}

	public void setFriend(String friend) {
		this.friend = friend;
	}

	public String getParking_lot() {
		return parking_lot;
	}

	public void setParking_lot(String parking_lot) {
		this.parking_lot = parking_lot;
	}

	public double getAvg_star_Count() {
		return avg_star_Count;
	}

	public void setAvg_star_Count(double avg_star_Count) {
		this.avg_star_Count = avg_star_Count;
	}

	@Override
	public String toString() {
		return "CustomerRestaurantSearchDto [owner_num=" + owner_num + ", restaurant_Num=" + restaurant_Num
				+ ", restaurant_Name=" + restaurant_Name + ", restaurant_Sector=" + restaurant_Sector
				+ ", owner_phonenumber=" + owner_phonenumber + ", restaurant_Address=" + restaurant_Address
				+ ", opening_hours=" + opening_hours + ", restaurant_Pic=" + restaurant_Pic + ", capacity=" + capacity
				+ ", date=" + date + ", group=" + group + ", playGround=" + playGround + ", family=" + family
				+ ", friend=" + friend + ", parking_lot=" + parking_lot + ", avg_star_Count=" + avg_star_Count + "]";
	}

}
