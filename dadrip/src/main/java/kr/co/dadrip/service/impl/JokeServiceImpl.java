package kr.co.dadrip.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.persistence.IJokeDAO;
import kr.co.dadrip.service.IJokeService;

@Service
public class JokeServiceImpl implements IJokeService {
	@Autowired
	private IJokeDAO jDao;

	@Override
	public void register(JokeDTO jDto) throws Exception {
		jDao.create(jDto);
	}

	@Override
	public JokeDTO read(Integer joke_id) throws Exception {
		return jDao.read(joke_id);
	}

	@Override
	public boolean update(JokeDTO jDto) throws Exception {
		return jDao.update(jDto) == 1;
	}

	@Override
	public boolean delete(Integer joke_id) throws Exception {
		return jDao.delete(joke_id) == 1;
	}

	@Override
	public List<JokeDTO> listAllJokes() throws Exception {
		return jDao.listAllJokes();
	}
	

}
