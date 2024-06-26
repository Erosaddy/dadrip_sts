package kr.co.dadrip.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.JokeDTO;
import kr.co.dadrip.persistence.IJokeDAO;
import kr.co.dadrip.service.IJokeService;

@Service
public class JokeServiceImpl implements IJokeService {
	
	private IJokeDAO jDao;

	@Autowired
	public JokeServiceImpl(IJokeDAO jDao) {
		this.jDao = jDao;
	}
	
	@Override
	public void register(JokeDTO jDto) throws Exception {
		jDao.create(jDto);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public JokeDTO read(Integer joke_id) throws Exception {
	    jDao.updateViewCnt(joke_id);
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
	public List<JokeDTO> listAllJokes(Criteria cri) throws Exception {
		return jDao.listAllJokes(cri);
	}
	
	@Override
	public List<JokeDTO> listBestJokes(Criteria cri) throws Exception {
		return jDao.listBestJokes(cri);
	}

	@Override
	public int getTotalCnt(Criteria cri) throws Exception {
	    return jDao.getTotalCnt(cri);
	}

	@Override
	public void updateLikeCnt(Integer joke_id, int amount) throws Exception {
		
	}

	@Override
	public void updateDislikeCnt(Integer joke_id, int amount) throws Exception {
		
	}

}
