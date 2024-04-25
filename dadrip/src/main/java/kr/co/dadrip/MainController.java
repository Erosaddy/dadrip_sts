package kr.co.dadrip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/dadrip")
@Log4j
public class MainController {
	@RequestMapping("/main")
	public void main() {
		log.info("main....................");
	}
	
	@RequestMapping("/mainSignIn")
	public void mainSignIn() {
		log.info("mainSignIn................");
	}
}
