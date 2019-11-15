import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:quick_daktar/Navigation/navigation.dart';
import 'package:quick_daktar/customPlugin/routeTransition/routeAnimation.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController(initialPage: 0);



  Container introContainer(String picture, String title, String subtitle, String button) {
    return Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
               // color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    //////////Picture Portion Start ///////
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.height / 2) - 45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(picture),
                              fit: BoxFit.fill)),
                    ),
                     //////////Picture Portion end ///////

                    /////// Bottom Portion Start ////////
                    
                    Container(
                      height:(MediaQuery.of(context).size.height / 2) - 45,
                      width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 20, bottom: 20,),
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ////// Text Start ////////
                    Container(
                      width: MediaQuery.of(context).size.width,
                     // color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: Text(
                                title,
                                //  '${widget.orderedItem.seller.name}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0E7EFF),
                                  fontSize: 21.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                subtitle,
                                //  '${widget.orderedItem.seller.name}',
                                //overflow: TextOverflow.ellipsis,
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    ////// Text End ////////
                    
                    

                Container(
                 // color: Colors.blue,
                  child: Column(
                    children: <Widget>[
                      ///////////////// Log In Button  Start///////////////
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
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

                            },

                            child: Container(
                              //width: 150,
                              //color: Colors.grey,
                              child: Text(
                                 'Sign In',
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
                                "Don't have an account?",
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
                                " Join now",
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
                ),



                //////// Skip/Next Button Start ////////////
                
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  //color: Colors.red,
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: (){
                      print('object');
                      Navigator.pushAndRemoveUntil(context, SlideLeftRoute(page: Navigation()), (e) => false);
                    },
                                      child: Text(
                                  button,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                  ),
                )
                //////// Skip/Next Button End ////////////

               
                  ],
                ),
              ),
                    /////// Bottom Portion end ////////
                  ],
                ),
              );
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: PageIndicatorContainer(
          length: 3,
          shape: IndicatorShape.circle(size: 15,),
          align: IndicatorAlign.center,
          indicatorColor: Colors.grey,
          indicatorSelectorColor: Color(0xFF1186FF),
          indicatorSpace: 10.0,
          child: PageView(
            controller: controller,
            //scrollDirection: Axis.vertical,
            //pageSnapping: false,
            physics: BouncingScrollPhysics(),
            children: <Widget>[

              introContainer("assets/img/intro1.png", "Live talk with doctor", "Any time from any where ", "Skip"),
              introContainer("assets/img/intro2.png", "Get your prescription", "Any time from any where ", "Skip"),
              introContainer("assets/img/intro3.png", "Be well and be happy", "Any time from any where ", "Next"),

            ],
          ),
          
      ))
          
        ),
    );
  }
}



