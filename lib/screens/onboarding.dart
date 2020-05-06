import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappparctice/screens/homepage.dart';
import 'package:flutterappparctice/screens/onboarding.dart';
import 'package:flutterappparctice/screens/onboarding/onboardingtext.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

// ignore: camel_case_types
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  TextStyle style1 = new TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
    fontFamily: 'New Time Roman',
  );
  TextStyle style2 = new TextStyle(
      fontFamily: 'New Time Roman',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  List<PageModel> pages = List<PageModel>();
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages.clear();
    pages.add(PageModel("Welcome!", "1- This is First page of my First App",
        Icons.ac_unit, 'assets/images/picone.JPG'));
    pages.add(PageModel(
        'SecondPage',
        '2- This is Second page of App that refere to registation',
        Icons.account_balance,
        'assets/images/pictwo.JPG'));
    pages.add(PageModel(
        'Thirdpage',
        '3- Here where you can call us if you have any problem',
        Icons.alarm,
        'assets/images/picthree.JPG'));
    pages.add(PageModel(
        'FourthPage',
        '4- Information about us... click on help button',
        Icons.print,
        'assets/images/picfour.JPG'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Stack(children: <Widget>[
      Scaffold(
        body: PageView.builder(
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(pages[index].image),
                          fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Transform.translate(
                      child: Icon(
                        pages[index].icon,
                        size: 120,
                        color: Colors.white,
                      ),
                      offset: Offset(0, -100),
                    ),
                    Text(
                      pages[index].title,
                      style: style1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 48, right: 48, top: 15),
                      child: Text(
                        pages[index].text,
                        style: style2,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            );
          },
          itemCount: pages.length,
          onPageChanged: (index) {
            _pageViewNotifier.value = index;
          },
        ),
      ),
      Transform.translate(
        offset: Offset(0, 135),
        child: Align(
          child: _displaypageIdicators(pages.length),
          alignment: Alignment.center,
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              color: Colors.red.shade600,
              child: Text(
                'GET STARTING',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return homescreen();
                    }
                ),);
              },
            ),
          ),
        ),
      )
    ]);
  }

  Widget _displaypageIdicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
