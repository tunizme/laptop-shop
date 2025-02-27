package java_spring_mvc.laptopshop.service.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java_spring_mvc.laptopshop.service.validator.RegisterValidator;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = RegisterValidator.class)
@Target( {ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)

public @interface RegisterChecked {
    String message() default  "Invalid phone number";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}