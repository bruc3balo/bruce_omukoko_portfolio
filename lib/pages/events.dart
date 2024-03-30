import 'package:flutter/material.dart';

class Event {
  final String name;
  final String about;
  final String content;
  final DateTime date;

  const Event({
    required this.name,
    required this.about,
    required this.content,
    required this.date,
  });
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
