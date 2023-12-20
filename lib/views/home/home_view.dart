import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journal/constants/app_colors.dart';

import '../../centered_view/centered_view.dart';
import '../../model/thought.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
      body: CenteredView(
        child: thoughts(),
      ),
    );
  }

  Widget getList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        child: Text('Hi'),
      ),
    );
  }

  List<Thought> allThoughts = [];

  Widget thoughts() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc('dev')
          .collection('thoughts')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          //place your code here. It will prevent double data call.

          allThoughts = [];
          for (var doc in snapshot.data!.docs) {
            allThoughts.add(Thought.fromJson(doc.data()));
          }

          debugPrint(allThoughts.length.toString());

          return ListView.builder(
            itemCount: allThoughts.length,
            itemBuilder: (context, index) {
              return getItem(allThoughts.elementAt(index), context);
            },
          );
        } else if (snapshot.hasError) {
          debugPrint(
              'Error in snapshot of Home : ${snapshot.error.toString()}');
          return const Center(
            child: Text('Error occurred.'),
          );
        } else {
          //meaning stream.connectionState == ConnectionState.waiting
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getItem(Thought thought, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 8),
      padding: const EdgeInsets.only(top: 11, bottom: 11, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: getItemContent(thought),
    );
  }

  Widget getItemContent(Thought thought) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          thought.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          thought.thought,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 5),
        // Row(
        //   children: [
        //     Expanded(
        //       child: getTags(thought),
        //     ),
        //     Text(
        //       // '${TimeHelper.dateTimeToTimeString(thought.timestamp.toDate())} ${DateConverter.getDateSleek(thought.timestamp.toDate())}',
        //       '${DateConverter.getDateSleek(thought.timestamp.toDate())} - ${TimeHelper.dateTimeToTimeString(thought.timestamp.toDate())}',
        //       style: const TextStyle(
        //         color: Colors.black,
        //         fontSize: 13,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
