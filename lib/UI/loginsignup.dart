import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:otroo/UI/getmore.dart';
import 'package:otroo/UI/main_ui.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    const padding = 25.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Authenitification'),
      ),
      body: Container(
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
                AppleSignInButton(
                    onPressed: () {}, style: AppleButtonStyle.black),
                SizedBox(height: padding),
//                GoogleSignInButton(onPressed: () {}),
                GoogleSignInButton(onPressed: () {}, darkMode: true),
                SizedBox(height: padding),
                FacebookSignInButton(onPressed: () {}),
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
                Navigator.push(
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
