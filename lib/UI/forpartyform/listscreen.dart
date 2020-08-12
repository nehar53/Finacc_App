import 'dart:convert';

import 'package:finacc/UI/forpartyform/model.dart';
import 'package:flutter/material.dart';
import 'party_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Parties'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  bottom: 32.0,
                ),
                child: Column(
                  children: <Widget>[ListScreen()],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            );
          },
        ));
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Party> newPartyList = new List();
  List<Widget> widgetsOfItem = new List();

  getApiResults() async {
    newPartyList.clear();
    widgetsOfItem.clear();
    var url = "http://164.52.197.189:8181/fdb/finacc/gendata/query";

    Map<String, dynamic> postReq = {
      "select": ["*"],
      "from": "partyMst"
    };
    var query = json.encode(postReq);
    var resp = await http.post(url, body: query);
    var res = json.decode(resp.body.toString());

    print(json.decode(resp.body.toString()));

    setState(() {});
    for (var party in res) {
      Party newParty = Party();
      newParty.partyName = party["partyMst/partyName"];
      newParty.partyGstinNo = party["partyMst/partyGSTINNo"];
      newParty.partyMobileNo = party["partyMst/partyMobileNo"];
      newParty.openingBalAsOn = party["partyMst/openingBalAsOn"].toInt();
      newParty.partyOpeningBalance =
          party["partyMst/partyOpeningBalance"].toInt();
      newParty.partyEmail = party["partyMst/partyEmail"];
      newParty.partyGsttYpe = party["partyMst/partyGSTTYpe"];
      newParty.partyBillingAddress = party["partyMst/partyBillingAddress"];
      newParty.id = party["_partyMst/id"];
      newParty.partyState = party["partyMst/partyState"];
      newParty.partyStateCode = party["partyMst/partyStateCode"];
      newParty.partyType = party["partyMst/partyType"];
      newPartyList.add(newParty);
    }

    for (var party in newPartyList) {
      var tile = SizedBox(
        height: 100,
        width: double.maxFinite,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      party.partyName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      party.partyEmail,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Sales Price : ",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        party.partyOpeningBalance.toString(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      " Purchase Price: ",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        party.openingBalAsOn.toString(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      widgetsOfItem.add(tile);
      print(" Working ");
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiResults();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: widgetsOfItem));
  }
}
