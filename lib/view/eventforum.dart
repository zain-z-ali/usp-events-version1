import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
//import 'package:version1_0/services/httpService_theme.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/messages.dart';
import 'package:version1_0/view/navBar.dart';
import '../services/httpService_eventForum.dart';
import 'package:version1_0/models/eventForum_message_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const String defaultUserName = "John Doe";

/*
class EventForum extends StatefulWidget {
  @override
  State createState() => new ChatWindow();
}

class ChatWindow extends State<EventForum> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;
  //_getAllMsg();
  //ChatWindow({,});

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Event Forum"),
        elevation: Theme.of(ctx).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
          reverse: true,
          padding: new EdgeInsets.all(6.0),
        )),
        new Divider(height: 1.0),
        new Container(
          child: _buildComposer(),
          decoration: new BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );
  }

  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                      //_getAllMsg();
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Enter some text to send a message"),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : new IconButton(
                          icon: new Icon(Icons.send),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  void _getAllMsg() {
    Msg mesg = new Msg(
      txt: "aaaaahhhh",
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    _messages.insert(0, mesg);
    //_messages.insert(0, "msg");
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class Msg extends StatelessWidget {
  Msg({required this.txt, required this.animationController});
  final String txt;
  final AnimationController animationController;
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: new CircleAvatar(child: new Text(defaultUserName[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "$defaultUserName ($currentTime)",
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child:
                        new Text(txt, style: Theme.of(ctx).textTheme.subtitle1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/* HEEEEEERRRREEEE
class EventForumMessages {
  var ForumPostArr1 = [
    new ForumPostEntry("User8", "2 Days ago",
        "Hello,\n magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    new ForumPostEntry("User2", "23 Hours ago",
        "Pellentesque justo metus,  semper vitae. Suspendisse neque nisl, vestibulum non dui in, vulputate placerat elit. Sed at convallis mauris, eu blandit dolor. Vivamus suscipit iaculis erat eu condimentum. "),
    new ForumPostEntry("User3", "2 Days ago",
        "Lorem ipsum dolor sit amet,   olore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    new ForumPostEntry("User4", "2 Days ago",
        "Lorem ipsum dolor sit amet,  dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  ];
  /* Msg mesg = new Msg(
      txt: "aaaaahhhh",
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    _messages.insert(0, mesg);*/
  //_messages.insert(0, "msg");
}

/*var ForumPostArr = [
  new ForumPostEntry("User8", "2 Days ago",
      "Hello,\n magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  new ForumPostEntry("User2", "23 Hours ago",
      "Pellentesque justo metus,  semper vitae. Suspendisse neque nisl, vestibulum non dui in, vulputate placerat elit. Sed at convallis mauris, eu blandit dolor. Vivamus suscipit iaculis erat eu condimentum. "),
  new ForumPostEntry("User3", "2 Days ago",
      "Lorem ipsum dolor sit amet,   olore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  new ForumPostEntry("User4", "2 Days ago",
      "Lorem ipsum dolor sit amet,  dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
];*/

class EventForum extends StatefulWidget {
  @override
  _ForumDetailPageState createState() => new _ForumDetailPageState();
}

class _ForumDetailPageState extends State<EventForum>
    with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  List<ForumPostEntry> ForumPostArr = new EventForumMessages().ForumPostArr1;
  //List<ForumPostEntry> ForumPostArr = ForumPostArr2.ForumPostArr1;

  bool _isWriting = false;
  @override
  Widget build(BuildContext context) {
    var questionSection = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[new Divider()],
      ),
    );

    var responses = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              new ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        ));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Event Forum"),
      ),
      body: new Column(
        children: <Widget>[
          questionSection,
          new Expanded(
              child: new Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: responses,
          )),
          //new Column(children: <Widget>[
          new Flexible(
              child: new ListView.builder(
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
            reverse: true,
            padding: new EdgeInsets.all(6.0),
          )),
          new Divider(height: 1.0),
          new Container(
            child: _buildComposer(),
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          ),
        ],
      ),
    );
  }

  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                      //_getAllMsg();
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Enter some text to send a message"),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : new IconButton(
                          icon: new Icon(Icons.send),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  List<ForumPostEntry> _getAllMsg() {
    var thisForumPostArr = [
      new ForumPostEntry("User8", "2 Days ago",
          "Hello,\n magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      new ForumPostEntry("User2", "23 Hours ago",
          "Pellentesque justo metus,  semper vitae. Suspendisse neque nisl, vestibulum non dui in, vulputate placerat elit. Sed at convallis mauris, eu blandit dolor. Vivamus suscipit iaculis erat eu condimentum. "),
      new ForumPostEntry("User3", "2 Days ago",
          "Lorem ipsum dolor sit amet,   olore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      new ForumPostEntry("User4", "2 Days ago",
          "Lorem ipsum dolor sit amet,  dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    ];
    return thisForumPostArr;
    /* Msg mesg = new Msg(
      txt: "aaaaahhhh",
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    _messages.insert(0, mesg);*/
    //_messages.insert(0, "msg");
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class ForumPostEntry {
  final String username;
  final String hours;
  //final int likes;
  //final int dislikes;
  final String text;

  ForumPostEntry(this.username, this.hours, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(5.0),
      /*decoration: new BoxDecoration(
        //color: Colors.deepPurple[200],
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),*/
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(
              left: 2.0,
              right: 2.0,
            ),
            decoration: new BoxDecoration(
              color: Colors.grey[500],
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(1.0),
                  topRight: const Radius.circular(1.0)),
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "  ${entry.username}",
                      ),
                      //new Text(entry.hours),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0))),
            child: new Text(entry.text),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;

  IconWithText(this.iconData, this.text, {required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            this.iconData,
            color: this.iconColor,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(this.text),
          ),
        ],
      ),
    );
  }
}

class Msg extends StatelessWidget {
  Msg({required this.txt, required this.animationController});
  final String txt;
  final AnimationController animationController;
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: new CircleAvatar(child: new Text(defaultUserName[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "$defaultUserName ($currentTime)",
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child:
                        new Text(txt, style: Theme.of(ctx).textTheme.subtitle1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*void _navigateToThemeDetails(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ThemeDetails());
}*/

class EventForum extends StatefulWidget {
  @override
  _EventForumState createState() => _EventForumState();
}

class _EventForumState extends State<EventForum> {
  final HttpService_eventForum httpService = HttpService_eventForum();
  final HttpService_CreateEventForumPost httpServicePost =
      HttpService_CreateEventForumPost();
  final messageController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

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
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Event Forum"),
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
                    EventMessage newEventMessage = new EventMessage(
                      eventID: 1,
                      text: messageController.text,
                      userID: 1,
                      time: "",
                      // time: currentTime,
                    );
                    if (formGlobalKey.currentState!.validate()) {
                      httpServicePost.createEventForumPost(
                          body: newEventMessage.toMap());
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
                    '\n\n\n*Please be courteous to other participants and keep your discussion relevant to the event.'),
              ],
            ),
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
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
          future: httpService.getEventForum(),
          builder: (BuildContext context,
              AsyncSnapshot<List<EventMessage>> snapshot) {
            if (globalEventId == 0) {
              return NoEventSelected();
            } /*else if (!snapshot.hasData) {
            return ThemesNotAdded();
          }*/
            else if (snapshot.hasData) {
              List<EventMessage>? messages = snapshot.data;
              return Container(
                //height: 300,
                child: ListView(
                  children: messages!
                      .map(
                        (EventMessage message) => Card(
                          color: Colors.grey[200],
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
                                      subtitle: Text("User ${message.userID}"),
                                    ),
                                  )),
                              Container(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1528731708534-816fe59f90cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWluaW1hbCUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topCenter,
                                    ),
                                    //shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        'User ${message.userID}', //, ${message.time}
                                        style: TextStyle(
                                          fontSize: 14,
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
/*

class EventForum extends StatefulWidget {
  @override
  _EventsForumPageState createState() => _EventsForumPageState();
}

class _EventsForumPageState extends State<EventForum> {
  final HttpService_eventForum httpService = HttpService_eventForum();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Themes"),
      ),
      body: FutureBuilder(
        future: httpService.getEventForum(),
        builder:
            (BuildContext context, AsyncSnapshot<List<EventMessage>> snapshot) {
          if (globalEventId == 0) {
            return NoEventSelected();
          } else if (!snapshot.hasData) {
            return ThemesNotAdded();
          } else if (snapshot.hasData) {
            List<EventMessage>? messages = snapshot.data;
            return ListView(
              children: messages!
                  .map(
                    (EventMessage message) => Card(
                      color: Colors.lightBlue[50],
                      elevation: 5,
                      child: Column(
                        children: [
                          Container(
                              //height: 40,
                              //width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1528731708534-816fe59f90cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWluaW1hbCUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                                //shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: ListTile(
                                  title: Text(message.text,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text("User ${message.userID}"),
                                ),
                              )),
                          /* ListTile(
                            /*leading: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            //'assets\images\generic_user.png',
                            'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg',
                            width: 90,
                            height: 90,
                            fit: BoxFit
                                .cover, //makes the image cover the whole circle
                          ),
                        ),
                      ),*/
                            title: Text(theme.themeName),
                            subtitle: Text("Theme ${theme.themeID}"),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ThemeDetail(
                                  theme: theme,
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


///////////////////////
///  Future<String> createAlertDialog(BuildContext context) async {
    //Dialogue box for entering message
    TextEditingController customController = new TextEditingController();
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Message"),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop(customController.text
                        .toString()); // to go back to screen after submitting
                  })
            ],
          );
        });
  }
*/
