import 'package:flutter/cupertino.dart';
import 'package:sinhala_short_stories/helpers/db_helper.dart';
import '../models/favorite_story_model.dart';

class FavoriteStories with ChangeNotifier {
  List<FavoriteStory> _favoriteList = [];

  List<FavoriteStory> get getFavoriteStorie {
    return [..._favoriteList];
  }

  Future<void> addFavorite(
      String title, String id, String author, String image) async {
    var FavoriteItem =
        FavoriteStory(title: title, id: id, author: author, image: image);
    _favoriteList.add(FavoriteItem);

    DbHelper.insert('favorite_stories', {
      'id': FavoriteItem.id,
      'title': FavoriteItem.title,
      'author': FavoriteItem.author,
      'image': FavoriteItem.image
    });

    notifyListeners();
  }

  Future<void> fetchFavorites() async {
    final dataList = await DbHelper.getData('favorite_stories');

    _favoriteList = dataList
        .map((item) => FavoriteStory(
            title: item['title'],
            id: item['id'],
            author: item['author'],
            image: item['image']))
        .toList();
    notifyListeners();
  }

  bool checkFavorite(String id) {
    var isFavorite = _favoriteList.where((element) => element.id == id);
    if (isFavorite.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> deleteFavorite(String id) async {
    _favoriteList.removeWhere((element) => element.id == id);

    notifyListeners();
    DbHelper.delete('favorite_stories', id);
  }
}
