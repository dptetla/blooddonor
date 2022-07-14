package com.example.blooddonor.user;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

import org.springframework.security.core.userdetails.User;

public class CurrentUser extends User{
    private final com.example.blooddonor.user.User user;

    public CurrentUser(String username, String password, Collection<? extends GrantedAuthority> authorities,
            com.example.blooddonor.user.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public com.example.blooddonor.user.User getUser(){
        return user;
    }
}
