package Com.IFI.InternalTool;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
@ComponentScan({ "Com.IFI.InternalTool.Config"})
@Configuration("Com.IFI.InternalTool.DAO")
@SpringBootApplication
public class IfiToolService1Application {

	public static void main(String[] args) {
		SpringApplication.run(IfiToolService1Application.class, args);
	}
}
