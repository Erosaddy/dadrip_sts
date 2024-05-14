package kr.co.dadrip.mapper;

import java.util.Map;

import kr.co.dadrip.domain.VoteDTO;

public interface VoteMapper {
	
	public int insert(VoteDTO vDto);
	public VoteDTO checkVote(VoteDTO vDto);
	public int delete(VoteDTO vDto);
	public int update(VoteDTO vDto);
	
}
