package kr.co.dadrip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.PageDTO;
import kr.co.dadrip.service.IJokeService;
import kr.co.dadrip.service.IMemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/dadrip")
@Log4j
public class MainController {
	
	@Setter(onMethod_ = { @Autowired })
	private IMemberService service;
	
	@Setter(onMethod_ = { @Autowired })
	private IJokeService jokeService;
	
	@GetMapping("/main")
	public void main(Criteria cri, Model model) throws Exception {
		log.info("main................");
		
		model.addAttribute("list", jokeService.listAllJokes(cri));
		cri.setTimeScope("day");
		model.addAttribute("listDay", jokeService.listBestJokes(cri));
		cri.setTimeScope("week");
		model.addAttribute("listWeek", jokeService.listBestJokes(cri));
		cri.setTimeScope("month");
		model.addAttribute("listMonth", jokeService.listBestJokes(cri));
		cri.setTimeScope("");
		model.addAttribute("listAlltime", jokeService.listBestJokes(cri));
		
		int total = jokeService.getTotalCnt(cri);
	    log.info("total : " + total);

	    model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
}
