import 'package:flutter/material.dart';
import 'package:otroo/UI/loginsignup.dart';
import 'package:otroo/UI/main_ui.dart';

class GetMore extends StatefulWidget {
  @override
  _GetMoreState createState() => _GetMoreState();
}

class _GetMoreState extends State<GetMore> {
  double _height = 1000;
  double _width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: 0.75,
              child: Container(
                height: _height / 6,
                padding: EdgeInsets.only(top: _height / 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange[200], Colors.pinkAccent],
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.black,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  title: Text("FlutterDevs"),
                  subtitle: Text(
                    "flutterDevs@aeologic.com",
                    style: TextStyle(fontSize: 13),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Orders & Payments"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
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
