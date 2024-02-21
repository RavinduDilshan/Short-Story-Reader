import 'package:flutter/cupertino.dart';
import 'package:sinhala_short_stories/helpers/db_helper.dart';
import '../models/favorite_story_model.dart';

class FavoriteStories with ChangeNotifier {
  List<FavoriteStory> _favoriteList = [];

  List<FavoriteStory> get getFavoriteStorie {
    return [..._favoriteList];
  }

  Future<void> addFavorite(String title, String id, String author) async {
    var _FavoriteItem = FavoriteStory(title: title, id: id, author: author);
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

  bool checkFavorite(String id) {
    var isFavorite = _favoriteList.where((element) => element.id == id);
    if (isFavorite.length == 0) {
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
