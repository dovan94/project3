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
    private boolean loggedin;
    
    public UserBean() {
        username = "";
        loggedin = false;
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
    
    public boolean validateUser(String username, String newPassword) {
        String password = "password";
        if (password.equals(newPassword)) {
            loggedin = true;
            setUsername(username);
            return true;
        }
        return false;
    }
    
}
