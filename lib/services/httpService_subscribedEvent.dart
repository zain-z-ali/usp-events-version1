import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/models/subscription_model.dart';

class HttpServiceCreateSubscriptionPost {
  //int event_id = globalEventId;
  String subscriptionPostURL = "http://10.0.2.2:8000/api/event-subscription";

  HttpServiceCreateSubscriptionPost() {
    this.subscriptionPostURL = "http://10.0.2.2:8000/api/event-subscription";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  createSubscriptionPost({required Map body}) async {
    try {
      return await http.post(Uri.parse(subscriptionPostURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'Could not update subscription!';
    }
  }
}

class HttpServiceSubscribedEventSpecific {
  final String eventsURL =
      "http://10.0.2.2:8000/api/event-subscription/1"; //where 1 is user ID - update with authentication

  Future<List<Event>> getSubscribedEvents() async {
    http.Response res = await http.get(Uri.parse(eventsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Event> event = body
          .map(
            (dynamic item) => Event.fromJson(item),
          )
          .toList();
      return event;
    } else {
      throw Exception("Unable to retrieve events.");
    }
  }
}

class HttpServiceDeleteEventSubscription {
  String eventSubDelURL =
      "http://10.0.2.2:8000/api/event-subscription/delete"; //where 1 is user ID - update with authentication

  Future<void> deletePost(int userID, eventID) async {
    http.Response res = await http.delete(Uri.parse(
        "http://10.0.2.2:8000/api/event-subscription/delete/${userID}/${eventID}"));

    if (res.statusCode == 200) {
      print("Subscription deleted");
    } else {
      throw "Unable to delete subscription";
    }
  }
}

class HttpServiceEventSubscription {
  final String subscriptionURL =
      "http://10.0.2.2:8000/api/event-subscription/is-sub/"; //where 1 is user ID - update with authentication

  Future<Subscription> getSubscription(int userID, eventID) async {
    http.Response res = await http.get(Uri.parse(
        "http://10.0.2.2:8000/api/event-subscription/is-sub/${userID}/${eventID}"));

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      Subscription subscription = body.map(
        (dynamic item) => Subscription.fromJson(item),
      );
      return subscription;
    } else {
      throw Exception("Unable to get subscription status.");
    }
  }
}
