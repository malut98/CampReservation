/*
 * package com.camp.campreservation.Security;
 * 
 * import org.springframework.context.annotation.Bean; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.core.userdetails.UserDetailsService; import
 * org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder; import
 * org.springframework.security.web.SecurityFilterChain;
 * 
 * import lombok.RequiredArgsConstructor;
 * 
 * @EnableWebSecurity
 * 
 * @RequiredArgsConstructor public class LoginSecurity {
 * 
 * @Bean public UserDetailsService userdetailsService() { return new
 * UserDetailsImpl(); }
 * 
 * @Bean public BCryptPasswordEncoder passwordEncoder() { return new
 * BCryptPasswordEncoder(); }
 * 
 * @Bean public SecurityFilterChain filterChain(HttpSecurity http) throws
 * Exception { http .authorizeRequests() .antMatchers("/**").permitAll() //권한페이지
 * .anyRequest() .authenticated(); http .csrf().disable() //csrf 토큰 비활성화
 * .formLogin() //폼로그인 .loginPage("/login") //로그인페이지
 * .loginProcessingUrl("/loginIn") //로그인처리 수행 .usernameParameter("id") //사용자를 찾기
 * 위해 사용할 매개변수 .passwordParameter("password") //사용자의 비밀번호를 찾기위해 사용할 매개변수
 * .defaultSuccessUrl("/index") //로그인 성공 시 이동페이지
 * .failureUrl("/login?fail=true"); //로그인 실패 시 이동페이지
 * 
 * return http.build(); } }
 */
