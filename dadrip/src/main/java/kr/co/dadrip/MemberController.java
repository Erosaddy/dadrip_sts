package kr.co.dadrip;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		mDto = service.login(mDto, session);
		
		return "/redirect:main";
	}
	
	// 회원가입(메인 화면)
	
	// 회원 정보 보기(마이페이지)
	
	// 회원 정보 수정(마이페이지 -> 수정 화면)
	
	// 회원 탈퇴(마이페이지 -> 수정 화면)
	
	// 전체 회원 조회(메인 화면, 운영자만 보이기(운영자 입장이니 내비게이션에 만들면 된다)
	
	
	
}
