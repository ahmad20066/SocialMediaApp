import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/register_service.dart';

class RegisterController {
  var userName;
  var email;
  var password;
  var passwordConfirmation;
  var message;
  bool signUpStatus = false;
  RegisterService service = RegisterService();
  Future register() async {
    signUpStatus = await service.register(userName, email, password);
    message = service.message;
  }
}
