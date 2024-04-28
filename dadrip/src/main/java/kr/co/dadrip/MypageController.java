package kr.co.dadrip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dadrip.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage")
@Log4j
public class MypageController {
	@Autowired
	private IMemberService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main() {
		
	}
	
}
