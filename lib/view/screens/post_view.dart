import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterwith_mobx/view-model/post_view_model.dart';
import 'package:flutterwith_mobx/view/screens/user_Detail.dart';

class PostView extends StatelessWidget {
  final _viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    _viewModel.getAllPost();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff05454),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.15,
              width: size.width,
              color: Color(0xfff05454),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "People",
                      style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffe8e8e8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Observer(builder: (_) {
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _viewModel.posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (_viewModel.posts.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetails(
                                        _viewModel.posts[index].id,
                                        _viewModel.posts[index])));
                          },
                          child: ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  _viewModel.posts[index].imageUrl,
                                  fit: BoxFit.cover,
                                  height: 70,
                                )),
                            title: Text(
                              _viewModel.posts[index].name,
                            ),
                            subtitle: Text(_viewModel.posts[index].email),
                            trailing: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xff222831),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
