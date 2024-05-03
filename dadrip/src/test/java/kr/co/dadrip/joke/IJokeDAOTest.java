package kr.co.dadrip.joke;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.persistence.IJokeDAO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class IJokeDAOTest {
	@Autowired
	private IJokeDAO jDao;
	
//	@Test
//	public void testCreate() throws Exception {
//		JokeDTO jDto = new JokeDTO();
//		jDto.setMember_id("boom");
//		jDto.setQuestion("핫도그가 잠을 설치면?");
//		jDto.setAnswer("통모짜 핫도그");
//		
//		jDao.create(jDto);
//	}
	
//	@Test
//	public void testRead() throws Exception {
//		log.info(jDao.read(15).toString());
//	}
//	
//	@Test
//	public void testUpdate() throws Exception {
//		JokeDTO jDto = new JokeDTO();
//		jDto.setJoke_id(6);
//		jDto.setQuestion("코로스?");
//		jDto.setAnswer("마자용");
//		
//		jDao.update(jDto);
//	}
	
//	@Test
//	public void testDelete() throws Exception {
//		log.info("DELETE COUNT =======> : " + jDao.delete(6));
//	}
	
	@Test
	public void testListCriteria() throws Exception {
	    Criteria cri = new Criteria();

	    // 10개씩 3페이지
	    cri.setPageNum(3);
	    cri.setAmount(10);

	    List<JokeDTO> list = jDao.listAllJokes(cri);

	    list.forEach(joke -> log.info(joke.getJoke_id() + " : " + joke.getJoke_question()));
	}
	
}
