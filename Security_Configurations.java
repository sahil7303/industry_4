@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) {
        return http
            .csrf().disable()
            .authorizeRequests()
                .antMatchers("/api/v1/public/**").permitAll()
                .antMatchers("/api/v1/supplier/**").hasRole("SUPPLIER")
                .antMatchers("/api/v1/oem/**").hasRole("OEM")
                .antMatchers("/api/v1/retailer/**").hasRole("RETAILER")
                .anyRequest().authenticated()
            .and()
            .oauth2ResourceServer()
                .jwt()
            .and()
            .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            .and()
            .build();
    }
    
    @Bean
    public JwtDecoder jwtDecoder() {
        return NimbusJwtDecoder.withJwkSetUri(jwkSetUri).build();
    }
}

