package com.join.landmark.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.join.landmark.service.LandmarkService;
import com.join.landmark.vo.LandmarkVO;

@Controller
public class LandmarkController {

	private LandmarkService landmarkService;
	
	public void setLandmarkService(LandmarkService landmarkService) {
		this.landmarkService = landmarkService;
	}
	
	//전체 추천 여행지 리스트!!!
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public ModelAndView viewRecommendPage() {
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
