package kr.co.dadrip.mapper;

import kr.co.dadrip.domain.VoteDTO;

public interface VoteMapper {
	
	public int insert(VoteDTO vDto);
	public String checkVote(VoteDTO vDto);
	public int delete(VoteDTO vDto);
	
}
