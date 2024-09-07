package by.vdavdov.jnet;

import org.springframework.boot.SpringApplication;

public class TestJnetApplication {

    public static void main(String[] args) {
        SpringApplication.from(JnetApplication::main).with(TestcontainersConfiguration.class).run(args);
    }

}
