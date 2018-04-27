package Controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import Service.Event_Service;
import Service.Information_Service;
import Service.Member_Service;
import Service.Plan_Service;
import Service.Recruit_Service;
import Service.Review_Service;
import Service.Service_Center_Service;
import VO.MemberVO;
import Controller.DownloadView;


@Controller
public class MainController {
 
//		@Autowired
//    	private MainService mainSvc;
		
		@Autowired
		private Member_Service memberSvc;
		@Autowired
		Recruit_Service recService;
		@Autowired
		Plan_Service pService;
		@Autowired
		Review_Service revService;
		@Autowired
		Information_Service infoService;
		@Autowired
		Event_Service eService;
		@Autowired
		Service_Center_Service SCservice;
		
		
	
	@RequestMapping("main.do")
	public ModelAndView goMain(HttpSession session,String id){
		ModelAndView mav = new ModelAndView();
		MemberVO member= new MemberVO(id);
		if(id!=null){
			session.setAttribute("id",id);
			if(memberSvc.checkAdmin(member)==true){
				session.setAttribute("id", id);
				mav.addObject("admin", 'Y');
			}else{
				session.setAttribute("id", id);
				mav.addObject("admin", 'N');
				}
		}
		HashMap<String, Object> result = new HashMap<>();
		result.put("type", 0);
		result.put("EVT_END", "Y");
		result.put("EVT_FILE", "getfile");
		mav.addObject("recruit",recService.getRecruitList(1, result));
		mav.addObject("plan",pService.getPlanList(1, result));
		mav.addObject("event",eService.getEventList(result, -1));
		
		mav.setViewName("Main");
		return mav;
	}
	
	@RequestMapping("getBestReview.do")
	public void getBest(HttpServletResponse resp){
		JSONObject job = new JSONObject();
		resp.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> result = new HashMap<>();
		result.put("bestReview", revService.getBestReview());
		result.put("PreBestReview", revService.getPreBestReview());
		job.append("result",result);
		try {
			resp.getWriter().println(job);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
}
