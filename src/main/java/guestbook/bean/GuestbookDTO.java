package guestbook.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/*
@Getter
@Setter
*/

@Data
public class GuestbookDTO {
	private int seq;
	private String name,email,homepage,subject,content;
	private String logtime;
	
	
}
