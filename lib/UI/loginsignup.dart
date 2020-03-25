import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:otroo/UI/getmore.dart';
import 'package:otroo/UI/main_ui.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    const padding = 25.0;
    if (this.isLoggedIn == true)
      return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Hi, Youssouf!'),
        ),
        body: Container(
          child: Text(
            'Welcome Back here you will see all of your Bookings',
            style: TextStyle(fontSize: 25),
          ),
        ),
        bottomNavigationBar: _bottomNavBar(context),
      );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(),
        title: Text('Authenitification'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: padding),
//                AppleSignInButton(onPressed: () {}),
//                AppleSignInButton(
//                    onPressed: () {}, style: AppleButtonStyle.whiteOutline),
                Container(
                  width: double.infinity,
                  child: AppleSignInButton(
                      onPressed: () {}, style: AppleButtonStyle.black),
                ),
                SizedBox(height: padding),
//                GoogleSignInButton(onPressed: () {}),
                Container(
                    width: double.infinity,
                    child:
                        GoogleSignInButton(onPressed: () {}, darkMode: true)),
                SizedBox(height: padding),
                Container(
                  width: double.infinity,
                  child: FacebookSignInButton(onPressed: () async {
                    final facebookLogin = FacebookLogin();
                    final result =
                        await facebookLogin.logInWithReadPermissions(['email']);

                    switch (result.status) {
                      case FacebookLoginStatus.loggedIn:
                        print(result.accessToken.token);
                        onLoginStatusChanged(true);
                        //TODO: Send the token to sever and save user informations as well
//                      _sendTokenToServer(result.accessToken.token);
//                      _showLoggedInUI();
                        break;
                      case FacebookLoginStatus.cancelledByUser:
                        print('Cancelled');
//                      _showCancelledMessage();
                        break;
                      case FacebookLoginStatus.error:
                        print(result.errorMessage);
//                      _showErrorOnUI(result.errorMessage);
                        break;
                    }
                  }),
                ),
//                SizedBox(height: padding),
//                TwitterSignInButton(onPressed: () {}),
//                SizedBox(height: padding),
//                MicrosoftSignInButton(onPressed: () {}),
//                MicrosoftSignInButton(onPressed: () {}, darkMode: true),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  Widget _bottomNavBar(BuildContext context) {
    return BottomAppBar(
      notchMargin: 4,
      shape: AutomaticNotchedShape(RoundedRectangleBorder(),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    //TODO: ADD REDIRECT TO THE SEARCH PAGE
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainUI()),
                    );
                  },
                ),
//                Text('Search'),
              ],
            ),
            IconButton(
              icon: Icon(Icons.business_center),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                //TODO: ADD REDIRECT TO THE ACCOUNT PAGE
//                Navigator.of(context).pushNamed();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignup()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                //TODO: ADD REDIRECT TO THE MORE INFORMATIONS PAGES
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetMore()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
