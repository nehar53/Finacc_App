import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/widgets.dart';

class PurchaseOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Purchase Order "),
        actions: [Icon(Icons.settings)],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext Context) => DebitNote(),
              ));
        },
        icon: Icon(Icons.add),
        label: Text(" Add  Purchase Order "),
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}

class DebitNote extends StatefulWidget {
  DebitNote({Key key}) : super(key: key);
  @override
  _DebitNoteState createState() => _DebitNoteState();
}

class _DebitNoteState extends State<DebitNote> {
  String dropdownValue = 'Cash';
  @override
  Widget build(BuildContext context) {
    var _amt;
    double _rAmount;
    double _amount;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar:
          //PreferredSize(
          //preferredSize: Size.fromHeight(100.0),
          //child:
          AppBar(
        title: Text(" Purchase Order "),
        actions: [
          Icon(Icons.settings),
//            Row(
//              children: <Widget>[
//                TextFormField(
//
//                  decoration: InputDecoration(
//                    labelText: "Return No.",
//                    fillColor: Colors.white
//                  ),
//                  validator: (value){
//                    if(value.length == 0){
//                      return "Cannot be Empty";
//                    }
//                    else{
//                      return null;
//                    }
//
//                  },
//                )
//              ],
//            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  SizedBox(
                    //height: 100.0,
                    width: 100.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Party*",
                        fillColor: Colors.black,
//                            border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(15.0),
//                              borderSide: BorderSide(),
                        // ),
                      ),
                      validator: (value) {
                        if (value.length == 0) {
                          return "Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
//                      SizedBox(height: 75.0,
//                        width: 200.0,
//                      child:
                  Padding(
                    padding: const EdgeInsets.only(left: 180.0),
                    child: Icon(
                      Icons.calendar_today,
                      size: 40.0,
                    ),
                  )
                  // ,)
                ]),
              ),

              //Divider(height:2.5,color: Colors.grey,thickness: 10 ),

              SizedBox(
                height: 75.0,
                //width: 200.0,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Party*",
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.length == 0) {
                      return "Cannot be Empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    width: 150.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText: "Bill. Date ",
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value.length == 0) {
                          return "Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    width: 150.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Bill No.",
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value.length == 0) {
                          return "Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blueAccent.shade100,
                  child: Text("ADD ITEMS(OPTIONAL)"),
                ),
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Total Amt ',
                ),
                validator: (value) => value.isEmpty ? "Can't be empty" : null,
                onSaved: (value) => _amount = value as double,
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Received Amt",
                ),
                //validator: (value) => value.isEmpty?"Can't be empty":null,
                onSaved: (value) => _rAmount = value as double,
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Balance Due",
                  hintText: "$_amt",
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Cash', 'Cheque']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                      color: Colors.blue.shade100,
                      onPressed: () {
                        setState(() {
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Description*",
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value.length == 0) {
                                return "Cannot be Empty";
                              } else {
                                return null;
                              }
                            },
                          );
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.note_add,
                            color: Colors.blue.shade700,
                          ),
                          Text(
                            " Add Description ",
                            style: TextStyle(color: Colors.blue.shade700),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 130.0),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 35.0,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 50.0,
              ),

//
//              SizedBox(
//                  width: double.infinity,
//                  height: 40.0 ,

              ButtonTheme(
                  child: RaisedButton(
                elevation: 20.0,
                onPressed: null,
                child: Text(
                  " Save",
                  style: TextStyle(color: Colors.blue.shade700),
                ),
                color: Colors.blue.shade100,
                splashColor: Colors.red,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
