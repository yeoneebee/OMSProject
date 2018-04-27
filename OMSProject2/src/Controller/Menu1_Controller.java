package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import Service.Member_Service;
import Service.Plan_Service;
import Service.Recruit_Service;
import VO.MemberVO;
import VO.PlanVO;
import VO.Plan_ApplyVO;
import VO.RecruitVO;
import VO.Recruit_ApplyVO;


@Controller
public class Menu1_Controller {
	
	@Autowired
	Recruit_Service recService;
	@Autowired
	Plan_Service pService;
	@Autowired
	Member_Service mService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	
	//모집메인
	@RequestMapping("recruit_main.do")
	public String Recruit_main(
			@RequestParam(defaultValue="0") int type ,
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false) String REC_DESTINATION,
			@RequestParam(required=false) String REC_GENDER,
			@RequestParam(required=false) String REC_STATE,
			@RequestParam(required=false)Date startdate,
			@RequestParam(required=false)Date enddate,
			@RequestParam(defaultValue="1") int page,
			Model model){
		HashMap<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		if(keyword==null)
			type=0;
		
		
		if(type==1||type==3){
			params.put("REC_TITLE", keyword);			
		}
		if(type==2||type==3){
			params.put("REC_CONTENT", keyword);
		}if(type==4){
			params.put("M_ID", keyword);
		}
	
			params.put("type", type);
		if(REC_DESTINATION!=null)
			params.put("REC_DESTINATION", REC_DESTINATION);
		if(REC_GENDER!=null)
			params.put("REC_GENDER", REC_GENDER);
		if(REC_STATE!=null)
			params.put("REC_STATE", REC_STATE);
		if(startdate!=null&&enddate!=null){
			params.put("startdate", startdate);
			params.put("enddate", enddate);
		}
		model.addAllAttributes(recService.getRecruitList(page, params));
		return "Recruit/Recruit_Main";
	}
	
	//모집 글쓰기폼
	@RequestMapping("recruit_writeForm.do")
	public String Recruit_WriteForm(Model model,HttpSession session){
		String id = (String)session.getAttribute("id");
		model.addAttribute("M_ID",id);		
		return "Recruit/Recruit_WriteForm";
	}
	
	
	
	//모집 삭제
	@RequestMapping("recruit_delete.do")
	public String recruit_Delete(RecruitVO recruit,HttpSession session){
		String id= (String)session.getAttribute("id");
		recService.deleteRecruit(recruit, id);
		return "redirect:recruit_main.do";
	}
	
	
	//모집 글쓰기
	@RequestMapping("recruit_write.do")
	public String recruit_write(String REC_CONTENT,
			String M_ID,int REC_MEMBER_COUNT,String REC_DESTINATION,
			@RequestParam(required=false)Date REC_START,
			@RequestParam(required=false)Date REC_END,
			char REC_GENDER, @RequestParam("ufile")MultipartFile ufile){
		RecruitVO recruit = new RecruitVO(REC_CONTENT, M_ID, REC_MEMBER_COUNT, REC_DESTINATION, REC_START, REC_END, REC_GENDER);
		recService.writeRecruit(recruit,ufile);
		return "redirect:recruit_main.do";
	}
	
	@RequestMapping("recruit_view.do")
	public ModelAndView recruit_view(int num, HttpSession session){
		String id=null;
		try{
		id = (String)session.getAttribute("id");
		}catch(Exception e){}		
		ModelAndView mav = new ModelAndView();
		RecruitVO recruit=new RecruitVO();
		recruit.setREC_NO(num);
		recruit=recService.readRecruit(recruit,id);
		try{
		if(recruit.getM_ID().equals(id))
			mav.addObject("ismine",true);
		else
			mav.addObject("ismine",false);
		}catch(Exception e){mav.addObject("ismine",false);}			
		mav.addObject("rec",recruit);
		mav.setViewName("Recruit/Recruit_View");
		return mav;
	}
	
	@RequestMapping("recruit_updateForm.do")
	public ModelAndView recruit_updateForm(int num, HttpSession session){
		RecruitVO rec=new RecruitVO();
		ModelAndView mav = new ModelAndView();
		rec.setREC_NO(num);
		RecruitVO getrec =recService.selectRecruit(rec);
		mav.addObject("recruit",getrec);	
		mav.setViewName("Recruit/Recruit_UpdateForm");	
		return mav;
	
	}
	
	
	@RequestMapping("recruit_update.do")
	public String recruit_update(RecruitVO rec,HttpSession session,MultipartFile ufile){
		int num = recService.updateRecruit(rec, ufile);
		return "redirect:recruit_view.do?num="+num;
	}
	@RequestMapping("recruit_refrence.do")
	public String recruit_refrence(RecruitVO rec, HttpSession session){
		MemberVO m = new MemberVO();
		try{
			String id=(String)session.getAttribute("id");
				if(id==null)
				return "loginform.do";
		m.setM_ID(id);
		recService.recruitApply(rec, m);
		return "redirect:recruit_view.do?num="+rec.getREC_NO();
		}catch(Exception e){
			return "loginform.do";
		}
	}
	
	@RequestMapping(value="getRefrenceList.do", method=RequestMethod.GET)
	@ResponseBody
	public void getRefrenceList(
			@RequestParam(defaultValue="1") int page,
			@RequestParam("REC_NO") int REC_NO,
			HttpServletResponse resp)
	{
	HashMap<String, Object> params = new HashMap<>();
	params.put("REC_NO", REC_NO);
	params.put("page",page);
	JSONObject job = new JSONObject();
	job.append("result", recService.getRecruit_ApplyList(page, params));
	try {
		resp.getWriter().print(job);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	
	
	@RequestMapping(value="doRefrence.do", method=RequestMethod.GET)
	@ResponseBody
	public void doRefrence(
			@RequestParam("REC_APPLY_NO") int REC_APPLY_NO,
			@RequestParam("REC_NO") int REC_NO,
			@RequestParam("M_ID") String M_ID,
			@RequestParam("page") int page,
			HttpServletResponse resp)
	{
	resp.setCharacterEncoding("UTF-8");
	HashMap<String, Object> params = new HashMap<>();
	params.put("REC_NO", REC_NO);
	params.put("M_ID",M_ID);
	JSONObject job = new JSONObject();
	Recruit_ApplyVO rea=new Recruit_ApplyVO(REC_APPLY_NO,REC_NO,M_ID);
	int result = recService.recruitConfirm(rea);
	String msg= "";
	if(result==-1){
		msg="인원이 꽉차 수정불가능 합니다.";
	}else{
		msg="수정완료";
	}
	job.append("page", page);
	job.append("result", msg);

	try {
		resp.getWriter().print(job);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	@RequestMapping("recruitdownload.do")
	public View recruitdownload(int num)
	{
		RecruitVO recruit = new RecruitVO();
		recruit.setREC_NO(num);
		View view = new DownloadView(recService.getAttachFile(recruit));
		return view;
	}

	
	
	
	
	
	
	
	//========================계획부분 =========================
	
	
	@RequestMapping("plan_main.do")
	public String plan_Main(
			@RequestParam(defaultValue="0") int type ,
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false) String PLAN_DESTINATION,
			@RequestParam(required=false) String PLAN_GENDER,
			@RequestParam(required=false) String PLAN_STATE,
			@RequestParam(required=false)Date startdate,
			@RequestParam(required=false)Date enddate,
			@RequestParam(defaultValue="1") int page,
			Model model){
		HashMap<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		if(type==1||type==3){
			params.put("PLAN_TITLE", keyword);			
		}
		if(type==2||type==3){
			params.put("PLAN_CONTENT", keyword);
		}if(type==4){
			params.put("M_ID", keyword);
		}
	
			params.put("type", type);
		if(PLAN_DESTINATION!=null)
			params.put("PLAN_DESTINATION", PLAN_DESTINATION);
		if(PLAN_GENDER!=null)
			params.put("PLAN_GENDER", PLAN_GENDER);
		if(PLAN_STATE!=null)
			params.put("PLAN_STATE", PLAN_STATE);
		if(startdate!=null&&enddate!=null){
			params.put("startdate", startdate);
			params.put("enddate", enddate);
		}
		model.addAllAttributes(pService.getPlanList(page, params));
		return "Plan/Plan_Main";
		}
	
	
	//계획 글쓰기폼
	@RequestMapping("plan_writeForm.do")
	public ModelAndView plan_writeForm(HttpSession session){
		String id=(String)session.getAttribute("id");
		MemberVO m =new MemberVO(id);
		ModelAndView mav =new ModelAndView();
		mav.addObject("member",mService.selectOneMember(m));
		mav.setViewName("Plan/Plan_WriteForm");
		return mav;		
	}
	//계획 글쓰기
	@RequestMapping("plan_write.do")
	public String plan_write(PlanVO plan,
			@RequestParam("ufile")MultipartFile ufile){
		return "redirect:plan_view.do?num="+pService.writePlan(plan, ufile);
	}
	
	//계획 뷰페이지
	@RequestMapping("plan_view.do")
	public ModelAndView plan_view(int num,HttpSession session){
		String id= null;
			try{
			id = (String)session.getAttribute("id");
			}catch(Exception e){}
		
		ModelAndView mav = new ModelAndView();
		PlanVO p =new PlanVO(num);
		p=pService.readPlan(p,id);
		mav.addObject("plan",p);
		try{
			if(p.getM_ID().equals(id))
				mav.addObject("ismine",true);
			else
				mav.addObject("ismine",false);
			}catch(Exception e){mav.addObject("ismine",false);}	
		
		mav.setViewName("Plan/Plan_View");
		return mav;				
	}
	
	
	
	//계획 수정폼
	@RequestMapping("plan_updateForm.do")
	public ModelAndView plan_update(PlanVO plan){
		ModelAndView mav = new ModelAndView();
		plan=pService.selectPlan(plan);
		mav.addObject("plan",plan);
		mav.setViewName("Plan/Plan_UpdateForm");
		return mav;
	}
	
	@RequestMapping("plan_update.do")
	public ModelAndView plan_update(PlanVO plan,
			@RequestParam("ufile")MultipartFile ufile){
		ModelAndView mav = new ModelAndView();
		int num = pService.updatePlan(plan,ufile);		
		mav.setViewName("redirect:plan_view.do?num="+num);
		return mav;
	}
	
	@RequestMapping("plan_delete.do")
	public String plan_delete(PlanVO plan,HttpSession session){
		String id =(String)session.getAttribute("id");
		plan.setM_ID(id);
		pService.deletePlan(plan);		
		return "redirect:plan_main.do";
	}
	
	//신청자목록
	@RequestMapping(value="getPlanRefrenceList.do", method=RequestMethod.GET)
	@ResponseBody
	public void getPlanRefrenceList(
			@RequestParam(defaultValue="1") int page,
			@RequestParam("PLAN_NO") int PLAN_NO,
			HttpServletResponse resp)
	{
	HashMap<String, Object> params = new HashMap<>();
	params.put("PLAN_NO", PLAN_NO);
	params.put("page",page);
	JSONObject job = new JSONObject();
	job.append("result", pService.getPlan_ApplyList(page, params));
	try {
		resp.getWriter().print(job);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	//신청
	@RequestMapping("plan_refrence.do")
	public String recruit_refrence(Plan_ApplyVO plan, HttpSession session){
		MemberVO m = new MemberVO();
		try{
			String id=(String)session.getAttribute("id");
			if(id==null)
				return "loginform.do";
		plan.setM_ID(id);
		pService.PlanApply(plan);
		return "redirect:plan_view.do?num="+plan.getPLAN_NO();
		}catch(Exception e){
			return "loginform.do";
		}
	}
	
	
	//확정
	@RequestMapping(value="doPlanRefrence.do", method=RequestMethod.GET)
	@ResponseBody
	public void doPlanRefrence(
			@RequestParam("PLAN_APPLY_NO") int PLAN_APPLY_NO,
			@RequestParam("PLAN_NO") int PLAN_NO,
			@RequestParam("M_ID") String M_ID,
			@RequestParam("page") int page,
			HttpServletResponse resp)
	{
		
	resp.setCharacterEncoding("UTF-8");
	HashMap<String, Object> params = new HashMap<>();
	params.put("PLAN_NO", PLAN_NO);
	params.put("M_ID",M_ID);
	JSONObject job = new JSONObject();
	Plan_ApplyVO rea=new Plan_ApplyVO(PLAN_APPLY_NO,PLAN_NO,M_ID);
	int result = pService.planConfirm(rea);
	String msg= "";
	
	if(result==-1){
		msg="인원이 꽉차 수정불가능 합니다.";
	}else{
		msg="수정완료";
	}
	job.append("page", page);
	job.append("result", msg);
	
	try {
		resp.getWriter().print(job);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	@RequestMapping("plandownload.do")
	public View plandownload(PlanVO plan)
	{
		View view = new DownloadView(pService.getAttachFile(plan));
		return view;
	}
	
}
