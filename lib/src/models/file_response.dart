// To parse this JSON data, do
//
//     final fileResponse = fileResponseFromJson(jsonString);

import 'dart:convert';

FileResponse fileResponseFromJson(String str) =>
    FileResponse.fromJson(json.decode(str));

String fileResponseToJson(FileResponse data) => json.encode(data.toJson());

class FileResponse {
  FileResponse({
    this.filePath,
    this.errorMessage,
    this.isSuccess,
  });

  String filePath;
  dynamic errorMessage;
  bool isSuccess;

  factory FileResponse.fromJson(Map<String, dynamic> json) => FileResponse(
        filePath: json["filePath"],
        errorMessage: json["errorMessage"],
        isSuccess: json["isSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "filePath": filePath,
        "errorMessage": errorMessage,
        "isSuccess": isSuccess,
      };
}
