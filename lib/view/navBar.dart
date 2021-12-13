import 'package:flutter/material.dart';
import 'package:version1_0/view/FeedbackPage.dart';
import 'package:version1_0/view/Profile.dart';
import 'package:version1_0/view/eventInfo.dart'; //event info page display
import 'package:version1_0/view/Quiz.dart';
import 'package:version1_0/view/galleryInfo.dart';
import 'package:version1_0/view/newsInfo.dart'; //news info page display
import 'package:version1_0/view/podcast.dart';
import 'package:version1_0/view/polls.dart';
import 'map.dart';



void _navigateToEventInfo(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EventInfo()));
}

void _navigateToNewsInfo(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => NewsInfo()));
}

/* void _navigateToSpeakers(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PostsPage()));
} */

void _navigateToMap(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MapScreen()));
}

void _navigateToFeedback(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubmitFeedback()));
}

void _navigateToQuiz(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SubmitQuiz()));
}
//change to schedule page

void _navigateToPodcast(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Podcast()));
}

void _navigateToPolls(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PollsDemo()));
}

void _navigateToGallery(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => GalleryInfo()));
}

void _navigateToProfile(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Profile()));
}

String profilePic =
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80';
String accountHeaderImage =
    'https://www.wallpaperflare.com/static/864/770/356/minimalism-think-lightbulb-simple-background-wallpaper.jpg';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Sarah Abs'),
            accountEmail: Text('sarah.abs@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  profilePic,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover, //makes the image cover the whole circle
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(accountHeaderImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            /// first tile
            leading: Icon(Icons.info),
            title: Text('Event Info'),
            onTap: () => {_navigateToEventInfo(context)},
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Event Theme'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.forum_rounded),
            title: Text('Forum'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.feed_rounded),
            title: Text('News Feed'),
            onTap: () => {_navigateToNewsInfo(context)},
          ),
          ListTile(
            leading: Icon(Icons.schedule_rounded),
            title: Text('Schedule'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Speakers'),
            onTap: () => {null},
          ),
          ListTile(
            leading: Icon(Icons.quiz_rounded),
            title: Text('Quiz'),
            onTap: () => {_navigateToQuiz(context)},
          ),
          ListTile(
            leading: Icon(Icons.poll_rounded),
            title: Text('Polls'),
            onTap: () => {_navigateToPolls(context)},
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () => {_navigateToGallery(context)},
          ),
          ListTile(
            leading: Icon(Icons.podcasts),
            title: Text('Podcast'),
            onTap: () => {_navigateToPodcast(context)},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: () => {_navigateToMap(context)},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () => {_navigateToProfile(context)},
          ),
          ListTile(
            leading: Icon(Icons.feed_rounded),
            title: Text('Feedback'),
            onTap: () => {_navigateToFeedback(context)},
            // onTap: () => null,
          ),
        ],
      ),
    );
  }
}
