package com.example.blooddonor;

import com.example.blooddonor.user.SpringDataUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecutiryConfig extends WebSecurityConfigurerAdapter {

    //    @Override
//    public void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication()
//                .withUser("user1").password("{noop}user123")
//                .and()
//                .withUser("admin1").password("{noop}admin123");
//    }
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }

    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/login", "/create", "/register").permitAll()
                .antMatchers("/login/**").authenticated()
                .and().formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/login/main")
                .and().logout().logoutSuccessUrl("/login");
    }


}


