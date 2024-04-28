package days05;

import java.beans.JavaBean;
import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@JavaBean
@Getter
@Setter
public class MemberInfo implements Serializable {
    
	private static final long serialVersionUID = -593258631417395082L;
	private String id;
	private String password;
	private String name;
	private Date registerDate;
	private String email;
	
}
