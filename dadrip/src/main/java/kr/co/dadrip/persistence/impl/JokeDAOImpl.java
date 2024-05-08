package kr.co.dadrip.persistence.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.persistence.IJokeDAO;

@Repository
public class JokeDAOImpl implements IJokeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void create(JokeDTO jDto) throws Exception {
		sqlSession.insert("JokeMapper.create", jDto);
	}

	@Override
	public JokeDTO read(Integer joke_id) throws Exception {
		return sqlSession.selectOne("JokeMapper.read", joke_id);
	}

	@Override
	public int update(JokeDTO jDto) throws Exception {
		return sqlSession.update("JokeMapper.update", jDto);
	}

	@Override
	public int delete(Integer joke_id) throws Exception {
		return sqlSession.delete("JokeMapper.delete", joke_id);
	}

	@Override
	public List<JokeDTO> listAllJokes(Criteria cri) throws Exception {
		return sqlSession.selectList("JokeMapper.listAllJokesWithPaging", cri);
	}

	@Override
	public int getTotalCnt(Criteria cri) throws Exception {
	    return sqlSession.selectOne("JokeMapper.getTotalCnt", cri);
	}
	
	@Override
	public void updateViewCnt(Integer joke_id) throws Exception {
		sqlSession.update("JokeMapper.updateViewCnt", joke_id);
	}

	@Override
	public void updateReplyCnt(Integer joke_id, int amount) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("joke_id", joke_id);
	    paramMap.put("amount", amount);

	    sqlSession.update("JokeMapper.updateReplyCnt", paramMap);
	}

	@Override
	public void updateLikeCnt(Integer joke_id, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("joke_id", joke_id);
	    paramMap.put("amount", amount);

	    sqlSession.update("JokeMapper.updateLikeCnt", paramMap);
	}

	@Override
	public void updateDislikeCnt(Integer joke_id, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("joke_id", joke_id);
	    paramMap.put("amount", amount);

	    sqlSession.update("JokeMapper.updateDislikeCnt", paramMap);		
	}
	
}
