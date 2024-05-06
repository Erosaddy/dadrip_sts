package kr.co.dadrip.service;

import java.util.List;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.ReplyDTO;
import kr.co.dadrip.domain.ReplyPageDTO;

public interface IReplyService {
	
	public int register(ReplyDTO rDto);
	public ReplyDTO read(int rno);
	public int modify(ReplyDTO rDto);
	public int remove(int rno);
	public List<ReplyDTO> getList(Criteria cri, int joke_id);
	public ReplyPageDTO getListPage(Criteria cri, int joke_id);
}
