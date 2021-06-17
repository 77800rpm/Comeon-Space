package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Encoder;

public class SignUpWrapper {
	public SignUpWrapper() {}
	
	public String wrapper(String name) {
		
		String value = null;
		
		if(name != null) {
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				
				byte[] bytes = name.getBytes(Charset.forName("UTF-8"));
				
				md.update(bytes);
				
				Encoder encoder = Base64.getEncoder();
				value = encoder.encodeToString(md.digest());
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		
		return value;
	}
		
	
}
