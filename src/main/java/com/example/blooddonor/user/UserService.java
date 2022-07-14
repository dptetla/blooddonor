package com.example.blooddonor.user;

public interface UserService {
    User findByEmail(String email);

    User findByUserName(String name);

    void saveUser(User user);
}
