import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterwith_mobx/view-model/post_view_model.dart';

class PostView extends StatelessWidget {
  final _viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ecy'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (_) {
            return _viewModel.isServiceRequestLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : SizedBox();
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.getAllPost();
        },
      ),
      body: Center(child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _viewModel.posts.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(
              _viewModel.posts[index].name,
            ),
            subtitle: Text(_viewModel.posts[index].email),
            trailing: Text(_viewModel.posts[index].address.city),
          ),
        );
      })),
    );
  }
}
