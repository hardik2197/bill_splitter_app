import 'package:bill_splitter_app/components/circle_avatar_widget.dart';
import 'package:bill_splitter_app/constants/constants.dart';
import 'package:bill_splitter_app/getx/homepage_crontroller.dart';
import 'package:bill_splitter_app/screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _addPeopleStatus = true;
  HomePageController _homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildBody(screenSize, context),
    );
  }

  SafeArea _buildBody(Size screenSize, BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _buildAppBar(screenSize),
            SizedBox(
              height: 10,
            ),
            _billingView(screenSize, context),
            SizedBox(
              height: 20,
            ),
            _nearByFriendView(screenSize),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(Size screenSize) {
    return Container(
      height: screenSize.height * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Orix',
                style: TextStyle(color: kMarzipan, fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Bill Splitter',
                style: TextStyle(
                    color: kMarzipan,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            width: screenSize.height * 0.13,
            // width: 90,
            height: screenSize.height * 0.11,
            decoration: BoxDecoration(
                color: kCherryPie,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: kMulledWine,
                    offset: Offset(1, 1),
                    spreadRadius: 5,
                  )
                ],
                border: Border.all(color: Colors.white30, width: 0.5)),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                ClipRRect(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: (screenSize.height * 0.11) / 2.7,
                      // width: screenSize.width / 4,
                      color: kMulledWine,
                      alignment: Alignment.center,
                      child: Text(
                        'Sajon',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(30),
                ),
                Positioned(
                  top: -20,
                  right: 0,
                  left: 0,
                  child: Container(
                      height: screenSize.height / 9,
                      width: screenSize.height / 9,
                      child: Image.asset('assets/images/avatar_1.png')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _billingView(Size screenSize, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 3.0,
          child: Column(
            children: [
              Container(
                height: (screenSize.height / 3.0) / 1.5,
                decoration: BoxDecoration(
                    color: kMarzipan,
                    borderRadius:
                        BorderRadius.circular(screenSize.height * 0.04)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25, vertical: screenSize.height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Bill',
                            style: TextStyle(
                                color: kCherryPie,
                                fontSize: screenSize.height / 35),
                          ),
                          Text(
                            'Split with',
                            style: TextStyle(
                                color: kCherryPie,
                                fontSize: screenSize.height / 35),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => Text(
                          '\$${_homePageController.totalBill.value}',
                          style: TextStyle(
                              color: kCherryPie,
                              fontSize: screenSize.height / 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.025,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondPage()));
                        },
                        child: Container(
                          height: screenSize.height / 13,
                          width: screenSize.width / 3.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  offset: Offset(3, 10),
                                  blurRadius: 15,
                                )
                              ],
                              color: kMulledWine,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Split Now',
                            style: TextStyle(
                                color: kMarzipan,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _previousSplitView(screenSize)
            ],
          ),
        ),
        _splitWith(screenSize),
      ],
    );
  }

  Container _previousSplitView(Size screenSize) {
    return Container(
      height:
          ((screenSize.height / 3.0) - ((screenSize.height / 3.0) / 1.5)) - 20,
      decoration: BoxDecoration(
          color: kCherryPie,
          borderRadius: BorderRadius.circular(screenSize.height * 0.03)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12, vertical: screenSize.height * 0.007),
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(4, 8),
                  spreadRadius: 1,
                  blurRadius: 10)
            ]),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: kMulledWine,
              child: Icon(
                Icons.error_outline,
                color: kMarzipan,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your previous split',
                style: TextStyle(color: kMarzipan, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\$678.56',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Positioned _splitWith(Size screenSize) {
    return Positioned(
      bottom: (((screenSize.height / 3.0) - ((screenSize.height / 3.0) / 1.5)) -
              20) /
          1.5,
      right: 30,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _addPeopleStatus
            ? screenSize.height / 4.35
            : ((screenSize.height / 4.35) / 5) + 20,
        width: _addPeopleStatus ? screenSize.width / 5 : screenSize.width / 6,
        padding: EdgeInsets.symmetric(
            horizontal: _addPeopleStatus ? 20 : 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              bottom: _addPeopleStatus
                  ? (((screenSize.height / 4.35) / 5) * 4) - 24
                  : 0,
              left: 0,
              right: 0,
              child: CircleAvatarWidget(
                backgroundColor: Color(0xFF90B5DF),
                image: 'assets/images/avatar_2.png',
                borderColor: Colors.white,
                borderWidth: 1,
                size: (screenSize.height / 4.35) / 5,
              ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: 0,
                right: 0,
                bottom: _addPeopleStatus
                    ? (((screenSize.height / 4.35) / 5) * 3) - 18
                    : 0,
                child: CircleAvatarWidget(
                  backgroundColor: Color(0xFFB59AEF),
                  image: 'assets/images/avatar_3.png',
                  borderWidth: 1,
                  borderColor: Colors.white,
                  size: (screenSize.height / 4.35) / 5,
                )),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: 0,
              right: 0,
              bottom: _addPeopleStatus
                  ? (((screenSize.height / 4.35) / 5) * 2) - 12
                  : 0,
              child: CircleAvatarWidget(
                backgroundColor: kWaxFlower,
                image: 'assets/images/avatar_4.png',
                borderWidth: 1,
                borderColor: Colors.white,
                size: (screenSize.height / 4.35) / 5,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: 0,
              right: 0,
              bottom:
                  _addPeopleStatus ? ((screenSize.height / 4.35) / 5) - 6 : 0,
              child: CircleAvatarWidget(
                backgroundColor: Color(0xFFCECCBB),
                image: 'assets/images/avatar_5.png',
                borderWidth: 1,
                borderColor: Colors.white,
                size: (screenSize.height / 4.35) / 5,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _addPeopleStatus = !_addPeopleStatus;
                  });
                },
                child: Container(
                    height: (screenSize.height / 4.35) / 5,
                    width: (screenSize.height / 4.35) / 5,
                    decoration: BoxDecoration(
                        color: kWaxFlower,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Icon(
                      _addPeopleStatus ? Icons.add : Icons.clear,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _nearByFriendView(Size screenSize) {
    return Expanded(
      child: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: kCherryPie,
              ),
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                child: Stack(
                  children: [
                    Positioned(
                      right: 20,
                      top: 20,
                      child: Row(
                        children: [
                          Text(
                            'Nearby Friends',
                            style: TextStyle(
                                color: kMarzipan, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'See all',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 12,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Container(
                            height: ((screenSize.height / 4.35) / 5) * 2.7,
                            width: ((screenSize.height / 4.35) / 5) * 1.5,
                            decoration: BoxDecoration(
                                color: kMulledWine,
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.all(5),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        CircleAvatarWidget(
                                            backgroundColor:
                                                friendListName[index]['color'],
                                            image:
                                                '${friendListName[index]['imgUrl']}',
                                            borderWidth: 0,
                                            borderColor: Colors.transparent,
                                            size:
                                                (screenSize.height / 4.35) / 5),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${friendListName[index]['name']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: kMarzipan,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 110,
                      left: 20,
                      child: Text(
                        'Recently Split',
                        style: TextStyle(
                            color: kMarzipan, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 5,
                        child: Row(
                          children: List.generate(
                              4,
                              (index) => Container(
                                    width: (screenSize.width / 4) - 15,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: recentlyList[index]
                                                    ['color'],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1)),
                                            child: Image.asset(
                                              '${recentlyList[index]['imgUrl']}',
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${recentlyList[index]['name']}',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  )),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 4,
            child: Container(
              width: screenSize.width * 0.3 - 30,
              height: (screenSize.height * 0.3) / 2.7,
              decoration: BoxDecoration(
                  color: kMarzipan, borderRadius: BorderRadius.circular(25)),
              child: Icon(
                Icons.search,
                color: kMulledWine,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double radius = 0.3;
    double factor = 30;

    Path path = Path();

    path.moveTo(size.width * radius + factor, 0);
    path.lineTo(size.width - factor, 0);
    path.quadraticBezierTo(size.width, 0, size.width, factor);
    path.lineTo(size.width, size.height - factor);
    path.quadraticBezierTo(
        size.width, size.height, size.width - factor, size.height);
    path.lineTo(factor, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - factor);
    path.lineTo(0, size.height - (size.height * 0.7) + factor);
    path.quadraticBezierTo(0, size.height - (size.height * 0.7), factor,
        size.height - (size.height * 0.7));
    path.lineTo(size.width * radius - factor, size.height * radius);
    path.quadraticBezierTo(size.width * radius, size.height * radius,
        size.width * radius, size.height - (size.height * 0.7) - factor);
    path.lineTo(size.width * radius, factor);
    path.quadraticBezierTo(
        size.width * radius, 0, size.width * radius + factor, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
