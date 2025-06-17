import 'package:flutter/material.dart';
import 'Answer.dart';

class ChatOpen extends StatefulWidget {
  @override
  _ChatOpenState createState() => _ChatOpenState();
}

Answer ans = Answer();

class _ChatOpenState extends State<ChatOpen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "You", "text": text});
      _controller.clear();
    });

    final botReply = ans.getResponse(text);

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({"sender": "Bot", "text": botReply});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with Kowalski")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isBot = msg["sender"] == "Bot";

                return Align(
                  alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment:
                        isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isBot) ...[
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/bot_avatar.png"),
                          radius: 18,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isBot
                                ? const Color.fromARGB(255, 144, 69, 114)
                                : const Color.fromARGB(255, 255, 198, 208),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${msg['text']}",
                            style: TextStyle(
                              color: isBot ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 144, 69, 114),
                  ),
                  onPressed: () => _sendMessage(_controller.text),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
