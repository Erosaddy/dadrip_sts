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

import kr.co.dadrip.domain.FavoriteDTO;
import kr.co.dadrip.service.IFavoriteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/favorite")
@Log4j
@RequiredArgsConstructor
public class FavoriteController {

	private final IFavoriteService service;
	
	// 좋아요 / 싫어요 등록
	@PostMapping(value = "/insert",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insert(@RequestBody FavoriteDTO fDto) {
		log.info("fDto : " + fDto);
		
		int insertCount = service.insertFavorite(fDto);
		
		log.info("insert favorite in joke : " + fDto.getJoke_id() + " favorited by : " + fDto.getMember_id());
		
		return insertCount == 1 
							? new ResponseEntity<>("success", HttpStatus.OK) 
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// joke_id와 member_id로 데이터 조회
	@GetMapping(value = "/{joke_id}/{member_id}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<FavoriteDTO> checkFavorite(@PathVariable("joke_id") int joke_id, @PathVariable("member_id") String member_id) {
	    log.info("check joke_id : " + joke_id);
	    log.info("check member_id : " + member_id);
	
	    return new ResponseEntity<>(service.checkFavorite(joke_id, member_id), HttpStatus.OK);
	}
	// 좋아요 / 싫어요 삭제
	@DeleteMapping(value = "/{joke_id}/{member_id}",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("joke_id") int joke_id, @PathVariable("member_id") String member_id) {
		log.info("check joke_id : " + joke_id);
	    log.info("check member_id : " + member_id);
		
	    return service.deleteFavorite(joke_id, member_id) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
