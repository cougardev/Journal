import 'package:cloud_firestore/cloud_firestore.dart';

class Thought {
  String title;
  String thought;
  List<String> tags;
  Timestamp timestamp;
  String id;

  Thought({
    required this.title,
    required this.thought,
    required this.tags,
    required this.timestamp,
    required this.id,
  });

  factory Thought.fromJson(Map<String, dynamic> json) => Thought(
        title: json['title'],
        thought: json['thought'],
        tags: List.from(json['tags']),
        timestamp: json["timestamp"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'thought': thought,
        "tags": tags,
        'timestamp': timestamp,
        'id': id,
      };

  // List<Tag> toTagList(WidgetRef ref) {
  //   if (tags.isEmpty) {
  //     return [];
  //   } else {
  //     List<Tag> list = [];
  //     for (var tag in tags) {
  //       list.add(ref.read(thoughtRiver).allTags.firstWhere((element) => element.id == tag));
  //     }
  //     return list;
  //   }
  // }
}
