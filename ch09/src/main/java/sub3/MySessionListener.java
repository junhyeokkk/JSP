package sub3;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

@WebListener
public class MySessionListener implements HttpSessionAttributeListener{
	
	int count = 0;
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// session setAttribute할때
		System.out.println("attributeAdded ...");
		
		count ++;
		System.out.println("현재 로그인 총 사용자 : "+ count);
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// session invalidate할때
		System.out.println("attributeRemoved ...");
	
		count --;
		System.out.println("현재 로그인 총 사용자 : "+ count);
	
	}
}
