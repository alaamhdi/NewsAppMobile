import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutterappparctice/models/post.dart';
import 'package:flutterappparctice/utilities/api_Utilities.dart';

class PostsAPI {

  Future<List<Post>> fechwhatsnews() async {
    String whatsNewApi = base_api + what_news_api;
    var response = await http.get(whatsNewApi);
    List<Post> posts = List<Post>();
    var jsondata = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var data = jsondata['data'];

      for (var item in data) {
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"],
            // featuredImage:"https://www.iraqmotor.com/img/iraqflagrectangle.png",
            featuredImage: item["featured_image"].toString(),
            votedUp: item["voted_up"],
            votedDown: item["voted_down"],
            userId: item["user_id"],
            categoryId: item["category_id"]

        );
        posts.add(post);
      }
    }
    return posts;
  }


  Future<List<Post>> fechRecentUpdate() async {
    String recentUpdate = base_api + Recnet_update_api;
    var response = await http.get(recentUpdate);
    List<Post> posts = List<Post>();
    var jsondata = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var data = jsondata['data'];

      for (var item in data) {
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"],
            // featuredImage:"https://www.iraqmotor.com/img/iraqflagrectangle.png",
            featuredImage: item["featured_image"].toString(),
            votedUp: item["voted_up"],
            votedDown: item["voted_down"],
            userId: item["user_id"],
            categoryId: item["category_id"]

        );
        posts.add(post);
      }
    }
    return posts;
  }

  Future<List<Post>> fechPopular() async {
    String recentUpdate = base_api + popular_api;
    var response = await http.get(recentUpdate);
    List<Post> posts = List<Post>();
    var jsondata = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var data = jsondata['data'];

      for (var item in data) {
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"],
            // featuredImage:"https://www.iraqmotor.com/img/iraqflagrectangle.png",
            featuredImage: item["featured_image"].toString(),
            votedUp: item["voted_up"],
            votedDown: item["voted_down"],
            userId: item["user_id"],
            categoryId: item["category_id"]

        );
        posts.add(post);
      }
    }
    return posts;
  }
}