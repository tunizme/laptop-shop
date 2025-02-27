package java_spring_mvc.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import java_spring_mvc.laptopshop.domain.dto.RegisterDTO;
import java_spring_mvc.laptopshop.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }



    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean isValid = true;

        if(!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords do not match!")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }

        if(userService.checkUserExists(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email address already in use!")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }

        return isValid;
    }
}
