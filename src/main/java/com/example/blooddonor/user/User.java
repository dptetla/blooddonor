package com.example.blooddonor.user;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.Collection;
import java.util.Set;

@Entity
@Getter
@Setter

public class User {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    @Length(min = 3, message = "Użytkownik musi mieć minimum 3 znaki")
    @NotEmpty(message = "Wpisz nazwę użytkownika")
    private String userName;
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @Email
    private String email;
    @Length (min = 4)
    @NotBlank
    private String password;
    private String sex;
    private Long age;
    private String bloodGroup;
    private Double amountOfBlood;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    public User() {
    }

    public User(String username, String password, Collection<? extends GrantedAuthority> authorities) {
    }
}
