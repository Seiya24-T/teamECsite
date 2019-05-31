package com.internousdev.orion.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;

	//sessionを削除し、ログアウトする
	public String execute(){
		String userId = String.valueOf(session.get("loginUserId"));
		//一度StringにしてからBooleanに切り替える
		boolean idKeeper = Boolean.valueOf(String.valueOf(session.get("idKeeper")));
		//sessionの内容を削除する
		session.clear();
		if(idKeeper){
			//ID保持チェックとログインユーザーIDだけsessionにput
			session.put("idKeeper", idKeeper);
			session.put("savedUserId", userId);
		}
		return SUCCESS;
	}

	public Map<String, Object> getSession(){
		return session;
	}

	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}
