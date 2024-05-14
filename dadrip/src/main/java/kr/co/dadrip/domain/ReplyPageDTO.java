package kr.co.dadrip.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	
	private int reply_count;
	private List<ReplyDTO> list;
	
}
