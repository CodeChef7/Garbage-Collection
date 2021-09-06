import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';
import '../controllers/user_controller.dart';

class ForgotPasswordWidget extends StatefulWidget {
  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends StateMVC<ForgotPasswordWidget> {
  UserController _con;
  _ForgotPasswordWidgetState() : super(UserController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    //first run page
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: config.App(context).appVerticalPadding(20),
            child: Container(
              width: config.App(context).appHorizontalPadding(84),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Forgot password?",
                    style: Theme.of(context).textTheme.headline5.merge(
                        TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please enter your e-mail & phone number",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .merge(TextStyle(color: Colors.grey[700])),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appVerticalPadding(35),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(40),
              width: config.App(context).appHorizontalPadding(85),
              child: Form(
                key: _con.loginFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                        onSaved: (input) => _con.user.phone = input,
                        validator: (input) => input.length < 10
                            ? "Phone number should be more than 10 digits."
                            : null,
                        decoration: InputDecoration(
                          // hintText: "‎+8618411632866",
                          labelText: "Phone Number",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                          contentPadding: EdgeInsets.all(6),
                          // prefixIcon: Icon(
                          //   Icons.contact_phone_outlined,
                          //   size: 30,
                          //   color: Theme.of(context).primaryColor,
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => _con.user.email = input,
                        style: TextStyle(fontSize: 20),
                        validator: (input) => !input.contains('@')
                            ? "Should be a valid email"
                            : null,
                        decoration: InputDecoration(
                          // hintText: "Johns@gmail.com",
                          labelText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                          contentPadding: EdgeInsets.all(6),
                          // prefixIcon: Icon(
                          //   Icons.lock_outlined,
                          //   size: 30,
                          //   color: Theme.of(context).primaryColor,
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: config.App(context).appHorizontalPadding(50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withAlpha(200),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Send",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _con.forgotPasswordSend();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}