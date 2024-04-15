import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinhala_short_stories/posts_model.dart';

class FirebaseService {
  Future<List<Post>?> getAllStoriesList() async {
    CollectionReference stories =
        FirebaseFirestore.instance.collection('stories');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await stories.get();

    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<Post>? allStoryList = querySnapshot.docs
        .map((doc) => Post(
            id: doc['id'],
            image: doc['image'],
            story: doc['story'],
            title: doc['title']))
        .toList();

    return allStoryList;
  }
}
