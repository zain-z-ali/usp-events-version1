import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:version1_0/models/sessionForum_message_model.dart';
import 'package:version1_0/models/session_model.dart';
import 'package:version1_0/services/httpService_sessionForum.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/messages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SessionForum extends StatefulWidget {
  final Session session;

  SessionForum({required this.session});
  @override
  _SessionForumState createState() => _SessionForumState();
}

class _SessionForumState extends State<SessionForum> {
  final HttpServiceSessionForum httpService = HttpServiceSessionForum();
  final HttpServiceCreateSessionForumPost httpServicePost =
      HttpServiceCreateSessionForumPost();
  final messageController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  int userid = 1; ////make dynamic

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    messageController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    messageController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${messageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      //drawer: NavBar(),
      appBar: AppBar(
        title: Text(globalEvent.eventName),
        automaticallyImplyLeading: false,
      ),
      /*floatingActionButton: FloatingActionButton(
        // second FAB to perform increment
        onPressed: () {
          createAlertDialog(context).then((onValue) {
            // print(onValue);
          });
        },
        child: Icon(Icons.message_rounded),
      ),*/
      body: SlidingUpPanel(
        backdropEnabled: true,
        minHeight: 40,
        panel: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Enter your message:\n\n\n'),
                /*TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your post message',
                    errorText: 'Cannot be empty. Please enter a message',
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 3,
                  controller: messageController,
                ),*/
                Form(
                  key: formGlobalKey,
                  child: TextFormField(
                    controller: messageController,
                    //textCapitalization: TextCapitalization.words,
                    showCursor: true,
                    decoration: InputDecoration(
                      focusColor: Colors.blue,
                      hintText: 'Enter your post message',
                      hintStyle: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty. Please enter a message';
                      }
                      return null;
                    },
                  ),
                ),

                /*Icon(
                  Icons.send_rounded,
                  color: Colors.blueGrey,
                  size: 30.0,
                ),*/
                ElevatedButton(
                  onPressed: () async {
                    SessionMessage newSessionMessage = new SessionMessage(
                      sessionID: widget.session.sessionID,
                      text: messageController.text,
                      userID: userid,
                      time: "",
                      // time: currentTime,
                    );
                    if (formGlobalKey.currentState!.validate()) {
                      httpServicePost.createSessionForumPost(
                          body: newSessionMessage.toMap());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.greenAccent[400],
                          content: Text('Your post has been created!')));
                    }
                    messageController.clear();
                    setState(() {});
                  },
                  child: Text('Post to Forum'),
                ),
                Text(
                    '\n\n\n*Please be courteous to other participants and keep your discussion relevant to the theme.'),
              ],
            ),
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            //color: Colors.blueGrey,
            color: Colors.grey[600],
            borderRadius: radius,
          ),
          child: Center(
            child: Text(
              "Post a forum message",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        borderRadius: radius,
        ///////////////////////////////
        body: FutureBuilder(
          future: httpService.getSessionForum(widget.session.sessionID),
          builder: (BuildContext context,
              AsyncSnapshot<List<SessionMessage>> snapshot) {
            if (globalEventId == 0) {
              return NoEventSelected();
            } /*else if (!snapshot.hasData) {
            return ThemesNotAdded();
          }*/
            else if (snapshot.hasData) {
              List<SessionMessage>? messages = snapshot.data;
              return Container(
                //height: 300,
                child: ListView(
                  children: messages!
                      .map(
                        (SessionMessage message) => Card(
                          //color: Colors.grey[200],
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(

                                  //height: 40,
                                  //width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      /*border: Border(
                                      left: BorderSide(
                                        width: 1.0,
                                        color: Colors.blueGrey.shade700,
                                        style: BorderStyle.solid,
                                      ),
                                      top: BorderSide(
                                        width: 1.0,
                                        color: Colors.blueGrey.shade700,
                                        style: BorderStyle.solid,
                                      ),
                                      right: BorderSide(
                                        width: 1.0,
                                        color: Colors.blueGrey.shade700,
                                        style: BorderStyle.solid,
                                      ),
                                    ),*/
                                      /*image: DecorationImage(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/OIP.MUiC49P6E2QaeyZ9IYO4ZQHaEK?w=304&h=180&c=7&r=0&o=5&pid=1.7'),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),*/
                                      //shape: BoxShape.circle,
                                      ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: ListTile(
                                      title: Text('${message.text}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      //subtitle: Text("User ${message.userID}"),
                                    ),
                                  )),
                              Container(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width,
                                  /* decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1528731708534-816fe59f90cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWluaW1hbCUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topCenter,
                                    ),
                                    //shape: BoxShape.circle,
                                  ),*/
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        'User ${message.userID}', //, ${message.time}
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                  )),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
