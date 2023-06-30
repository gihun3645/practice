package com.study.practice.domain;

public class User {
    /*
    CREATE TABLE `user`(
    `userId` VARCHAR(30) NOT NULL,
    `userPass` VARCHAR(100) NOT NULL,
    `userName` VARCHAR(30) NOT NULL,
    `reg_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`userId`),
    UNIQUE (`userName`));
    */
    private String userId;
    private String userPass;
    private String userName;
    private String reg_date;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }
}
