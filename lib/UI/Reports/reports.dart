import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Reports extends StatefulWidget {
  Reports({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Reports',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _title0() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'Transaction',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _title1() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'Party reports',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _title2() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'GST Reports',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.blueAccent,
        ),
      ),
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

      body: Container(
        child: ListView(
          children: <Widget>[
            _title0(),
            ListTile(
              // subtitle: Icon(Icons.person),
              title: Row(
                children: <Widget>[
                  Icon(Icons.person),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Sale Report ")
                ],
              ),
              //Text("All Parties"),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.person_add),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Purchase Report ")
                ],
              ),
              onTap: () {},
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
                  Text(" Day Book ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.add_shopping_cart),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" All Transaction ")
                ],
              ),
              onTap: () {},
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
                  Text(" Profit & Loss ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.add_to_home_screen),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" CashFlow ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.add_to_home_screen),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Balancesheet ")
                ],
              ),
              onTap: () {},
            ),
            _title1(),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.trending_up),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Party Statement ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_balance_wallet),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" All Parties Report ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_balance_wallet),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" Party Report by item ")
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_balance_wallet),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" State/Purchase by Party ")
                ],
              ),
              onTap: () {},
            ),
            _title2(),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_balance),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(" GSTR 1 ")
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
                  Text(" GSTR 2 ")
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
                  Text(" GSTR 3b ")
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
                  Text(" GSTR Detail Report ")
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
                  Text(" GSTR9 ")
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
    );
  }
}
