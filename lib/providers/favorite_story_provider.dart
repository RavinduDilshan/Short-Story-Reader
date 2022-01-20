import 'package:flutter/cupertino.dart';
import 'package:sensor_app/helpers/db_helper.dart';
import '../models/favorite_story_model.dart';

class FavoriteStories with ChangeNotifier {
  List<FavoriteStory> _favoriteList = [];

  List<FavoriteStory> get getFavoriteStorie {
    return [..._favoriteList];
  }

  void addFavorite(String title, String id, String author) {
    var _FavoriteItem =
        FavoriteStory(title: title, id: id, author: author);
    _favoriteList.add(_FavoriteItem);

    DbHelper.insert('favorite_stories', {
      'id': _FavoriteItem.id,
      'title': _FavoriteItem.title,
      'author': _FavoriteItem.author
    });

    notifyListeners();
  }

  Future<void> fetchFavorites() async {
    final dataList = await DbHelper.getData('favorite_stories');

    _favoriteList = dataList
        .map((item) => FavoriteStory(
            title: item['title'], id: item['id'], author: item['author']))
        .toList();

    notifyListeners();
  }
}
