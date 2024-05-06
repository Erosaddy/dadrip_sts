package kr.co.dadrip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.ReplyDTO;

public interface ReplyMapper {
	
	public String getTime2();
	public int insert(ReplyDTO rDto);
	public ReplyDTO read(int reply_id);
	public int update(ReplyDTO rDto);
	public int delete(int reply_id);
	public List<ReplyDTO> getAllRepliesWithPaging(
			@Param("cri") Criteria cri,
			@Param("joke_id") int joke_id);
	public int getCountByJokeId(int joke_id);
}
