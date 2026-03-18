package com.example.tea_app.tea_app.Controller;

import lombok.Data;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Data
@Controller
public class TeaController {
    @GetMapping
    public String tea(){
        return "tea";
    }
}
