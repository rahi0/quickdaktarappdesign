import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  PageController controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: PageView(
                controller: controller,
                //scrollDirection: Axis.vertical,
                //pageSnapping: false,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    color: Colors.yellow,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    color: Colors.black,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    color: Colors.teal,
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}