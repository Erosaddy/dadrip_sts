package kr.co.dadrip.member;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import kr.co.dadrip.joke.JokeControllerTest;
import kr.co.dadrip.service.IMemberService;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTest {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	 private MockHttpSession session;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		this.session = new MockHttpSession();
	}
	
//	@Test
//	public void testSignup() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/signup")
//				.param("member_id", "abcMartMan142536")
//				.param("nickname", "SuperMutant")
//				.param("member_pw", "970413123AZD#")
//				.param("email", "abcMart@gmail.com")
//				.param("birthday", "1977/12/25")
//				.param("sex", "2"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}
	
//	@Test
//	public void testMypage() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/mypage")
//				.param("member_id", "boomer"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}
	
//	@Test
//	public void testUpdate() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/mypage/modify")
//				.param("member_id", "zxz7648")
//				.param("nickname", "Leakage")
//				.param("member_pw", "Changed123!")
//				.param("birthday", "1996/12/31")
//				.param("sex", "1"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}
	
//	@Test
//	public void testDelete() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/joke/remove")
//				.param("joke_id", "43"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info("resultpage : " + resultPage);
//	}

}





