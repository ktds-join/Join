package com.join.landmark.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.join.landmark.service.LandmarkService;
import com.join.landmark.vo.LandmarkVO;
import com.join.landmark.vo.TravelStyleVO;

@Controller
public class LandmarkController {

	private LandmarkService landmarkService;
	
	public void setLandmarkService(LandmarkService landmarkService) {
		this.landmarkService = landmarkService;
	}
	//있음 선택시 나올 지도 페이지 부분
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String viewMapPage() {
		return "landmark/map";
	} 
	
	// 걍 GET 
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public ModelAndView viewRecommendPage() {
		ModelAndView view = new ModelAndView();
		view.setViewName("landmark/recommendList");	
		List<LandmarkVO> landmarkList = landmarkService.getAll();
		view.addObject("landmarkList", landmarkList);
		return view;
	} 
	
	// 메인에서 값을 받아온 거 담아놓기
	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
	public ModelAndView doRecommendPage(@RequestParam("tripStyle") int styleId, @ModelAttribute("tripStyleForm") HttpServletRequest request) {

		System.out.println(styleId);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("landmark/recommendList");	
		List<LandmarkVO> landmarkList = landmarkService.getAll();
		view.addObject("landmarkList", landmarkList);
		
		
		return view;
	} 
	
	/*@RequestMapping("/recommend/city/{tripCityId}")
	public ModelAndView viewCityPage(@PathVariable int tripCityId, LandmarkVO landmarkVO) {
		ModelAndView view = new ModelAndView();
		view.setViewName("landmark/recommendList");
		List<LandmarkVO> cityBased = landmarkService.getCity(landmarkVO.getTripCityId());
		//System.out.println(cityBased.get(0).getLandmarkTitle());
		view.addObject("cityLM", cityBased);
		return view;
	}
	
	@RequestMapping("/recommend/style/{tripStyleId}")
	public ModelAndView viewStylePage(@PathVariable int tripStyleId, LandmarkVO landmarkVO) {
		ModelAndView view = new ModelAndView();
		view.setViewName("landmark/recommendList");
		List<LandmarkVO> styleBased = landmarkService.getStyle(landmarkVO.getTripStyleId());
		System.out.println(styleBased.get(0).getLandmarkTitle());
		view.addObject("styleLM", styleBased);
		return view;
	}*/
}
