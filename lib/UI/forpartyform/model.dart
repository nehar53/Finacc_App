import 'dart:convert';

Party partyFromJson(String str) => Party.fromJson(json.decode(str));

String partyToJson(Party data) => json.encode(data.toJson());

class Party {
  Party({
    this.id,
    this.partyMobileNo,
    this.partyName,
    this.partyType,
    this.partyEmail,
    this.partyBillingAddress,
    this.partyGsttYpe,
    this.partyState,
    this.partyStateCode,
    this.partyOpeningBalance,
    this.partyGstinNo,
    this.openingBalAsOn,
  });

  String id;
  String partyMobileNo;
  String partyName;
  String partyType;
  String partyEmail;
  String partyBillingAddress;
  String partyGsttYpe;
  String partyState;
  String partyStateCode;
  int partyOpeningBalance;
  String partyGstinNo;
  int openingBalAsOn;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        id: json["_id"],
        partyMobileNo: json["partyMobileNo"],
        partyName: json["partyName"],
        partyType: json["partyType"],
        partyEmail: json["partyEmail"],
        partyBillingAddress: json["partyBillingAddress"],
        partyGsttYpe: json["partyGSTTYpe"],
        partyState: json["partyState"],
        partyStateCode: json["partyStateCode"],
        partyOpeningBalance: json["partyOpeningBalance"],
        partyGstinNo: json["partyGSTINNo"],
        openingBalAsOn: json["openingBalAsOn"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "partyMobileNo": partyMobileNo,
        "partyName": partyName,
        "partyType": partyType,
        "partyEmail": partyEmail,
        "partyBillingAddress": partyBillingAddress,
        "partyGSTTYpe": partyGsttYpe,
        "partyState": partyState,
        "partyStateCode": partyStateCode,
        "partyOpeningBalance": partyOpeningBalance,
        "partyGSTINNo": partyGstinNo,
        "openingBalAsOn": openingBalAsOn,
      };
}
