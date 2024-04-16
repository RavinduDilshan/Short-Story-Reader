import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinhala_short_stories/posts_model.dart';

class FirebaseService {
  //get firebase collection instant
  CollectionReference stories =
      FirebaseFirestore.instance.collection('stories');
  //get all story list
  Future<List<Post>?> getAllStoriesList() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await stories.get();

    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<Post>? allStoryList = querySnapshot.docs
        .map((doc) => Post(
            id: doc.reference.id,
            author: doc['author'],
            image: doc['image'],
            story: doc['story'],
            title: doc['title']))
        .toList();

    return allStoryList;
  }

  //get a single story by id
  Future<Post?> getStoryById(String storyId) async {
    DocumentSnapshot story = await stories.doc(storyId).get();
    Post post = Post(
        id: storyId,
        author: story['author'],
        image: story['image'],
        story: story['story'],
        title: story['title']);
    return post;
  }
}
