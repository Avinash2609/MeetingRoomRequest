package com.problemstatement.Team11.model;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import java.security.Principal;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override

    public void configure(HttpSecurity httpSecurity) throws Exception{
//        do /** instead of /avinash
        httpSecurity
//                .antMatcher("/login/request")
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/","/h2-console/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .oauth2Login();

        httpSecurity
                .logout()
                .logoutSuccessUrl("/exit");
    }
}
