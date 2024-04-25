package kr.co.dadrip;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MockMvcTest {

	private static final Logger log =
			LoggerFactory.getLogger(MockMvcTest.class);
	
	@Autowired	// 자동 의존성 주입
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void test() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.get("/sample/ex04")
						.param("name", "홍길동")
						.param("age", "25")
						.param("page", "75"))
						.andReturn().getModelAndView().getViewName();
		log.info("resultPage : " + resultPage);
	}

}
