
class Post {

  final int id;
  final String author;
  final int rating;
  final String image;
  final String story;
  final String title;

  Post({
    required this.id,
    required this.author,
    required this.rating,
    required this.image,
    required this.story,
     required this.title,

  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      author: json['author'] as String,
      rating: json['rating'] as int,
      image: json['image'] as String,
      story: json['story'] as String,
       title: json['title'] as String
    );
  }
}