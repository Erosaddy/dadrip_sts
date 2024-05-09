package kr.co.dadrip.mapper;

import java.util.Map;

import kr.co.dadrip.domain.VoteDTO;

public interface VoteMapper {
	
	public int insert(VoteDTO vDto);
	public VoteDTO selectVote(int vote_id);
	public VoteDTO checkVote(Map<String, Object> paramMap);
	public int delete(int vote_id);
	public int update(VoteDTO vDto);
	
}
