import 'package:flutter/cupertino.dart';
import '../models/favorite_story_model.dart';

class FavoriteStories with ChangeNotifier {
  List<FavoriteStory> _favoriteList = [
    FavoriteStory('test', 1),
    FavoriteStory('test2', 2)
  ];

  List<FavoriteStory> get getFavoriteStorie {
    return [..._favoriteList];
  }
}
