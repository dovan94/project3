package servlet;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author VanDo
 */
public class UserBean {
    private String username;
    private String password;
    private boolean loggedin;
    
    public UserBean() {
        username = "";
        password = "";
        loggedin = false;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsername() {
        return username;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean isLoggedin() {
        return loggedin;
    }
    
    public boolean checkPassword(String username, String newPassword) {
        String password = "password";
        if (password.equals(newPassword)) {
            loggedin = true;
            setUsername(username);
            return true;
        }
        return false;
    }
    
}
