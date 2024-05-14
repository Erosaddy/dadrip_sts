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
import kr.co.dadrip.service.IReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
@RequiredArgsConstructor
public class ReplyController {
	
	private final IReplyService service;

	// 등록
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO rDto) {
		log.info("rDto : " + rDto);
		
		int insertCount = service.register(rDto);
		
		log.info("Reply insert count : " + insertCount);
		
		return insertCount == 1 
							? new ResponseEntity<>("success", HttpStatus.OK) 
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 조회
//	@GetMapping(value = "/pages/{joke_id}/{page}",
//			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("page") int page, @PathVariable("joke_id") int joke_id) {
//	    Criteria cri = new Criteria(page, 10);
//	    log.info("get reply list joke id : " + joke_id);
//	    log.info("cri : " + cri);
//	
//	    return new ResponseEntity<>(service.getList(cri, joke_id), HttpStatus.OK);
//	}
	
	@GetMapping(value = "/pages/{joke_id}/{page}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("joke_id") int joke_id) {
	    Criteria cri = new Criteria(page, 10);
	    log.info("get reply list by joke_id : " + joke_id);
	    log.info("cri : " + cri);
	
	    return new ResponseEntity<>(service.getListPage(cri, joke_id), HttpStatus.OK);
	}
	
	// 상세
	@GetMapping(value = "/{reply_id}",
	        produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDTO> read(@PathVariable("reply_id") int reply_id) {
	    log.info("reply_id : " + reply_id);

	    return new ResponseEntity<>(service.read(reply_id), HttpStatus.OK);
	}
	
	// 삭제
	@DeleteMapping(value = "/{reply_id}",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("reply_id") int reply_id) {
	    log.info("remove reply_id : " + reply_id);

	    return service.remove(reply_id) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 수정
	@RequestMapping(value = "/{reply_id}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
	        consumes = "application/json",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDTO rDto, @PathVariable("reply_id") int reply_id) {
	    rDto.setReply_id(reply_id);

	    log.info("reply_id : " + reply_id);
	    log.info("modify : " + rDto);

	    return service.modify(rDto) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
