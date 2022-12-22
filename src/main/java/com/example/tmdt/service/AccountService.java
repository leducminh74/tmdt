package com.example.tmdt.service;

import com.example.tmdt.beans.Account;
import com.example.tmdt.dao.AccountDao;


public class AccountService {
    private static  AccountService instance;

    private AccountService(){
    }

    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }

    public Account getAccountById(String a_id){
        return AccountDao.getInstance().getAccountById(a_id);
    }

    public Account login(String user, String pass){
        return AccountDao.getInstance().login(user, pass);
    }

    public Account checkUserExist(String user){
        return AccountDao.getInstance().checkUserExist(user);
    }

    public Account checkEmailExist(String email){
        return AccountDao.getInstance().checkEmailExist(email);
    }

    public void register(String user, String pass, String email,String phoneNumber){
         AccountDao.getInstance().register(user, pass, email,phoneNumber);
    }

    public void toSeller(int uId){
        AccountDao.getInstance().toSeller(uId);
    }

    public void changePassword(Account a, String newPass){
        AccountDao.getInstance().changePassword(a,newPass);
    }

    public boolean checkPasswordCorrect(Account a, String password){
        return AccountDao.getInstance().checkPasswordCorrect(a,password);
    }

    public Account activeAccount(String email, String hashPass){
         return AccountDao.getInstance().activeAccount(email, hashPass);
    }
}
