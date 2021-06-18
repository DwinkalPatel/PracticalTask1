// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.title,
    this.welcomeScreen,
    this.thankyouScreens,
    this.fields,
  });

  String title;
  WelcomeScreen welcomeScreen;
  ThankyouScreens thankyouScreens;
  List<Field> fields;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    title: json["title"] == null ? null : json["title"],
    welcomeScreen: json["welcome_screen"] == null ? null : WelcomeScreen.fromJson(json["welcome_screen"]),
    thankyouScreens: json["thankyou_screens"] == null ? null : ThankyouScreens.fromJson(json["thankyou_screens"]),
    fields: json["fields"] == null ? null : List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "welcome_screen": welcomeScreen == null ? null : welcomeScreen.toJson(),
    "thankyou_screens": thankyouScreens == null ? null : thankyouScreens.toJson(),
    "fields": fields == null ? null : List<dynamic>.from(fields.map((x) => x.toJson())),
  };
}

class Field {
  Field({
    this.id,
    this.title,
    this.validations,
    this.type,
    this.properties,
  });

  String id;
  String title;
  Validations validations;
  String type;
  Properties properties;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    validations: json["validations"] == null ? null : Validations.fromJson(json["validations"]),
    type: json["type"] == null ? null : json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "validations": validations == null ? null : validations.toJson(),
    "type": type == null ? null : type,
    "properties": properties == null ? null : properties.toJson(),
  };
}

class Properties {
  Properties({
    this.alphabeticalOrder,
    this.choices,
    this.steps,
    this.structure,
  });

  bool alphabeticalOrder;
  List<Choice> choices;
  int steps;
  String structure;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    alphabeticalOrder: json["alphabetical_order"] == null ? null : json["alphabetical_order"],
    choices: json["choices"] == null ? null : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    steps: json["steps"] == null ? null : json["steps"],
    structure: json["structure"] == null ? null : json["structure"],
  );

  Map<String, dynamic> toJson() => {
    "alphabetical_order": alphabeticalOrder == null ? null : alphabeticalOrder,
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x.toJson())),
    "steps": steps == null ? null : steps,
    "structure": structure == null ? null : structure,
  };
}

class Choice {
  Choice({
    this.label,
  });

  String label;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    label: json["label"] == null ? null : json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label == null ? null : label,
  };
}

class Validations {
  Validations({
    this.required,
  });

  bool required;

  factory Validations.fromJson(Map<String, dynamic> json) => Validations(
    required: json["required"] == null ? null : json["required"],
  );

  Map<String, dynamic> toJson() => {
    "required": required == null ? null : required,
  };
}

class ThankyouScreens {
  ThankyouScreens({
    this.title,
  });

  String title;

  factory ThankyouScreens.fromJson(Map<String, dynamic> json) => ThankyouScreens(
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
  };
}

class WelcomeScreen {
  WelcomeScreen({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory WelcomeScreen.fromJson(Map<String, dynamic> json) => WelcomeScreen(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
  };
}
