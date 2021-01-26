import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutterwith_mobx/models/posts.dart';
import 'package:mobx/mobx.dart';
part 'post_view_model.g.dart';

/*
    Last Update: 26.01.2021, Tuesday.
    Changes: Added comment lines.
*/

class PostViewModel = _PostViewModelBase with _$PostViewModel;

abstract class _PostViewModelBase with Store {
  //We must control observable variable state, in this case its posts list.
  @observable
  List<Post> posts = [];

  //Define my firebase realtime database base url.
  final url = "https://flutterwithmobx-default-rtdb.firebaseio.com/Users.json";

//An action is we get datas from firebase with Dio().
//My sample .json file from "jsonplaceholder", in project main directory.
//I configured that file for added random user images.
  @action
  Future<void> getAllPost() async {
    final response = await Dio().get(url);

    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List;
      posts = responseData.map((e) => Post.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
  }
}
