package kr.co.dadrip.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<JokeDTO> listAllJokes() throws Exception {
		return sqlSession.selectList("JokeMapper.listAllJokes");
	}

}
