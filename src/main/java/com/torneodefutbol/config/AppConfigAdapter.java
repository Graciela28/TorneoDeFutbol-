package com.torneodefutbol.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
/**
 * Created by Usuario on 09/01/2018.
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.torneodefutbol")
public class AppConfigAdapter extends WebMvcConfigurerAdapter {

}
