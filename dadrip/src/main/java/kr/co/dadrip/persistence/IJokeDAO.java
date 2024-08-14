package kr.co.dadrip.persistence;

import java.util.List;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.domain.VoteDTO;

public interface IJokeDAO {

	public void create(JokeDTO jDto) throws Exception;
	public JokeDTO read(Integer joke_id) throws Exception;
	public int update(JokeDTO jDto) throws Exception;
	public int delete(Integer joke_id) throws Exception;
	public List<JokeDTO> listAllJokes(Criteria cri) throws Exception;
	public List<JokeDTO> listBestJokes(Criteria cri) throws Exception;
	public List<JokeDTO> listBestJokesV2(Criteria cri) throws Exception;
	public int getTotalCnt(Criteria cri) throws Exception;
	
	public void updateViewCnt(Integer joke_id) throws Exception;
	public void updateReplyCnt(Integer joke_id, int amount) throws Exception;
	
	public void updateLikeCnt(Integer joke_id, int amount) throws Exception;
	public void updateDislikeCnt(Integer joke_id, int amount) throws Exception;
}
