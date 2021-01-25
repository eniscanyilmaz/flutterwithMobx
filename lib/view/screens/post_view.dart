import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterwith_mobx/view-model/post_view_model.dart';
import 'package:flutterwith_mobx/view/screens/user_Detail.dart';

class PostView extends StatelessWidget {
  final controller = ScrollController();
  final _viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    _viewModel.getAllPost();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            width: size.width,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 15),
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
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Observer(builder: (_) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _viewModel.posts.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDetails(_viewModel.posts[index].id)));
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
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 23,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
