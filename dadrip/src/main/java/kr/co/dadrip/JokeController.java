package kr.co.dadrip;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.service.IJokeService;
import kr.co.dadrip.service.impl.JokeServiceImpl;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/joke")
@Log4j
public class JokeController {
	@Autowired
	private IJokeService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAllJokes(Model model) throws Exception {
		log.info("show all modal.................");
		
		model.addAttribute("list", service.listAllJokes());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() {
		log.info("RegisterGET...................");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(JokeDTO jDto, RedirectAttributes rttr) throws Exception {
		log.info("RegisterPOST...................");
		
		service.register(jDto);
		
		rttr.addFlashAttribute("result", jDto.getJoke_id());
		
		return "redirect:/joke/list";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("joke_id") Integer joke_id, Model model) throws Exception {
		log.info("read....................");
		
		model.addAttribute("joke", service.read(joke_id));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("joke_id") Integer joke_id, Model model) throws Exception {
		log.info("modifyGET..................");
		
		model.addAttribute("joke", service.read(joke_id));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(JokeDTO jDto, RedirectAttributes rttr) throws Exception {
		log.info("modifyPOST...................");
		
		if(service.update(jDto)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/joke/list";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("joke_id") Integer joke_id, RedirectAttributes rttr) throws Exception {
		log.info("modifyPOST...................");
		
		if(service.delete(joke_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/joke/list";
	}
}
