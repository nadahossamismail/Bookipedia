import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.messageController});
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chats"),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                child: TextField(
                    controller: messageController,
                    maxLines: 7,
                    minLines: 1,
                    enableSuggestions: true,
                    scrollPhysics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast),
                    decoration: const InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                strokeAlign: BorderSide.strokeAlignOutside),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        contentPadding: EdgeInsets.only(
                            top: 8, bottom: 8, right: 8, left: 16),
                        hintFadeDuration: Duration(milliseconds: 400),
                        hintText: "Enter your message")),
              )),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.only(right: 8),
              ),
            ]),
          )
        ]));
  }
}
