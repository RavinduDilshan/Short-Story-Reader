import 'dart:convert';

import 'package:http/http.dart';
import 'package:sinhala_short_stories/helpers/functions.dart';
import './posts_model.dart';

class HttpService {
/*   final Uri _uri =
      Uri.parse('https://mawathe-geethaya-api.herokuapp.com/api/test/story'); */

  Future<List<Post>?> getPosts() async {
    final uri = buildUri('storyList');
    if (uri == null) return null;

    Response res = await get(uri);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

/*   Future<Post> getStoryById(int id) async {
    Uri uri = Uri.parse(
        'https://mawathe-geethaya-api.herokuapp.com/api/test/story/$id"');
    Response res = await get(uri);
    var data = json.decode(res.body);
    var finalDAta = data[0];
    Post story = Post(
        id: finalDAta['id'] as int,
        /*   author: finalDAta['author'],
        rating: finalDAta['rating'],*/
        image: finalDAta['image'],
        story: finalDAta['story'],
        title: finalDAta['title']);

    return story;
  } */
}
