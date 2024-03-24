// To parse this JSON data, do
//
//     final employeeListResModel = employeeListResModelFromJson(jsonString);

import 'dart:convert';

EmployeeListResModel employeeListResModelFromJson(String str) =>
    EmployeeListResModel.fromJson(json.decode(str));

String employeeListResModelToJson(EmployeeListResModel data) =>
    json.encode(data.toJson());

class EmployeeListResModel {
  int? status;
  String? message;
  List<EmployeeDetails>? employeeList;

  EmployeeListResModel({
    this.status,
    this.message,
    this.employeeList,
  });

  factory EmployeeListResModel.fromJson(Map<String, dynamic> json) =>
      EmployeeListResModel(
        status: json["status"],
        message: json["message"],
        employeeList: json["data"] == null
            ? []
            : List<EmployeeDetails>.from(
                json["data"]!.map((x) => EmployeeDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": employeeList == null
            ? []
            : List<dynamic>.from(employeeList!.map((x) => x.toJson())),
      };
}

class EmployeeDetails {
  int? id;
  String? name;
  String? role;

  EmployeeDetails({
    this.id,
    this.name,
    this.role,
  });

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        id: json["id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
      };
}
