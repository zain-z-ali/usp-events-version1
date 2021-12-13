import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/session_model.dart';
import 'package:version1_0/view/events.dart';

class HttpServiceSession {
  int event_id = globalEventId;
  String sessionsURL = "http://10.0.2.2:8000/api/sessions";

  HttpServiceSession() {
    this.sessionsURL = "http://10.0.2.2:8000/api/sessions/$event_id";
  }

  Future<List<Session>> getSessions() async {
    http.Response res = await http.get(Uri.parse(sessionsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Session> session = body
          .map(
            (dynamic item) => Session.fromJson(item),
          )
          .toList();
      return session;
    } else {
      throw Exception("Unable to retrieve sessions.");
    }
  }
}

class HttpServiceAttendingSession {
  String sessionsURL = "http://10.0.2.2:8000/api/session/attend/";

  /*HttpServiceAttendingSession() {
    this.sessionsURL = "http://10.0.2.2:8000/api/sessions/$event_id";
  }*/

  Future<List<Session>> getAttendingSessions(int userID) async {
    sessionsURL = "http://10.0.2.2:8000/api/session/attend/$userID";
    http.Response res = await http.get(Uri.parse(sessionsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Session> session = body
          .map(
            (dynamic item) => Session.fromJson(item),
          )
          .toList();
      return session;
    } else {
      throw Exception("Unable to retrieve sessions.");
    }
  }
}

class HttpServiceInterestedSession {
  String sessionsURL = "http://10.0.2.2:8000/api/session";

  /* HttpServiceInterestedSession() {
    this.sessionsURL = "http://10.0.2.2:8000/api/session/interest/";
  }*/

  Future<List<Session>> getInterestedSessions(int userID) async {
    sessionsURL = "http://10.0.2.2:8000/api/session/interest/$userID";

    http.Response res = await http.get(Uri.parse(sessionsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Session> session = body
          .map(
            (dynamic item) => Session.fromJson(item),
          )
          .toList();
      return session;
    } else {
      throw Exception("Unable to retrieve sessions.");
    }
  }
}

class HttpServiceAttendingSessionPost {
  //int event_id = globalEventId;
  String attendingSessionPostURL = "http://10.0.2.2:8000/api/session/attend";

  HttpServiceAttendingSessionPost() {
    this.attendingSessionPostURL = "http://10.0.2.2:8000/api/session/attend";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  createAttendingSessionPost({required Map body}) async {
    try {
      return await http.post(Uri.parse(attendingSessionPostURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'Could not update session attendance!';
    }
  }
}

class HttpServiceRemoveAttendance {
  String removeAttendanceURL =
      "http://10.0.2.2:8000/api/session/attend/delete"; //where 1 is user ID - update with authentication

  Future<void> removeAttendance(int userID, sessionID) async {
    http.Response res = await http.delete(Uri.parse(
        "http://10.0.2.2:8000/api/session/attend/delete/$userID/$sessionID"));

    if (res.statusCode == 200) {
      print("Attendance updated");
    } else {
      throw "Unable to update attendance!";
    }
  }
}

class HttpServiceInterestedSessionPost {
  //int event_id = globalEventId;
  String interestPostURL = "http://10.0.2.2:8000/api/session/interest";

  HttpServiceInterestedSessionPost() {
    this.interestPostURL = "http://10.0.2.2:8000/api/session/interest";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  createInterestedSessionPost({required Map body}) async {
    try {
      return await http.post(Uri.parse(interestPostURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'Could not add session interest!';
    }
  }
}

class HttpServiceRemoveInterest {
  String removeInterestURL =
      "http://10.0.2.2:8000/api/session/interest/delete"; //where 1 is user ID - update with authentication

  Future<void> removeInterest(int userID, sessionID) async {
    http.Response res = await http.delete(Uri.parse(
        "http://10.0.2.2:8000/api/session/interest/delete/$userID/$sessionID"));

    if (res.statusCode == 200) {
      print("Interest removed");
    } else {
      throw "Unable to update interest!";
    }
  }
}
