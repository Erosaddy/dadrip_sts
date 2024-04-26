package kr.co.dadrip.joke;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class JokeControllerTest {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/joke/list"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testRegisterGET() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/joke/register"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testRegisterPOST() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/joke/register")
//				.param("member_id", "boom4")
//				.param("question", "내가 테스트를 하면?")
//				.param("answer", "DB에 두 번째도 잘 들어간다"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}
	
//	@Test
//	public void testRead() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/joke/read")
//				.param("joke_id", "23"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}
	
//	@Test
//	public void testUpdate() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/joke/modify")
//				.param("joke_id", "23")
//				.param("question", "이거 MockMvc로 수정한 거예요?")
//				.param("answer", "네 맞습니다"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}
	
//	@Test
//	public void testDelete() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/joke/remove")
//				.param("joke_id", "22"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}

}
