package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/*
 * 
 */
public class EncodingFilter implements Filter {
	// 인코딩 정보를 저장할 필드 선언
	private String encoding;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	// 필터가 동작해야 할 때 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 1. 요청 인코딩이 설정되지 않았다면
		if(request.getCharacterEncoding()==null) {
			// 2. 인코딩 설정하기
			request.setCharacterEncoding(encoding);
		}
		// 3. 요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
	}
	// 필터가 최초 사용될 때 1번 호출되는 메소드
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// web.xml 문서에 있는 내용을 읽어서 필드에 저장한다
		encoding=filterConfig.getInitParameter("encoding");
	}
}
