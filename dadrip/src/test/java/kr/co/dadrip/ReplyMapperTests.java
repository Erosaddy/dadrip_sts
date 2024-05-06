package kr.co.dadrip;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.ReplyDTO;
import kr.co.dadrip.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = { @Autowired })
	private ReplyMapper mapper;
	
//	@Test
//	public void test() {
//		log.info("mapper =======> " + mapper.getTime2());
//	}
	
	private int[] joke_idArr = {786550, 786549, 786548, 786547, 786546};

//	@Test
//	public void testInsert() {
//	    IntStream.rangeClosed(1, 10).forEach(i -> {
//	        ReplyDTO rDto = new ReplyDTO();
//
//	        rDto.setMember_id("zxz7648");
//	        rDto.setJoke_id(reply_idArr[i%5]);
//	        rDto.setContent("댓글 테스트" + i);
//
//	        mapper.insert(rDto);
//	    });
//
//	}

//	@Test
//	public void testRead() {
//	    int targetRno = 10;
//
//	    ReplyDTO rDto = mapper.read(targetRno);
//
//	    log.info(rDto);
//	}
	
//	@Test
//	public void testDelete() {
//		
//		int reply_id = 13;
//		
//		mapper.delete(reply_id);
//	}
	
//	@Test
//	public void testUpdate() {
//	    int targetRno = 12;
//
//	    ReplyDTO rDto = mapper.read(targetRno);
//	    rDto.setContent("댓글 수정테스트");
//
//	    int result = mapper.update(rDto);
//
//	    if (result > 0) {
//	        log.info("정상적으로 수정이 되었습니다.");
//	    } else {
//	        log.info("데이터 수정에 실패하였습니다.");
//	    }
//	}
	
	@Test
	public void testList() {
	    Criteria cri = new Criteria();
	    List<ReplyDTO> replies = mapper.getAllRepliesWithPaging(cri, joke_idArr[1]);

	    replies.forEach(reply -> log.info(reply));
	}
	
}
