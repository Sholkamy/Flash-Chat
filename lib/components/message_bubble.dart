import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.sender, this.isMe});
  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))
                : BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
            elevation: 5.0,
            color: isMe ? Colors.white : Colors.lightBlueAccent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.black54 : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
