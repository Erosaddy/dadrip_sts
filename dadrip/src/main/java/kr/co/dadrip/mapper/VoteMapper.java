package kr.co.dadrip.mapper;

import kr.co.dadrip.domain.VoteDTO;

public interface VoteMapper {
	
	public int insert(VoteDTO vDto);
	public VoteDTO checkVote(int vote_id);
	public int delete(int vote_id);
	public int update(VoteDTO vDto);
	
}
