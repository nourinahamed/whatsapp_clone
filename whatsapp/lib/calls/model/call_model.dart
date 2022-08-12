// To parse this JSON data, do
//
//     final callModel = callModelFromJson(jsonString);

import 'dart:convert';

CallModel callModelFromJson(String str) => CallModel.fromJson(json.decode(str));

String callModelToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
    CallModel({
        this.avatar,
        this.name,
        this.calledAt,
        this.callIcon,
    });

    String? avatar;
    String? name;
    String? calledAt;
    String? callIcon;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        avatar: json["avatar"],
        name: json["name"],
        calledAt: json["calledAt"],
        callIcon: json["callIcon"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "calledAt": calledAt,
        "callIcon": callIcon,
    };
}
