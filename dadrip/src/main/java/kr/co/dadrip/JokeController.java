package kr.co.dadrip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.domain.PageDTO;
import kr.co.dadrip.service.IJokeService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/joke")
@Log4j
public class JokeController {
	
	@Setter(onMethod_ = { @Autowired })
	private IJokeService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAllJokes(Criteria cri, Model model) throws Exception {
		log.info("show all jokes.................");
		
		model.addAttribute("list", service.listAllJokes(cri));
		
		int total = service.getTotalCnt(cri);
	    log.info("total : " + total);

	    model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@RequestMapping(value = "/listBest", method = RequestMethod.GET)
	public void listBestJokes(Criteria cri, Model model) throws Exception {
		log.info("show all best jokes.................");
		
		model.addAttribute("listBest", service.listBestJokes(cri));
		
		int total = service.getTotalCnt(cri);
	    log.info("total : " + total);

	    model.addAttribute("pageMakerBest", new PageDTO(cri, total));
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
	
	@RequestMapping(value = {"/read", "/modify"}, method = RequestMethod.GET)
	public void read(@RequestParam("joke_id") Integer joke_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("read / modify..........");
		
		model.addAttribute("joke", service.read(joke_id));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(JokeDTO jDto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		log.info("modifyPOST...................");
		
		if(service.update(jDto)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/joke/list";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("joke_id") Integer joke_id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		log.info("removePOST...................");
		
		if(service.delete(joke_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/joke/list";
	}
	
}
