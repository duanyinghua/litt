package litt.main.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class Dict implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	private String id;
	
	private int level;
	private String code;
	
	@Column(name = "parent_code")
	private String parentCode;
	
	private String name;
	
	@Column(name = "py_code")
	private String pyCode;
	
	@Column(name = "is_valid")
	private int isValid;
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	@Column(name = "create_time")
	private Date createTime;
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	@Column(name = "last_modify_time")
	private Date lastModifyTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPyCode() {
		return pyCode; 
	}
	public void setPyCode(String pyCode) {
		this.pyCode = pyCode;
	}
	public int getIsValid() {
		return isValid;
	}
	public void setIsValid(int isValid) {
		this.isValid = isValid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
}
