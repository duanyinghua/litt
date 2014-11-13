package litt.main.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class User{
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	private String id;
	
	@Column(name = "login_name")
	private String loginName;
	
	private String password;
	
	@Column(name = "true_name")
	private String trueName;
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	private Date birthday;
	private String phone;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}	
	
	public String getLoginName() {
		return loginName;
	}
	
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	public String getTrueName() {
		return trueName;
	}
	
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}
	
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
