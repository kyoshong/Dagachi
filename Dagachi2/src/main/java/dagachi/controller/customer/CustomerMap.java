package dagachi.controller.customer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

import dagachi.dto.CustomerRestaurantSearchDto;
import dagachi.service.customer.CustomerRestaurantSearchServiceImpl;

@Controller
public class CustomerMap {

	@Autowired
	private CustomerRestaurantSearchServiceImpl crsdi;

	//리스트
	@GetMapping("/c_Map")
	public String listDetail(int owner_Num, Model m) throws Exception {
		System.out.println(owner_Num);
		CustomerRestaurantSearchDto list = crsdi.listDetail(owner_Num);
		System.out.println(list.toString());
		m.addAttribute("list", list);
		System.out.println(list.toString());
		return "customer/c_Map";
	}


}
