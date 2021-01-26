import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterwith_mobx/view-model/post_view_model.dart';
import 'package:flutterwith_mobx/view/screens/user_Detail.dart';

/*
    Last Update: 26.01.2021, Tuesday.
    Changes: Added comment lines. / Segmentation code into widgets. / Added comment lines.
*/

class PostView extends StatelessWidget {
  final _viewModel = PostViewModel();

  @override
  Widget build(BuildContext context) {
    //Firstly get datas with opening this page.
    //Wrap listwiew with observer and listen to changes in bodyContainer widget.
    _viewModel.getAllPost();
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xff0f3057),
          extendBodyBehindAppBar: true,
          body: Column(
            children: [
              customAppBar(size),
              bodyContainer(size),
            ],
          ),
        ),
      ],
    );
  }

  Widget customAppBar(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.15,
      width: size.width,
      color: Color(0xff0f3057),
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
    );
  }

  Widget bodyContainer(size) {
    return Row(
      children: [
        Container(
          height: size.height * 0.85,
          width: size.width * 0.98,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
          child: Observer(builder: (_) {
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: _viewModel.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return listViewRowItem(context, index);
                });
          }),
        ),
      ],
    );
  }

  Widget listViewRowItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetails(_viewModel.posts[index])));
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
        trailing: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Color(0xff00587a),
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
