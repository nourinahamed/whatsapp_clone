// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) => StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
    StatusModel({
        this.avatar,
        this.name,
        this.updatedAt,
    });

    String? avatar;
    String? name;
    String? updatedAt;

    factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        avatar: json["avatar"],
        name: json["name"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "updatedAt": updatedAt,
    };
}
