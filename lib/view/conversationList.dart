import 'package:flutter/material.dart';
import 'package:version1_0/view/chatDetail.dart';

class ConversationList extends StatefulWidget {
  String name;
  int id;
  //String messageText;
  //String imageUrl;
  //String time;
  //bool isMessageRead;
  ConversationList({
    required this.name,
    required this.id,
    //required this.messageText,
    //required this.imageUrl,
    //required this.time,
    //required this.isMessageRead
  });
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  //late String users;
  //late final ChatUsers users;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: GestureDetector(
        /*onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatDetailPage();
          }));
        },*/
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(
              user: widget.name,
              id: widget.id,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/proxy/xDI1hdttUx-ZhkbBiuZ0KrJHNmnCc-lBnACO7uufMJfkc5eSjSD0oWg_lz_akzBq5uqfAyCtMOBU7hrLSJBcTNW46As_sxlMZwf7wHWxfts3h3n2yoqOlvPNDw=w1200-h630-p-k-no-nu"),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          /*Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),*/
          ],
        ),
      ),
    );
    //), //gesture detector
    //);
  }
}
