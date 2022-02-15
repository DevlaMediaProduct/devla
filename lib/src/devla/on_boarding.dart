import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoadingScreen extends StatefulWidget {
  const OnBoadingScreen({
    Key key,
    @required this.widgetList,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.navigation,
    this.titleSkip = "Skip",
    this.titleStart = "Next",
  }) : super(key: key);

  final List<OnScreen> widgetList;
  final Color primaryColor;
  final Color secondaryColor;
  final String titleSkip;
  final String titleStart;
  final String navigation;

  @override
  _OnBoadingScreenState createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? widget.primaryColor : widget.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, widget.navigation),
                    child: Text(
                      widget.titleSkip,
                      style: TextStyle(
                        color: widget.primaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height / 1.5,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: widget.widgetList.map((e) => e).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _currentPage == _numPages - 1
          ? SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                child: Container(
                  width: size.width - 200,
                  height: 50,
                  child: FlatButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, widget.navigation),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        widget.titleStart,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}

class OnScreen extends StatelessWidget {
  final String img;
  final String title;
  final String desc;

  OnScreen({
    this.img,
    this.title,
    this.desc,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage(
              img,
            ),
            width: size.width / 1.5,
            height: size.width / 1.5,
          ),
        ),
        SizedBox(height: 30.0),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              children: [
                Text(
                  title,
                ),
                SizedBox(height: 15.0),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
