package cloud.xiguapi.haw;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class HawApplication {

    public static void main(String[] args) {
        SpringApplication.run(HawApplication.class, args);
    }
}
