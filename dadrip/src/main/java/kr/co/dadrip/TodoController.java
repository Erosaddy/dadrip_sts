package kr.co.dadrip;

import java.text.SimpleDateFormat;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dadrip.domain.TodoDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/todo")
public class TodoController {

	@RequestMapping("")
	public void basic() {
		log.info("basic...........");
	}
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat =
//				new SimpleDateFormat("YYYY-MM-DD");
//		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
//	}
	
	@GetMapping("/ex03")
	public String ex01List(TodoDTO tDto) {
		log.info("todo : " + tDto);
		
		return "/ex03";
	}
	
	
	
}
