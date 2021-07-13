import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({this.user});
  final String user;
  final fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              isMe: messageSender == user);
          messageBubbles.add(messageBubble);
        }
        return Expanded(
            child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                children: messageBubbles));
      },
    );
  }
}
