import 'package:flutter/material.dart';

import 'auth_credentials.dart';
class LoginPage extends StatefulWidget{

  final ValueChanged<LoginCredentials> didProvideCredentials;

  final VoidCallback shouldShowSignUp;

 LoginPage({Key key,this.didProvideCredentials, this.shouldShowSignUp}) : super(key: key);

@override 
State<StatefulWidget> createState() =>_LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final _numberController =TextEditingController();
  final _passwordController =TextEditingController();

  
  @override 

  Widget build(BuildContext context) {
    //2
    return Scaffold(
      //3
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal:40),
        //4
        child :Stack(children: [
          //Login form  
          _loginForm(),

          //6 SignUp Button 
          Container(
            alignment:Alignment.bottomCenter,
            child:FlatButton(
              //onPressed:() {},
              onPressed: widget.shouldShowSignUp,
              child:Text('Don\t have an account ?SignUp')),
          )
          ]
        )
      ),
    );
    
  }

  Widget _loginForm () {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        TextField(
          controller:_numberController,
          decoration: 
          InputDecoration(icon: Icon(Icons.mail),labelText: 'phonenumber'),
        ),
         TextField(
          controller:_passwordController,
          decoration: 
          InputDecoration(icon: Icon(Icons.lock_open),labelText: 'Password'),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),

        FlatButton(
          onPressed: _login,
          child: Text('Login'),
          color: Theme.of(context).accentColor)
      ],
    );
  }
  void _login() {
    final number=_numberController.text.trim();
    final password=_passwordController.text.trim();

    print('number:$number');
    print('password:$password');

    final credentials =
    LoginCredentials(number: number, password: password);
    widget.didProvideCredentials(credentials);

  }

}