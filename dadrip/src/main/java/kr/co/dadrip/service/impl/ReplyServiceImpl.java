package kr.co.dadrip.service.impl;

import java.util.List;

import org.springframework.jdbc.object.RdbmsOperation;
import org.springframework.stereotype.Service;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.ReplyDTO;
import kr.co.dadrip.domain.ReplyPageDTO;
import kr.co.dadrip.mapper.ReplyMapper;
import kr.co.dadrip.service.IReplyService;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class ReplyServiceImpl implements IReplyService{

	private final ReplyMapper mapper;
	
	@Override
	public int register(ReplyDTO rDto) {
		log.info("reply register .................." + rDto);
		
		return mapper.insert(rDto);
		
	}

	@Override
	public ReplyDTO read(int reply_id) {
		log.info(reply_id);
		
		return mapper.read(reply_id);
	}

	@Override
	public int modify(ReplyDTO rDto) {
		log.info("reply modify .................." + rDto);
		
		return mapper.update(rDto);
	}

	@Override
	public int remove(int reply_id) {
		log.info("reply remove .................." + reply_id);
		
		return mapper.delete(reply_id);
	}

	@Override
	public List<ReplyDTO> getList(Criteria cri, int joke_id) {
		log.info(joke_id);
		
		return mapper.getAllRepliesWithPaging(cri, joke_id);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int joke_id) {

	    return new ReplyPageDTO(
	            mapper.getCountByJokeId(joke_id),
	            mapper.getAllRepliesWithPaging(cri, joke_id));
	}

}
