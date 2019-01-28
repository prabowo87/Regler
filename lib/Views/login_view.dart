import 'package:flutter/material.dart';

import 'package:flutter_app/CustomWidgets/Common/fancy_button.dart';
import 'package:flutter_app/Models/login_model.dart';
import './User/home_page.dart';
import './Admin/admin_home_view.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "New App",
      home: new HomePage(),
      theme: new ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
          accentColor: Colors.red),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconAniamation;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _userId;
  String _password;

  @override
  void initState() {
    super.initState();

    _iconanimationController = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 5000));

    _iconAniamation = new CurvedAnimation(
        parent: _iconanimationController, curve: Curves.easeInOut);

    _iconAniamation.addListener(() => this.setState(() {}));

    _iconanimationController.forward();
  }



  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      var loginModel = LoginModel(_userId, _password);
      _gotoHome(loginModel.auth());
    }
  }

  void _gotoHome(String role) {
    if (role == 'user') {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => UserMainPage()));
    } else if (role == 'director' || role == 'admin') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AdminHomeView(role)));
    } else {
      final snackbar = new SnackBar(
        content: new Text("Invalid User ID or password"),
        backgroundColor: Colors.red,
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAniamation.value * 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        fontFamily: 'Montserrat',
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.teal, fontSize: 17.0))),
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Your User ID"),
                            validator: (val) {
                              if (val.length > 12 || val.isEmpty) {
                                return 'Invalid UserId';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (val) => _userId = val,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Your Password"),
                            validator: (val) =>
                                val.length < 8 ? 'Password too short' : null,
                            onSaved: (val) => _password = val,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new Padding(
                              padding: const EdgeInsets.only(top: 20.0)),
                          new MaterialButton(
                            height: 40.0,
                            minWidth: 200.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            onPressed: () {
                              _submit();
                            },
                            splashColor: Colors.tealAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FancyButton(
        onPressed: () {},
      ),
    );
  }
}
