//import 'package:finacc/UI/forpartyform/tab.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  Future<void> getApiResults() async {
    var url = "http://164.52.197.189:8181/fdb/finacc/gendata/query";
    Map<String, dynamic> tempMap = {
      "select": ["*"],
      "from": "partyMst"
    };
    var query = json.encode(tempMap);
    var resp = await http.post(url, body: query);
    var res = json.decode(resp.body.toString());
    for (var Party in res) {
      var newParty = Party();

      newParty.partyMobileNo = Party["PartyMst/partyMobileNo"].toInt();

      newParty.partyName = Party["PartyMst/partyName"].toString();
      newParty.partyType = Party["PartyMst/partyType"].toString();
      // newParty.partyName = Party["PartyMst/partyName"].toString();
      newParty.partyEmail = Party["PartyMst/ partyEmail"].toString();
      newParty.partyBillingAddress =
          Party["PartyMst/partyBillingAddress"].toString();
      newParty.partyState = Party["PartyMst/ partyState"].toString();
      newParty.partyGSTTYpe = Party["PartyMst/ partyGSTTYpe"].toString();

      newParty.partyMobileNo = Party["PartyMst/partyMobileNo"].toInt();
      newParty.partyStateCode = Party["PartyMst/partyStateCode"].toInt();
      newParty.partyOpeningBalance =
          Party["PartyMst/partyOpeningBalance"].toInt();
      newParty.openingBalAsOn = Party["PartyMst/openingBalAsOn"].toInt();
      newParty.id = Party["PartyMst/_id"];
      newParty.partyGSTINNo = Party["PartyMst/partyGSTINNo"].toInt();
      newParty.partyOpeningBalance =
          Party["PartyMst/partyOpeningBalance"].toInt();

      //new.add(newParty);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _email;
  String _phoneNumber;

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Add',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: ' Pa',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            TextSpan(
              text: 'rty',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ]),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomSize: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: _title()),
      body: Container(
        color: Colors.orange[300],
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // _backButton(),
              // _title(),
              _buildName(),
              _buildEmail(),
              _buildPhoneNumber(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.orangeAccent,
                ),
              ),
              NestedTabBar(),
              SizedBox(height: 150),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
              ),
              RaisedButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                  ),
                  onPressed: getApiResults

                  /*  print(_name);
                  print(_email);
                  print(_phoneNumber);
                  print(NestedTabBar);*/

                  //Send to API
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class Party {
  String partyName,
      partyType,
      partyEmail,
      partyBillingAddress,
      partyGSTTYpe,
      id,
      partyState;
  int partyMobileNo,
      partyStateCode,
      partyOpeningBalance,
      partyGSTINNo,
      openingBalAsOn;

  Party({
    this.partyMobileNo,
    this.partyName,
    this.partyType,
    this.partyEmail,
    this.partyBillingAddress,
    this.partyGSTTYpe,
    this.partyState,
    this.partyStateCode,
    this.partyOpeningBalance,
    //this.openingBalAsOn,
    this.id,
    this.partyGSTINNo,
    //this.partyOpeningBalance,
    this.openingBalAsOn,
    //  this.salesTaxIncluded
  });
}

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Billing Address",
            ),
            Tab(
              text: "Gst",
            ),
            Tab(
              text: "Opening Balance",
            ),
          ],
        ),
        Container(
          height: 50, // screenHeight * 0.70,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              _buildbillingaddress(),
              _buildgst(),
              _buildopeningbalance(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildgst() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'GST'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'text is Required';
        }

        return null;
      },
      onSaved: (String value) {
        // _gst = value;
      },
    );
  }

  Widget _buildopeningbalance() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Opening Balance'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'text is Required';
        }

        return null;
      },
      onSaved: (String value) {
        //  _openingbalance = value;
      },
    );
  }

  Widget _buildbillingaddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Billing Address'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Text is Required';
        }

        return null;
      },
      onSaved: (String value) {
        // _billingaddress = value;
      },
    );
  }
}
