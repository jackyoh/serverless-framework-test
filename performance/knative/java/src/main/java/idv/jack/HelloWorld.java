package idv.jack;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@SpringBootApplication
public class HelloWorld {
    @RestController
    class ColdStartController {
        @GetMapping("/")
        String hello() {
            /*int total = 0;
            for (int i = 0; i <= 5000; i++) {
                total = 0;
                for (int j = 0; j <= 100000; j++) {
                    total = total + j;
                }
            }
            return "Hello Java, value is " + total;*/
            return "Hello Java, For the cold start test.";
        }
    }

    public static void main(String[] args) {
        SpringApplication.run(HelloWorld.class, args);
    }
}
