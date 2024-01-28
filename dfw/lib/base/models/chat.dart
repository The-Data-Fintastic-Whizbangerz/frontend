enum ChatObject { user, bot }

class Chat {
  String? text;
  ChatObject? object;

  Chat({required this.text, required this.object});
}
