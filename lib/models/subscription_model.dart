import 'package:version1_0/services/httpService_subscribedEvent.dart';

class Subscription {
  final int user_id;
  final int event_id;
  final int event_subscription;

  Subscription({
    required this.user_id,
    required this.event_id,
    required this.event_subscription,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      user_id: json['user_id'] as int,
      event_id: json['event_id'] as int,
      event_subscription: json['event_subscription'] as int,
    );
  }

  Map toMap() {
    var map = new Map();
    map["user_id"] = user_id;
    map["event_id"] = event_id;
    map["event_subscription"] = event_subscription;

    return map;
  }

  bool getStatus(int userID, int eventID) {
    //check status
    bool status;

    final HttpServiceEventSubscription httpServiceGetSubscription =
        HttpServiceEventSubscription();

    Future<Subscription> subscription =
        httpServiceGetSubscription.getSubscription(userID, eventID);
    Subscription newSub = subscription as Subscription;

    if (newSub.event_subscription == 1) {
      status = true;
    } else {
      status = false;
    }

    return status;
  }
}
