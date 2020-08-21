package dagachi.dto;




import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReservationDto {
	
	private int reserv_Num; //주문번호
	private int customer_Num; //고객번호 
	private String date_Of_Use; //주문일
	private String time_Of_Use; // 주문 시간
	private String reserv_Name; // 예약자 명
	private String restaurant_Name;//상호명 
	private int number_Of_People; //인원 
	private String customer_PhoneNumber;//고객전화번호 
	private int reserv_Fee;//예약금 
	private String reserv_Confirm;//예약확정 여부 
	private int owner_Num;//사장 가맹번호 
	private String customer_Name; //예약자명

}