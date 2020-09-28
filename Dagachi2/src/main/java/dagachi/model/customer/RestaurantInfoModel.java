package dagachi.model.customer;

import java.util.ArrayList;
import java.util.List;

import dagachi.dto.CustomerRestaurantSearchDto;
import dagachi.service.board.Paging;

public class RestaurantInfoModel {

	private List<CustomerRestaurantSearchDto> restaurantInfoList;
	private int count;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	
	public List<CustomerRestaurantSearchDto> getRestaurantInfoList() {
		return restaurantInfoList;
	}
	public void setRestaurantInfoList(List<CustomerRestaurantSearchDto> restaurantInfoList) {
		this.restaurantInfoList = restaurantInfoList;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRequestPage() {
		return requestPage;
	}
	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
	private Paging p;
	
	public Paging getP() {
		return p;
	}

	public void setP(Paging p) {
		this.p = p;
	}
	
	public RestaurantInfoModel() {
		this(new ArrayList<CustomerRestaurantSearchDto>(), 0, 0, 0, new Paging(),0);	
	}
	
	public RestaurantInfoModel(List<CustomerRestaurantSearchDto> restaurantInfoList, int requestPage, int totalPageCount, int startRow,
			Paging p, int count) {
		super();
		this.restaurantInfoList = restaurantInfoList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.p = p;
		this.count = count;
	}
	
}
