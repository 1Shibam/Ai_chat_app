import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatRespnseModel {
  final String role;
  final List<ChatModelPart> parts;

  ChatRespnseModel({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatRespnseModel.fromMap(Map<String, dynamic> map) {
    return ChatRespnseModel(
      role: map['role'] as String,
      parts: List<ChatModelPart>.from(
        (map['parts'] as List<int>).map<ChatModelPart>(
          (x) => ChatModelPart.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRespnseModel.fromJson(String source) =>
      ChatRespnseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ChatModelPart {
  final String text;
  ChatModelPart({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory ChatModelPart.fromMap(Map<String, dynamic> map) {
    return ChatModelPart(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModelPart.fromJson(String source) =>
      ChatModelPart.fromMap(json.decode(source) as Map<String, dynamic>);
}
