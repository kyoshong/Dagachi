package dagachi.dto;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDtoHK {
	
	private int review_Num;      
    private String customer_Name;     
    private int customer_Num;
    private int owner_Num;      
    private String review_Content;    
    private String restaurant_Name; 
    private int star_Count; 
    private String order_Date;  
    private String review_Passwd;
    private int reserv_Num; 
    private String review_Pic;
    private String review_Answer_Content;
    private Date reg_Date; 
    private String review_Thumb_Pic;


}
