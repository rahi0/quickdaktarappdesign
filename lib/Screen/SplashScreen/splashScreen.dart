import 'package:flutter/material.dart';
import 'package:quick_daktar/Screen/IntroPage/IntroPage.dart';
import 'package:quick_daktar/customPlugin/routeTransition/routeAnimation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  // void mylistener(status) {
  //   if (status == AnimationStatus.completed) {
  //     _animation.removeStatusListener(mylistener);
  //     _animationController.reset();
  //     _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       parent: _animationController,
  //       curve: Curves.fastOutSlowIn,
  //     ));
  //     _animationController.forward();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    )) ;
     // ..addStatusListener(mylistener);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            ////// Animated Part Start ///////////
            Expanded(
               child: Container(
               // color: Colors.red,
                 //height:(MediaQuery.of(context).size.height / 2),
                        width: MediaQuery.of(context).size.width,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform(
                        transform:
                            Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
                        child: Center(
                          child: Container(
                            height: 130.0,
                            width: 130.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/img/searchDoc.png'),
                              fit: BoxFit.fill
                              )),
                          ),
                        ),
                      ),
                ),
                 ////// Animated Part End /////////// 
                  
              ),
            ),


             ////// Bottom Part Start ///////////
            Container(
             // color: Colors.yellow,
               height:(MediaQuery.of(context).size.height / 3) + 30,
               width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ///////////////// Log In Button  Start///////////////
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.topLeft,
                              stops: [0.1, 0.4, 0.6, 0.9],
                              colors: [
                                Color(0xFF1186FF),
                                Colors.blue,
                                Colors.blue[400],
                                Color(0xFF30C9FF)
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: FlatButton(
                            onPressed: (){
                              Navigator.push( context, SlideLeftRoute(page: IntroPage()));

                            },

                            child: Container(
                              //width: 150,
                              //color: Colors.grey,
                              child: Text(
                                 'Get Started',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                  ),
                              ),
                            ),
                            color: Colors.transparent,
                            //elevation: 4.0,
                            //splashColor: Colors.blueGrey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          )),
                           ///////////////// Log In Button  End///////////////
                        
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Color(0XFFABB2BF),
                                  fontSize: 14.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),

                            Container(
                              child: Text(
                                " Log In",
                                style: TextStyle(
                                  color: Color(0XFF0E7EFF),
                                  fontSize: 14.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                            ],
                          ),
                        )
                    ],
                  ),
            )

            ////// Bottom Part End ///////////
          ],
        ),
      ),
    );
  }
}