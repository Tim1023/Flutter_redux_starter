import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/modules/auth/store/actions.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Key _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showEmailInput(),
              _showPasswordInput(),
              _showErrorMessage(),
              _showPrimaryButton(),
            ],
          ),
        )
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
              hintText: 'Email',
              icon: Icon(
                Icons.mail,
                color: Colors.grey,
              )),
          validator: (String value) => value.isEmpty ? 'Email can\'t be empty' : null,
          controller: _emailController
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (String value) => value.isEmpty ? 'Password can\'t be empty' : null,
        controller: _passwordController,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: StoreConnector<AppState, OnLoginCallback>(
            converter: (Store<AppState> store) {
              return (String email, String password) {
                store.dispatch(UserLoginRequest(
                  email: email,
                  password: password,
                ));
              };
            },
            builder: (BuildContext context, OnLoginCallback onLogin) {
              return RaisedButton(
                elevation: 8.0,
                child: Text('Login'),
                onPressed: () {
                  onLogin(_emailController.text, _passwordController.text);
                },
              );
            }
        )
    );
  }

  Widget _showErrorMessage() {
    return StoreConnector<AppState, String>(
        converter: (Store<AppState> store) => store.state.authState.error,
        builder: (BuildContext context, String error) {
          if (error != null) {
            return Text(
              error,
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.red,
                  height: 1.0,
                  fontWeight: FontWeight.w300),
            );
          } else {
            return Container();
          }
        }
    );
  }
}

typedef OnLoginCallback = Function(String email, String password);