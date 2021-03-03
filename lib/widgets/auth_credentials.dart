// 1
abstract class AuthCredentials {
  final String number;
  final String password;

  AuthCredentials({this.number, this.password});
}

// 2
class LoginCredentials extends AuthCredentials {
  LoginCredentials({String number, String password})
      : super(number: number, password: password);
}

// 3
class SignUpCredentials extends AuthCredentials {

  final String email;
  
  
 
  SignUpCredentials({String number, String password, this.email})
      : super(number: number, password: password);

}