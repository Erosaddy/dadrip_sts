package kr.co.dadrip;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dadrip.domain.SampleDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sample")
public class SampleController {

	// Log4j가 없을때 쓰던 방식
	// private static final Logger logger =
	// 		LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping("")
	public void basic() {
		log.info("basic1.............");
	}
	// get 방식의 값만 받도록 명시하는 방법. 이땐 ("/basic")이 아닌 (value = "/basic")으로 써야 컴파일 오류가 발생하지 않는다.
	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public void basicGet() {
		log.info("basicGet...................");
	}
	// 다음과 같은 방식으로 중괄호를 사용해 여러 방식으로 값을 받아오도록 설정할 수도 있다.
	@RequestMapping(value = "/basic3", method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet3() {
		log.info("basicGet3...................");
	}
	
	@GetMapping("/basicOnlyGet")
	public void basicOnlyGet() {
		log.info("/basicOnlyGet.................");
	}
	
	@PostMapping("/basicOnlyPost")
	public void basicOnlyPost() {
		log.info("/basicOnlyPost..................");
	}
	// DTO 클래스 안에 `@Data`(lombok 기능)가 존재하기 때문에
	// request.getParameter와 getter/setter 없이도 DTO를 import 하는 것만으로 바로 값을 받을 수 있다.
	// @Data 어노테이션은 이외에도 equals(), toString() 등의 메서드를 자동 생성해준다.
	@RequestMapping("/ex01") 
	public String ex01(SampleDTO sDto) {
		log.info(sDto);
		
		return "ex01";
	}
	
	@GetMapping("/ex02")
	public String ex02(
			@RequestParam("name") String superName,
			@RequestParam("age") int superAge) {
		log.info("name : " + superName + " age : " + superAge);
		
		return "/ex02";
	}
	
	@RequestMapping(value = "/ex02List", method = RequestMethod.GET)
	public String ex02List(@RequestParam("ids") List<String> ids) {
		log.info(ids);
		
		return "/ex02List";
	}
	
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {
		log.info(Arrays.toString(ids));
		
		return "/ex02Array";
	}
	
	@RequestMapping("/sampleModel")
	public String sampleModel(Model model) {
		// 샘플데이터 생성
		// DTO의 name과 age에 대해 url에서 get 방식으로 보낼 수도, 아래처럼 메소드 내에서 값을 지정할 수도 있다.
		// MVC의 Controller는 Java Beans 규칙에 맞는 객체는 화면으로 알아서 전달한다.
		// 그러나 이는 파라미터 내부에 객체가 선언될 경우에 한하는데, 파라미터 내부에서 객체가 선언될 때 스프링 내부적으로
		// 해당 객체는 @ModelAttribute 어노테이션을 부여받은 것과 비슷한 취급을 받는다.
		// 그러나 아래와 같이 new 를 통해 새 객체를 메소드 내부에서 생성하는 경우에는, 자동으로 화면으로 객체가 전달되지 않는다.
		// 이러한 경우에는 Model 클래스의 addAttribute 메소드를 활용해 화면으로 데이터를 명시적으로 보내줘야 한다.
		SampleDTO sDto = new SampleDTO();
		sDto.setName("이상준");
		sDto.setAge(25);
		
		log.info(sDto);
		
		// 두 가지 패턴
		// 1. 
		model.addAttribute(sDto);
		// 2. "data"로 화면에서 호출
		model.addAttribute("data", sDto);
		
		return "/sample/sample";
	}
	
	@GetMapping("/ex04")
	public String ex04(SampleDTO sDto, @ModelAttribute("page") int page) {
		log.info("sDto : " + sDto);
		log.info("page : " + page);
		
		return "/sample/ex04";
	}
	
	@RequestMapping("/doE")
	public String doE(RedirectAttributes rttr) {
		log.info("/doE가 호출되지만 /doF로 리다이렉트................");
		
		rttr.addFlashAttribute("msg", "리다이렉트된 메시지입니다.");
		
		return "redirect:/sample/doF";
	}
	
	@RequestMapping("/doF")
	public String doF(String msg) {
		log.info("doE에서의 리다이렉트를 통해 doF 호출됨.................");
		
		return "/sample/redirectAttributeResult";
	}
	
	@RequestMapping("/ex05")
	public @ResponseBody SampleDTO ex05() {
		log.info("/ex05............");
		
		SampleDTO sDto = new SampleDTO();
		sDto.setName("홍준표");
		sDto.setAge(28);
		
		return sDto;
	}
	
	@RequestMapping("/ex05_1")
	public @ResponseBody Map<String, SampleDTO> ex05_1() {
		log.info("/ex05_1.....................");
		
		SampleDTO sDto = new SampleDTO();
		Map<String, SampleDTO> map = new HashMap<>();
						
			sDto.setName("강감찬");
			sDto.setAge(57);
			
			map.put("info", sDto);
			
		return map;
	}
	
	@RequestMapping("/ex05_2")
	public @ResponseBody Map<String, List<SampleDTO>> ex05_2() {

		List<SampleDTO> list = new ArrayList<>();
		Map<String, List<SampleDTO>> map = new HashMap<>();
		
		SampleDTO sDto1 = new SampleDTO();
		sDto1.setName("이상준");
		sDto1.setAge(25);
		
		list.add(sDto1);
		
		SampleDTO sDto2 = new SampleDTO();
		sDto2.setName("박다혜");
		sDto2.setAge(28);
		
		list.add(sDto2);
		
		SampleDTO sDto3 = new SampleDTO();
		sDto3.setName("한승우");
		sDto3.setAge(29);
		
		list.add(sDto3);
		
		map.put("info", list);
		
		return map;
	}
	
	@RequestMapping("/ex06")
	public ResponseEntity<String> ex06() {
		log.info("/06...............");
		
		String msg = "{\"name\":\"홍길동\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/exFileUpload", method = RequestMethod.GET)
	public void exFileUpload() {
		log.info("/exFileUpload.....................");
	}
	
	@RequestMapping(value = "/exUploadPost", method = RequestMethod.POST)
	public void exUploadPost(ArrayList<MultipartFile> files) throws Exception{
		log.info("/exUploadPost.....................");
		
		files.forEach(file -> {
			log.info("-------------------------");
			log.info("fileName : " + file.getOriginalFilename());
			log.info("fileSize : " + file.getSize());
		});
	}
	
	
}
