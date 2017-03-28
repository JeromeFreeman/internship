package org.library.filter;

import javax.servlet.*;
import java.io.IOException;

public class LanguageFilter implements Filter {

	String Encoding=null;

	public void destroy() { 
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(Encoding==null){
			Encoding  = "utf-8";
		}
		request.setCharacterEncoding(Encoding);
		response.setCharacterEncoding(Encoding);
		response.setContentType("text/html;charset="+Encoding);
		
		 chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException { 
		Encoding = config.getInitParameter("encoding");
	}
	
 



}
