import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget loading() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('Connection Error'),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('No Data Available'),
  );
}

String parseHumanDateTime(String dateTime) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
  DateTime difference = DateTime.now().subtract(timeAgo);
  return timeago.format(difference);
}