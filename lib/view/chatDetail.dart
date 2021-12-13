import 'package:flutter/material.dart';
import 'package:version1_0/models/chat_model.dart';
import 'package:version1_0/services/httpService_chat.dart';

class ChatDetailPage extends StatefulWidget {
  String user;
  int id;
  ChatDetailPage({required this.user, required this.id});
  //String get $user => this.user;

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final HttpServiceChat httpService = HttpServiceChat();
  final HttpServiceCreateMessagePost httpServicePost =
      HttpServiceCreateMessagePost();
  final messageController = TextEditingController();
  final messageGlobalKey = GlobalKey<FormState>();

  /*List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Jane, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];*/
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            color: Colors.blueGrey.shade100,
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/proxy/xDI1hdttUx-ZhkbBiuZ0KrJHNmnCc-lBnACO7uufMJfkc5eSjSD0oWg_lz_akzBq5uqfAyCtMOBU7hrLSJBcTNW46As_sxlMZwf7wHWxfts3h3n2yoqOlvPNDw=w1200-h630-p-k-no-nu"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${widget.user}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: httpService.getChatMessages(widget.id),
        builder:
            (BuildContext context, AsyncSnapshot<List<ChatMessage>> snapshot) {
          if (snapshot.hasData) {
            List<ChatMessage>? messages = snapshot.data;
            /*if (messages!.length > 0) {
            messageLength = messages.length;
          }*/
            return Stack(
              children: <Widget>[
                ListView.builder(
                  reverse: true,
                  itemCount: messages!.length, //////
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 60),
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment:
                            (messages[index].receiverID == 1 ////// MAKE DYNAMIC
                                ? Alignment.topLeft
                                : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].receiverID ==
                                    1 ////// MAKE DYNAMIC
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[index].message,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                /*SizedBox(
                height: 50.0,
              ),*/
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Form(
                            key: messageGlobalKey,
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: messageController,
                              showCursor: true,
                              decoration: InputDecoration(
                                  hintText: "Write message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nothing to send. Please enter a message';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            ChatMessage newChatMessage = new ChatMessage(
                              senderID:
                                  1, ///// MAKE DYNAMIC - Get this users ID
                              message: messageController.text,
                              receiverID: widget.id,

                              ///time: ,
                              // time: currentTime,
                            );
                            //if (messageGlobalKey.currentState!.validate()) {
                            httpServicePost.createMessagePost(
                                body: newChatMessage.toMap());
                            messageController.clear();
                            /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.greenAccent[400],
                                content: Text('Sent!')));*/
                            //}
                            setState(() {});
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } //end of if
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
