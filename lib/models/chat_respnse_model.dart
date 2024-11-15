// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatRespnseModel {
  final String role;
  final List<ChatModelPart> parts;

  ChatRespnseModel(this.role, this.parts);
}

class ChatModelPart {
  final String text;
  ChatModelPart({
    required this.text,
  });
}
