package test.board.dto;

public class BoardDto {
	// 필드
	private int num;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	// 생성자
	public BoardDto() {}
	// 인자로 필드에 저장할 값을 전달받는 생성자
	public BoardDto(int num, String writer, String title, String content, String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	// 필드의 접근 메소드 setter, getter 메소드
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
