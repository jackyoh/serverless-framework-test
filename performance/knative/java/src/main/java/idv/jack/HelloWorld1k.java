package idv.jack;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class HelloWorld1k {
    @RestController
    class ColdStartController1k {
        @GetMapping("/hello1k")
        String hello() {
            return "Hello Java, For the cold start test.";
        }
    }

    /*public static void main(String[] args) {
        System.out.println("Hello Java, For the cold start test.");
        System.out.println("Hello Java, For the cold start test.");
        System.out.println("Hello Java, For the cold start test.");
        System.out.println("Hello Java, For the cold start test.");
        System.out.println("Hello Java, For the cold start test.");
        System.out.println("Hello Java, For the cold start test.");
        SpringApplication.run(HelloWorld1k.class, args);
    }*/
}
