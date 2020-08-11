import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/widgets.dart';
import 'dart:async';

class DebitNote extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PurchaseScreenState();
  }
}

class PurchaseScreenState extends State<DebitNote> {
  String _party;
  String _billdate;
  DateTime _dateTime;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  /* Widget _buildbilldate() {
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                firstDate: DateTime(2001),
                lastDate: DateTime(2021))
            .then((date) {
          setState(() {
            _dateTime = date;
          });
        });
      },
      // decoration: InputDecoration(labelText: 'Party*'),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Icon(Icons.calendar_today, color: Colors.black),
            ),
            Text('Bill Date', style: TextStyle(fontSize: 20)),
            //Icon(Icons., color: Colors.black)
          ],
        ),
      ),
    );
  }*/
  Widget _buildparty() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Party*'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _party = value;
      },
    );
  }

  Widget _buildbilldate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Bill Date'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _party = value;
      },
    );
  }

  Widget _buildtotalamount() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ToTal Amt'),
      //maxLength: 10,
      //Padding:(),

      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _billdate = value;
      },
    );
  }

  Widget _buildrecieved() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Received'),
      //maxLength: 10,
      //Padding:(),

      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _billdate = value;
      },
    );
  }

  Widget _buildbalancedue() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Balance Due'),
      //maxLength: 10,
      //Padding:(),

      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _billdate = value;
      },
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BillScreen1()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xffdf8e33),
                offset: Offset(0, 0),
                blurRadius: 0,
                // spreadRadius: 0)
              )
            ],
            color: Colors.white),
        child: Text(
          'Add Item(Optional)',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Debi',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 't ',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'Note',
              style: TextStyle(color: Colors.white, fontSize: 30),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _dropButton() {
    return InkWell(
      onTap: () {
        //  Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ),
            Text('Cash',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Text('(Payment Type)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _adddescription() {
    return InkWell(
      onTap: () {
        //  Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 0, bottom: 0),
              child: Icon(Icons.library_add, color: Colors.black),
            ),
            Text('Add Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _cameraButton() {
    return InkWell(
      onTap: () {
        //  Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 200, top: 10, bottom: 0),
              //child: Icon(Icons.photo_camera, color: Colors.black),
            ),
            Text('Camera',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Icon(Icons.photo_camera, color: Colors.black),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _backButton(),
              _title(),

              SizedBox(
                height: 1,
              ),
              _buildparty(),
              SizedBox(
                height: 0,
              ),
              // Date(),
              _buildbilldate(),
              //  NestedDate(),
              SizedBox(
                height: 1,
              ),
              _submitButton(),
              // _backButton(),
              SizedBox(
                height: 1,
              ),
              _buildtotalamount(),
              SizedBox(
                height: 1,
              ),
              _buildrecieved(),
              SizedBox(
                height: 1,
              ),
              _buildbalancedue(),
              _dropButton(),
              SizedBox(
                height: 1,
              ),
              Positioned(top: 40, right: 100, child: _cameraButton()),
              SizedBox(
                height: 1,
              ),
              _adddescription(),
              SizedBox(height: 0),
              RaisedButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    _formKey.currentState.save();

                    print(_billdate);
                    print(_party);
                  })
            ],
          ),
        ),

        // Positioned(top: 40, left: 0, child: _backButton()),
      ),
    );
  }
}

class BillScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BillScreen1State();
  }
}

class BillScreen1State extends State<BillScreen1> {
  String _product;
  String _quantity;
  String _totalamount;
  String _tax;
  String _rate;
  String _subtotal;
  // String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Add ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Line ',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'Item',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _buildproduct() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product/Service Name'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required';
        }

        return null;
      },
      onSaved: (String value) {
        _product = value;
      },
    );
  }

  Widget _buildquantity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Quantity'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required';
        }

        return null;
      },
      onSaved: (String value) {
        _quantity = value;
      },
    );
  }

  //ADD THE INVOICE WORK
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _buildtotalamount() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ToTal Amt'),
      //maxLength: 10,
      //Padding:(),

      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _totalamount = value;
      },
    );
  }

  Widget _buildsubtotal() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Subtotal(Rate*Qty)'),
      //maxLength: 10,
      //Padding:(),

      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _subtotal = value;
      },
    );
  }

  Widget _buildtax() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tax%'),

      //maxLength: 10,
      //Padding:(),

      validator: (String value) {
        if (value.isEmpty) {
          // return ' Required';
        }

        return null;
      },
      onSaved: (String value) {
        _tax = value;
      },
    );
  }

  Widget _buildrate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Rate(Price/Unit)'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          //return 'Required';

        }

        return null;
      },
      onSaved: (String value) {
        _rate = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _backButton(),
              _title(),

              SizedBox(
                height: 1,
              ),
              _buildproduct(),
              SizedBox(
                height: 1,
              ),
              _buildquantity(),
              SizedBox(
                height: 10,
              ),
              _buildrate(),
              SizedBox(
                height: 1,
              ),
              _buildsubtotal(),
              SizedBox(
                height: 1,
              ),
              _buildtax(),
              SizedBox(
                height: 1,
              ),
              _buildtotalamount(),

              // _backButton(),

              SizedBox(height: 100),
              RaisedButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => DebitNote()));

                    _formKey.currentState.save();

                    print(_product);
                    print(_quantity);
                    print(_rate);
                  })
            ],
          ),
        ),

        // Positioned(top: 40, left: 0, child: _backButton()),
      ),
    );
  }
}
