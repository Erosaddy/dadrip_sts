package kr.co.dadrip.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TodoDTO {
	private String vacuum;
	private String mopping;
	private String toiletClean;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dueDate;
}
