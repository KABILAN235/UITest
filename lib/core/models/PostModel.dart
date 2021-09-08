class PostModel {
  final DateTime postedTime;
  final int likes;
  final int comments;
  final double engagement;
  final String photoURL;

  PostModel(
      {required this.postedTime,
      required this.likes,
      required this.comments,
      required this.engagement,
      required this.photoURL});
}
