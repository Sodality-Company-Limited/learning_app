import 'package:flutter/material.dart';
import 'package:learning_app/pages/activity_page.dart';
import 'package:learning_app/pages/home_page.dart';
import 'package:learning_app/pages/login_page.dart';
import 'package:learning_app/pages/post_page.dart';
import '../models/event_item.dart';
import '../pages/event_card.dart';

class EventGrid extends StatelessWidget {
  final List<EventItem> events;

  EventGrid({required this.events});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: events.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showEventPagePopup(context, events[index]);
          },
          child: EventCard(event: events[index]),
        );
      },
    );
  }

  void _showEventPagePopup(BuildContext context, EventItem event) {
    Widget eventPage;
    switch (event.name) {
      case 'Activity':
        eventPage = ActivityPage();
        break;
      case 'Behavior':
        eventPage = const PostPage();
        break;
      case 'Bottle':
        eventPage = const LoginPage();
        break;

      default:
        eventPage = const HomePage();
    }

    print('${event.name} tapped1');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: eventPage,
        );
      },
    );
  }
}
