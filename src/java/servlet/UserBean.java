/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

/**
 *
 * @author VanDo
 */
public class UserBean {
    private Integer id;
    private String username;
    private boolean loggedin;
    
    public UserBean() {
        id = 0;
        username = "";
        loggedin = false;
    }
    
    public void setId(Integer id) {
        this.id = id;
    } 
    public Integer getId() {
        return id;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsername() {
        return username;
    }
    
    public void setLoggedIn(boolean status) {
        loggedin = status;
    }
    public boolean isLoggedin() {
        return loggedin;
    }
    
}
