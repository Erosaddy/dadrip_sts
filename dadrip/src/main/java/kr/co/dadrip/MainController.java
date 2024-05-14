package kr.co.dadrip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dadrip.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/dadrip")
@Log4j
public class MainController {
	@Autowired
	private IMemberService service;
	
	@GetMapping("/main")
	public void main() {
		log.info("main................");
	}
	
	@GetMapping("/mainSignIn")
	public void mainSignIn() {
		log.info("mainSignIn................");
	}

}
