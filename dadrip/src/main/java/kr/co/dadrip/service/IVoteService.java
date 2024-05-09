package kr.co.dadrip.service;

import kr.co.dadrip.domain.VoteDTO;

public interface IVoteService {

	public int insertVote(VoteDTO vDto);
	public VoteDTO selectVote(int vote_id);
	public VoteDTO checkVote(String joke_id, String member_id);
	public int deleteVote(int vote_id);
	public int modifyVote(VoteDTO vDto);
	
}
