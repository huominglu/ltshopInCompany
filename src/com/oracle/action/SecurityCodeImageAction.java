package com.oracle.action;

import java.io.ByteArrayInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.oracle.util.SecurityCode;
import com.oracle.util.SecurityImage;

@ParentPackage("struts-default")
@Namespace("/")
@Controller
public class SecurityCodeImageAction  implements SessionAware{
	
	private String rondcode;
	public String getRondcode() {
		return rondcode;
	}
	public void setRondcode(String rondcode) {
		this.rondcode = rondcode;
	}

	//图片流
    private ByteArrayInputStream imageStream;
    //session域 
    private Map<String, Object> session ;
    
    public ByteArrayInputStream getImageStream() {
        return imageStream;
    }
    public void setImageStream(ByteArrayInputStream imageStream) {
        this.imageStream = imageStream;
    }
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    
    @Action(value="/securitycode",results={@Result(name="success",type="stream",params={"contentType","image/jpeg","inputName","imageStream"})})
    public String code() throws Exception{        
        //获取默认难度和长度的验证码
        String securityCode = SecurityCode.getSecurityCode();
        imageStream = SecurityImage.getImageAsInputStream(securityCode);
        //放入session中
        session.put("securityCode", securityCode);
        return "success";
    }
    
    
}
