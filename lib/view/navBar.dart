import 'package:flutter/material.dart';
import 'package:version1_0/view/eventInfo.dart'; //event info page display
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/speaker.dart';

void _navigateToEventInfo(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EventInfo()));
}

void _navigateToSpeakers(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PostsPage()));
}

//String profilePic
// 'data:image/jpeg;base64,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';
String profilePic =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjnU9SyLDm--kT_AQMN3mj8l9xAKH7YYwqGg&usqp=CAU';
//String accountHeaderBackground =
//    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARwAAACxCAMAAAAh3/JWAAAA21BMVEXUpyr////n6Ol6foRfTxWhgSHTpSCYeh+LcB2CahtXSRO0jyTbrSvWqzPVpyrWqSpqVhfSoxTRoACXm6Hb3d+DiI7U1dfisSwvLQ/kxX336MP88tqHi5TjxHjy9fn///RvdX3Dx87/+Obfvmmoq69kanLw3bFaYWqPk5ixtLjp0ZvZsUPLzM758t/atFH67M4oJgw/SVW9v8IyPUns7e8ADycVJTRHT1qdoKQjLjtdZG4AAABOVl/39e/r0ZChpq/S0szh3tJATmGQbgC/mCJDPBQ3MQ5LPxIgIwsFVj9PAAADz0lEQVR4nO3ZXXeaShQGYDY0tD2pcEY+GhMVMBJBSQ1gGmJt05x8nPP/f1EHlUGJvS2eNe9zlWVuZr1r9t4zg6IAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMD/kqGzNd1oeyVHR++avek5N+2ZXb3t1RwVnfUuyI6tft+KbbroMcQjsIGnOqmTubbtZk7aV70Ba3tNR0LvzId+6JLghv5w3sHm4fSZl6U70azjSQNvhnR4NmT59IZvEdJROp7lvM2GyLG8TttraxubB+GhbIjCYC55V9YvKT+cDfF/XMpdWGzUz34XThaNpN46+uVw8rtsiFZDqbcOm4/jRiJju/4zlrrrMFou9qKZ5FrdgxYhSRyOPtivqvjWydJ4vFNXA3nril0FRR2NrYXxVytP7sQvRXAl79bpXliJSMK9i9OxH/pFvZmSh4tu22tsTdfTRPtV09vi3h+nvhaJ32zHkzccnZZDMZqcu9RZReHKKsRu4h1Z2p5jmDQR4ThWlPvFfeY6eV6dC3m7NmV9NOXh1DvHKTT/Nls4kySKtXrnSBsOLytNrcKJgm8uZSkvqWVSXdNtR96y4g257i9xeVT2C3ccOll1ak4KiRsymwdWfcpZRxRlKoXVdooSie8PbDpciUNNWrWfRDwMrmgqbzjmjPz6ULM9Gav3VUq2TzOz7TW2pztyq8lUnnTWiYhsSHNH8rYcPq56NBHziiblDf1OXNPtJfXkHVacPrLrq1Q5unbv5PZI6mwUfUCOeO5K+BXdET1oHJHEDxZr7JzyqrDsiPeZKhw1p3N5R9VWx1Orce6W4VRJrVR8tyo/zvAC2pSVVYfTH8v+YWate0VLtxlOEtKVzGNcYNfDvBlOPryWvuGs6V8otvbDiWL6gqJaY9PNxUqEs0hlvlQ1sFEQ7U6rKJD7Q/AePrFWO+HwqzomVa07ipI6nMSS+sLZpPfKty57G46myn3hbDDM70seTn8TzvK7Ie2z+iFsHi6qcBahxI+jh+g/HpLyY0MZTvbwA1W1S78MiiqcIsGs2mPMfkZVONHPGVrOHvNRq8LxHyV+VT+IPYakluEsaPmIfryPXf8TPJThjIcTXMibOidPT6edzunT8wteAJvMd5WXtpdydAzl7P3WCfpxk/n+w9aNgkneYIiyem17KUeHl9XJ1inKqsn88HELZfWG+e6vrRvsnAZDeT3dekY4TebHvzdeXhFOk/mv8rmknCkIp8l8vjkr/YdhdYDxaQPZAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwB/yC16CVWlMgbA/AAAAAElFTkSuQmCC';
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
            accountName: Text('Pepper Pots'),
            accountEmail: Text('pepper@pots.com'),
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
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.schedule_rounded),
            title: Text('Schedule'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.poll_rounded),
            title: Text('Polls'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Speakers'),
            onTap: () => {_navigateToSpeakers(context)},
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.map_rounded),
            title: Text('Map'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.feed_rounded),
            title: Text('Feedback'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
