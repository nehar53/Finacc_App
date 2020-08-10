import 'package:finacc/UI/forlogin/Welcomepage.dart';
import 'package:finacc/UI/forpartyform/party_screen.dart';

import 'package:finacc/UI/forpurchase/purchase_order.dart';
import 'package:finacc/UI/forsale/salereturn.dart';
import 'package:finacc/UI/Reports/reports.dart';
import 'package:finacc/UI/splash.dart';
import 'package:finacc/UI/forpurchase/purchase_return.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UI/forsale/saleinvoice.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Finacc',
        theme: ThemeData(
          primaryColor: Colors.orange[900],
        ),
        home: SplashScreen()
        // MyHomePage(title: 'DashBoard'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];
  var data2 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];
  var data3 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];

  Material myTextItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myCircularItems(String title, String priceVal, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data2,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.amber[800], Colors.amber[200]],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myTextItems3(String title, String priceVal, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data,
                      lineColor: Color(0xffff6101),
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mychart1Items(String title, String priceVal, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data,
                      lineColor: Color(0xffff6101),
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mychart2Items(String title, String priceVal, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data1,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.amber[800], Colors.amber[200]],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Das',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'h',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'Board',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      //  leading: IconButton(
      //    icon: Icon(Icons.menu),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Hello User!!",
                  style: TextStyle(fontSize: 25.0),
                ),
                accountEmail: Text("testmail@gmail.com",
                    style: TextStyle(fontSize: 20.0)),
                //sizedBox(),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                  'https://picsum.photos/id/237/200/300',
                ) //scale: 150.0),
                    ),
              ),
            ),
            ListTile(
              // subtitle: Icon(Icons.person),
              title: Row(
                children: <Widget>[
                  Icon(Icons.person),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Login / SignUp ")
                ],
              ),
              //Text("All Parties"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => WelcomePage()));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.person_add),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" All Parties ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FormScreen()));
              },
            ),

            // Divider(
            //   height: 10.0,
            //   color: Colors.grey,
            // ),
            /*   ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.list),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Purchase ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ListTile(
                        )));
              },
            ),*/
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.remove_shopping_cart),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Purchase return ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PurchaseScreen()));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.add_shopping_cart),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Purchase Order ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DebitNote()));
              },
            ),
            /*  ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.list),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" DashBoard ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
              },
            ),*/
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.add_shopping_cart),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Sale Invoice ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Sale1Screen()));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.add_to_home_screen),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Sale Return ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SaleScreen()));
              },
            ),

            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.trending_up),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Reports ")
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Reports()));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_balance_wallet),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Expenses ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_balance),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Cash & Bank ")
                ],
              ),
              onTap: () {},
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.settings),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Settings ")
                ],
              ),
              onTap: () {},
            )
          ],
        ),
      ),

      /* onPressed: () {
              //
            }),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.chartLine),
              onPressed: () {
                //
              }),
        ],
      ),*/
      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  mychart1Items("Cash in hand", "421.3M", "+12.9% of target"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  myCircularItems("Stock Value", "68.7M", "+12.9% of target"),
            ),
            /* Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: myTextItems("Mktg. Spend", "48.6M"),
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myTextItems3("Bank Balance", "25.5M", "+19% of target"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mychart2Items("Expenses", "0.9M", "+19% of target"),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(4, 250.0),
            // StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(4, 250.0),
          ],
        ),
      ),
    );
  }
}
