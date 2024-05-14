package kr.co.dadrip.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)	// 해당 테스트 코드가 스프링을 실행하는 역할을 할 것임을 표시
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	// 해당 테스트에서 스프링 컨텍스트의 설정을 담당할 파일 위치 지정
@Log4j
public class SampleTests {

	@Setter(onMethod_ = { @Autowired })	// 해당 인스턴스 변수가 스프링으로부터 자동으로 주입해 달라는 표시
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
		
		assertNotNull(restaurant);	// restaurant가 null이 아니어야만 테스트가 성공
		
		log.info(restaurant);
		log.info("------------------------");
		log.info(restaurant.getChef());
		
	}
}
