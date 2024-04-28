package kr.co.dadrip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dadrip.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {
	@Autowired
	private IMemberService service;
	
	@GetMapping("")
	public void main() {
		log.info("main"
				+ " a");
	}
	
	@PostMapping("")
	public void mainLogin(String member_id, String member_pw) throws Exception {
		service.login(member_id, member_pw);
		log.info("login................");
	}
}
