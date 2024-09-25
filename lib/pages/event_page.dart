import 'package:flutter/material.dart';
import '../models/event_item.dart';
import '../widgets/event_grid.dart';

class EventGridPage extends StatelessWidget {
  final List<EventItem> events = [
    EventItem(name: 'Activity', icon: Icons.extension),
    EventItem(name: 'Behavior', icon: Icons.spa),
    EventItem(name: 'Bottle', icon: Icons.local_drink),
    EventItem(name: 'Cup', icon: Icons.coffee),
    EventItem(name: 'Diaper', icon: Icons.baby_changing_station),
    EventItem(name: 'Health', icon: Icons.local_hospital),
    EventItem(name: 'Incident', icon: Icons.warning),
    EventItem(name: 'Lesson', icon: Icons.book),
    EventItem(name: 'Medicine', icon: Icons.medical_services),
    EventItem(name: 'Milestone', icon: Icons.flag),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: EventGrid(events: events),
      ),
    );
  }
}
