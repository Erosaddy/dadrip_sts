package kr.co.dadrip;

import java.lang.ProcessBuilder.Redirect;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dadrip.domain.MemberDTO;
import kr.co.dadrip.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Autowired
	private IMemberService service;
	// 로그인(메인 화면)
	
	@PostMapping("/login")
	public String login(MemberDTO mDto, HttpSession session) throws Exception {
		log.info("login...............");
		log.info("mDto =============> " + mDto);
		
		mDto = service.login(mDto, session);
		
		return "redirect:/dadrip/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		log.info("before logout..............." + session);
		service.logout(session);
		log.info("after logout..............." + session);
		
		return "redirect:/dadrip/main";
		
	}
	
	// 회원가입(메인 화면)
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(MemberDTO mDto, RedirectAttributes rttr) throws Exception {
		log.info("signup...............");
		log.info("mDto ===============> " + mDto);
		service.register(mDto);
		
		rttr.addFlashAttribute("result", mDto.getMember_id());
		
		return "/redirect:/dadrip/main";
	}
	
	// 회원 정보 보기(마이페이지)
	@GetMapping({"/mypage", "mypage/modify"})
	public void mypage(@RequestParam("member_id") String member_id, Model model) throws Exception {
		log.info("mypage | mypage/modify...............");
		model.addAttribute("member", service.memberInfo(member_id));
		
	}
	
	// 회원 정보 수정(마이페이지 -> 수정 화면)
	@PostMapping("/mypage/modify")
	public String modifyPOST(MemberDTO mDto, RedirectAttributes rttr) throws Exception {
		log.info("mypage/modify...............");
		log.info("mDto ============> " + mDto);
		
		if(service.modify(mDto)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/mypage";
	}
	
	// 회원 탈퇴(마이페이지 -> 수정 화면)
	@PostMapping("mypage/delete")
	public String delete(@RequestParam("member_id") String member_id, RedirectAttributes rttr) {
		
		return "redirect:/mypage";
	}
	
	// 전체 회원 조회(메인 화면, 운영자만 보이기(운영자 입장이니 내비게이션에 만들면 된다)
	@GetMapping("/memberlist")
	public void memberList() throws Exception {
		service.memberList();
	}
	
	
}
