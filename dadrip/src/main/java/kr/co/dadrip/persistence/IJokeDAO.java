package kr.co.dadrip.persistence;

import java.util.List;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.JokeDTO;

public interface IJokeDAO {

	public void create(JokeDTO jDto) throws Exception;
	public JokeDTO read(Integer joke_id) throws Exception;
	public int update(JokeDTO jDto) throws Exception;
	public int delete(Integer joke_id) throws Exception;
	public List<JokeDTO> listAllJokes(Criteria cri) throws Exception;
	public int getTotalCnt(Criteria cri) throws Exception;
}
