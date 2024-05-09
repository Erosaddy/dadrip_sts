package kr.co.dadrip;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.ReplyDTO;
import kr.co.dadrip.domain.ReplyPageDTO;
import kr.co.dadrip.domain.VoteDTO;
import kr.co.dadrip.service.IVoteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/vote")
@Log4j
@RequiredArgsConstructor
public class VoteController {

	private final IVoteService service;
	
	// 좋아요 / 싫어요 등록
	@PostMapping(value = "/insert",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insert(@RequestBody VoteDTO vDto) {
		log.info("vDto : " + vDto);
		
		int insertCount = service.insertVote(vDto);
		
		log.info("insert vote in joke : " + vDto.getJoke_id() + " voted by : " + vDto.getMember_id());
		
		return insertCount == 1 
							? new ResponseEntity<>("success", HttpStatus.OK) 
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// vote_id로 데이터 조회
	@GetMapping(value = "/{vote_id}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<VoteDTO> selectVote(@PathVariable("vote_id") int vote_id) {
	    log.info("check vote_id : " + vote_id);
	
	    return new ResponseEntity<>(service.selectVote(vote_id), HttpStatus.OK);
	}
	
	// joke_id와 member_id로 데이터 조회
	@GetMapping(value = "/{joke_id}/{member_id}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<VoteDTO> checkVote(@PathVariable("joke_id") String joke_id, @PathVariable("member_id") String member_id) {
	    log.info("check joke_id : " + joke_id);
	    log.info("check member_id : " + member_id);
	
	    return new ResponseEntity<>(service.checkVote(joke_id, member_id), HttpStatus.OK);
	}
	// 좋아요 / 싫어요 삭제
	@DeleteMapping(value = "/{vote_id}",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("vote_id") int vote_id) {
		log.info("remove vote_id : " + vote_id);
		
	    return service.deleteVote(vote_id) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 좋아요 / 싫어요 수정
	@RequestMapping(value = "/{vote_id}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
	        consumes = "application/json",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody VoteDTO vDto, @PathVariable("vote_id") int vote_id) {
		vDto.setVote_id(vote_id);

	    log.info("reply_id : " + vote_id);
	    log.info("modify : " + vDto);

	    return service.modifyVote(vDto) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
