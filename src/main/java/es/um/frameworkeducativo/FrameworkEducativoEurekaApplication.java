package es.um.frameworkeducativo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class FrameworkEducativoEurekaApplication {

    public static void main(String[] args) {
        SpringApplication.run(FrameworkEducativoEurekaApplication.class, args);
    }

}
