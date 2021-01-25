import 'package:flutter/material.dart';
import 'package:flutterwith_mobx/components/widgets.dart';
import 'package:flutterwith_mobx/models/posts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slimy_card/slimy_card.dart';

class UserDetails extends StatefulWidget {
  final Post userDetail;
  UserDetails(this.userDetail);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

List<Marker> _markers = <Marker>[];

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    _markers.add(Marker(
        markerId: MarkerId(widget.userDetail.id.toString()),
        position: LatLng(double.parse(widget.userDetail.address.geo.lat),
            double.parse(widget.userDetail.address.geo.lng)),
        infoWindow: InfoWindow(title: widget.userDetail.name)));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff8f1f1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              SlimyCard(
                color: Color(0xff0f3057),
                width: size.width * 0.95,
                topCardHeight: size.height * 0.5,
                bottomCardHeight: size.height * 0.3,
                borderRadius: 15,
                topCardWidget: userDetailtopCardWidget(
                    context,
                    widget.userDetail.imageUrl,
                    widget.userDetail.name,
                    widget.userDetail.email,
                    widget.userDetail.phone,
                    widget.userDetail.username),
                bottomCardWidget: userDetailbottomCardWidget(
                    widget.userDetail.company.name,
                    widget.userDetail.website,
                    widget.userDetail.company.catchPhrase),
                slimeEnabled: true,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 10, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontFamily: 'Raleway-Bold',
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Color(0xfff05454),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.3,
                width: size.width * 0.95,
                child: GoogleMap(
                    markers: Set<Marker>.of(_markers),
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          double.parse(widget.userDetail.address.geo.lat),
                          double.parse(widget.userDetail.address.geo.lng)),
                      zoom: 14.75,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adress: ",
                      style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Text(
                      widget.userDetail.address.street +
                          " / " +
                          widget.userDetail.address.suite +
                          "\n" +
                          widget.userDetail.address.city +
                          " / " +
                          widget.userDetail.address.zipcode,
                      style: TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget userDetailbottomCardWidget(
    String company, String website, String catchPhrase) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Business Information',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Raleway-Bold"),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 300,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        infoWindowRow("Company Name:", company),
        SizedBox(
          height: 5,
        ),
        infoWindowRow("Web Site:", website),
        SizedBox(
          height: 5,
        ),
        infoWindowRow("Working Area:", catchPhrase),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              FontAwesomeIcons.linkedin,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                  width: 1.5,
                  height: 30,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              FontAwesomeIcons.github,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    ),
  );
}

Widget userDetailtopCardWidget(context, String imagePath, String name,
    String email, String phone, String username) {
  return Stack(
    children: [
      Positioned(
        top: 10,
        left: 10,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 34,
            height: 34,
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: Container(
          width: 34,
          height: 34,
          child: Icon(
            FontAwesomeIcons.solidEnvelope,
            color: Colors.white,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: NetworkImage(imagePath)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontFamily: "Raleway-Bold",
                    color: Colors.white,
                    fontSize: 20),
              ),
              Text(
                " (@" + username + ")",
                style: TextStyle(
                    fontFamily: "Raleway-Regular",
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 17),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            "Email: " + email,
            style: TextStyle(
                fontFamily: "Raleway-Regular",
                color: Colors.white.withOpacity(0.8),
                fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            "Phone: " + phone,
            style: TextStyle(
                fontFamily: "Raleway-Regular",
                color: Colors.white.withOpacity(0.8),
                fontSize: 15),
          ),
          SizedBox(height: 10),
        ],
      ),
    ],
  );
}
