// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class discussion_Page extends StatefulWidget {
  const discussion_Page({
    super.key,
  });

  @override
  State<discussion_Page> createState() => _discussion_PageState();
}

class Message {
  final String sender;
  final String message;
  final String time;

  Message({required this.sender, required this.message, required this.time});
}

class _discussion_PageState extends State<discussion_Page> {
  List<Message> messages = [
    Message(
      sender: 'John',
      message: 'Hello, how are you?',
      time: '9:00 AM',
    ),
    Message(
      sender: 'Alice',
      message: 'I\'m good, thanks!',
      time: '9:02 AM',
    ),
    Message(
      sender: 'John',
      message: 'Great to hear that!',
      time: '9:05 AM',
    ),
  ];

  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // ignore: non_constant_identifier_names
  String AMPM() {
    if (DateTime.now().hour > 12) {
      return " PM";
    } else {
      return " AM";
    }
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      String messageText = messageController.text;
      setState(() {
        messages.add(Message(
            sender: 'Alice',
            message: messageText,
            time: DateFormat('HH:mm').format(DateTime.now()).toString() +
                AMPM()));
      });
      messageController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 1000,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              floating: true,
              title: Text('John'),
            ),
          ];
        },
        body: Column(
          children: [_spaceOfMessages(), _messageInput()],
        ),
      ),
      resizeToAvoidBottomInset: true,
    ));
  }

  Widget _spaceOfMessages() {
    return Expanded(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            Message message = messages[index];
            bool isMe = message.sender == 'Alice';
            return _messageOutput(isMe, message);
          },
        ),
      ),
    );
  }

  Widget _messageOutput(isMe, message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: isMe ? _GardienGreen() : null,
              color: isMe ? null : Colors.grey[300],
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name of sender
                Text(
                  message.sender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 5.0),
                // the message
                Text(
                  message.message,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          // the time
          Text(
            message.time,
            style: TextStyle(
              fontSize: 12.0,
              color: isMe ? Colors.grey[400] : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.send_rounded),
          ),
        ],
      ),
    );
  }

  Gradient _GardienGreen() {
    return const LinearGradient(
        colors: [
          Colors.green,
          Color.fromARGB(255, 33, 160, 99),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1],
        tileMode: TileMode.mirror);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
