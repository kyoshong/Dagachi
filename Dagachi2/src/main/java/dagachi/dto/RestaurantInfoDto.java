package dagachi.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RestaurantInfoDto {

    private int owner_Num;//사장 가맹번호
    private String restaurant_Name; //상호명 
    private String restaurant_Num;//사업자번호 
    private String restaurant_Sector; //업종 
    private String owner_PhoneNumber; //매장전화번호
    private String opening_Hours; //영업시간
    private String restaurant_Address; //매장주소
    private String restaurant_Detail_Address; //매장 상세 주소
    private String restaurant_Pic; //음식점 메인사진
    private int capacity; //수용인원
    private String dating; //데이트
    private String groupReserv; //단체 
    private String family;//가족
    private String friend; //친구
    private String playGround; //유아놀이방
    private String parking_Lot;// 주차장
    
}
