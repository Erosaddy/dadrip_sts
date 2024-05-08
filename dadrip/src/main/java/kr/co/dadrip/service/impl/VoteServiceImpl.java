package kr.co.dadrip.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dadrip.domain.VoteDTO;
import kr.co.dadrip.mapper.ReplyMapper;
import kr.co.dadrip.mapper.VoteMapper;
import kr.co.dadrip.persistence.IJokeDAO;
import kr.co.dadrip.service.IVoteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class VoteServiceImpl implements IVoteService {
	
	private final VoteMapper mapper;

	private final IJokeDAO jDao;

	@Transactional
	@Override
	public int insertVote(VoteDTO vDto) {
		
		try {
			if (vDto.getVote_type().equals("1")) {
				jDao.updateLikeCnt(vDto.getJoke_id(), +1);
			} else {
				jDao.updateDislikeCnt(vDto.getJoke_id(), +1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.insert(vDto);
	}
	
	@Override
	public VoteDTO checkVote(int vote_id) {
	
		return mapper.checkVote(vote_id);
	}
	
	@Transactional
	@Override
	public int deleteVote(int vote_id) {
		// vote_id로 DTO 가져오기
		VoteDTO vDto = mapper.checkVote(vote_id);
		// 좋아요인지 싫어요인지 판별하여 joke 테이블의 해당 컬럼에 1 빼기
		try {
			if (vDto.getVote_type().equals("1")) {
				jDao.updateLikeCnt(vDto.getJoke_id(), -1);
			} else {
				jDao.updateDislikeCnt(vDto.getJoke_id(), -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.delete(vote_id);
	}

	@Transactional
	@Override
	public int modifyVote(VoteDTO vDto) {
		
		try {
			if (vDto.getVote_type().equals("1")) {
				jDao.updateDislikeCnt(vDto.getJoke_id(), -1);
				jDao.updateLikeCnt(vDto.getJoke_id(), +1);
			} else {
				jDao.updateLikeCnt(vDto.getJoke_id(), -1);
				jDao.updateDislikeCnt(vDto.getJoke_id(), +1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.update(vDto);
	}

}
