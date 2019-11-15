import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var top = 0.0;
  double animhight = 80.0;

  @override
  void initState() {
    anim();
    super.initState();
  }

  anim() async {
    await Future.delayed(new Duration(milliseconds: 100));
    setState(() {
     animhight = 0.0; 
    });
  }

  Container buttonContainer(String picture, String title) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[200], blurRadius: 3)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /////////// Button Icon start///////////
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(picture))),
            ),
          ),
          /////////// Button Icon end///////////

          /////////// Button Icon start///////////
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 40,
            //color: Colors.red,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF292929),
                  fontFamily: "Raleway",
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          /////////// Button Icon end///////////
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Color(0xFFFFFFFF)
                  ),
              backgroundColor: Colors.blue[400],
              expandedHeight: 150.0,
              //automaticallyImplyLeading: false,
              centerTitle: true,
              //floating: false,
              pinned: true,
              elevation: 0,
              leading: new IconButton(
                icon: new Icon(Icons.sort, size: 30,),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                return  FlexibleSpaceBar(
                  //centerTitle: true,
                  title: Row(
                    // mainAxisAlignment:
                    //     MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        //alignment: Alignment.bottomCenter,
                        //   padding: EdgeInsets.only(top: 10),
                        child: Text(
                         top <= 80 ? 'Home' : "",
                          //  '${widget.orderedItem.seller.name}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ////////////////////Collapsed Bar/////////////////
                  background: Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.grey[50],
                      ),
                      Container(
                        //constraints: new BoxConstraints.expand(height: 256.0, ),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: top <= 90 ? 40 :top <= 80 ? 60.0 : 30, bottom: 8.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                //userData['img']==null?
                                AssetImage('assets/img/hometop.png'),
                            //     //NetworkImage(proImage),
                            // colorFilter: new ColorFilter.mode(
                            //     Colors.black.withOpacity(0.5),
                            //     BlendMode.darken),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Text(
                         top <= 80 ? 'Home' : "Home",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )

                  ////////////////////Collapsed Bar  End/////////////////

                  );})
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          'Our Services',
                          //  '${widget.orderedItem.seller.name}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF0E7EFF),
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          'Here is those services we are ready to provided',
                          //  '${widget.orderedItem.seller.name}',
                          //overflow: TextOverflow.ellipsis,
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 17.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: AnimatedContainer(
                height:  animhight,
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              ),
            ),


            SliverPadding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              sliver: SliverGrid.count(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: <Widget>[
                  buttonContainer('assets/img/LiveChat.png', "Live Chat"),
                  buttonContainer(
                      'assets/img/searchDoc.png', "Search Register Doctor"),
                  buttonContainer(
                      'assets/img/BloodBank.png', "Blood Bank Contact"),
                  buttonContainer(
                      'assets/img/searchHos.png', "Search Hospital & Doctors"),
                  buttonContainer('assets/img/tool.png', "Health Tools"),
                  buttonContainer('assets/img/diet.png', "Nutrition & Diet"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
