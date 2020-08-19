package dagachi.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDto {
	private int review_Num;
	private String customer_name;
	private int customer_num;
	private int owner_num;
	private String review_Content;
	private String restaurant_Name;
	private int star_Count;
	private Date order_date;
	private int reserv_num;
	private Date review_date;
	private int ref;
	private int re_step;
	private int re_level;
	private String review_Pic;
	private String review_Thumb_Pic;
}
