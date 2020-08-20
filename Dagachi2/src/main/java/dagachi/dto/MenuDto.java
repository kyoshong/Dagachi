package dagachi.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuDto {
	
	private int menu_Num; //메뉴번호
    private int owner_Num; //사장 가맹번호
    private String menu_Price; //메뉴가격
    private String menu_Name; //메뉴명
    private String menu_Pic; //메뉴사진
    private String menu_Des; //메뉴설명
	

}
