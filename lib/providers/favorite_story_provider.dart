import 'package:flutter/cupertino.dart';
import '../models/favorite_story_model.dart';

class FavoriteStories with ChangeNotifier {
  List<FavoriteStory> _favoriteList = [];

  List<FavoriteStory> get getFavoriteStorie {
    return [..._favoriteList];
  }

  void addFavorite(String title, int id) {
    var _FavoriteItem = FavoriteStory(title, id);
    _favoriteList.add(_FavoriteItem);
    notifyListeners();
    print(_favoriteList[0].title);
  }
}
