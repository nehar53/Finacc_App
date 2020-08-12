import 'dart:convert';

import 'package:finacc/UI/forpartyform/model.dart';
import 'package:finacc/UI/forpartyform/listscreen.dart';
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
  submitApiReq() async {
    // var res = _selectedGST.split(" ");
    //print(res.last);

    var url = "http://164.52.197.189:8181/fdb/finacc/gendata/transact";

    Map<String, dynamic> postReq = {
      "_id": "partyMst",
      "partyMobileNo": _buildPhoneNumber(),
      "partyName": _buildName(),
      "partyType": partyType.text,
      "partyEmail": _buildEmail(),
      "partyBillingAddress": partyBillingAddress.text,
      "partyGSTTYpe": partyGSTTYpe.text,
      "partyState": partyState.text,
      "partyStateCode": partyStateCode.text,
      "partyOpeningBalance": int.parse(partyOpeningBalance.text),
      "partyGSTINNo": partyGSTINNo.text,
      "openingBalAsOn": int.parse(openingBalAsOn.text)
    };
    var abc = [postReq];

    var repost = json.encode(abc);
    var resp = await http.post(url, body: repost);
    print(json.decode(resp.body.toString()));

    setState(() {});
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _email;
  String _phoneNumber;

  Widget _buildName() {
    return TextFormField(
      controller: partyName,
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
      controller: partyEmail,
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
      controller: partyMobileNo,
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
            // textStyle: Theme.of(context).textTheme.display1,
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    submitApiReq();
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
              _buildName(),
              SizedBox(
                height: 22,
              ),
              /*  _party == null
                  ? Container()
                  : Text(
                      "The user ${_party.partyName},${_party.id} is created succesfully at time "),*/
              _buildEmail(),
              SizedBox(
                height: 22,
              ),
              _buildPhoneNumber(),
              SizedBox(
                height: 22,
              ),
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
                onPressed: () async {
                  //final String name = nameController.text;
                  //final String email = jobController.text;
                  //final Party party = await submitapiresult(name, email);
                  // PartyList();
                  //setState(() {
                  // _party = party;
                  //  });

                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage1()));
                  // submitApiReq();
                },

                /*  print(_name);
                  print(_email);
                  print(_phoneNumber);
                  print(NestedTabBar);*/

                //Send to API
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextEditingController partyName = TextEditingController();
final TextEditingController partyEmail = TextEditingController();
final TextEditingController partyMobileNo = TextEditingController();
final TextEditingController partyType = TextEditingController();
final TextEditingController partyBillingAddress = TextEditingController();
final TextEditingController partyGSTTYpe = TextEditingController();
final TextEditingController partyState = TextEditingController();
final TextEditingController partyStateCode = TextEditingController();
final TextEditingController partyOpeningBalance = TextEditingController();
final TextEditingController partyGSTINNo = TextEditingController();
final TextEditingController openingBalAsOn = TextEditingController();

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
