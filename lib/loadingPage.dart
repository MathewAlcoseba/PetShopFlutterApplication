import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petshop/HomePage.dart';
// import 'package:petshop/PetStoreHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingPage(),
    );
  }
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late AnimationController _controller;
  late PageController _pageController;

  List<String> titles = [
    "Welcome to a furry furry wonderland!",
    "Your One-Stop Pet Shop Experience!",
    "Pounce in and meet new furriends!"
  ];

  List<String> descriptions = [
    "Welcome to our online cat emporium, where purrfection meets convenience! Explore our delightful selection of furry companions. ",
    "Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.",
    "Dive into our app like a curious cat into a box! Get ready for a whisker-licking adventure filled with purr-sonality and fur-tastic finds."
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    setState(() {
      currentPage++;
      if (currentPage > 2) {
        currentPage = 0;
      }
    });
    _controller.forward();
    _pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildContent(currentPage),
          _buildWhiteSquare(),
        ],
      ),
    );
  }

  Widget _buildContent(int index) {
    return PageView.builder(
      controller: _pageController, // Use _pageController here
      itemCount: 3,
      itemBuilder: (context, index) => Image.asset(
        'cat${index + 1}.jpg', // Adjust image names as needed
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  Widget _buildWhiteSquare() {
    return Positioned(
      bottom: 0,
      child: Container(
        constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width), // Adjust width as needed
        height: 350.0, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _buildPageIndicator(currentPage),
                  SizedBox(height: 80.0),
                  Text(
                    titles[currentPage], // Change title dynamically
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    descriptions[currentPage], // Change description dynamically
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFA1A1A1),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _buildNextButton(currentPage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDot(index == 0, _controller.value),
            SizedBox(width: 15),
            _buildDot(index == 1, _controller.value),
            SizedBox(width: 15),
            _buildDot(index == 2, _controller.value),
          ],
        );
      },
    );
  }

  Widget _buildNextButton(int index) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (index == 2) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            setState(() {
              nextPage();
            });
          }
        },
        child: Text(
          index == 2 ? "Get Started" : "Next",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: currentPage == index ? Color(0XFFE8BE13) : Color(0XFFE0E0E1),
          minimumSize: Size(350, 55),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive, double animationValue) {
    return Container(
      width: 20,
      height: 7,
      decoration: BoxDecoration(
        color: isActive
            ? Color(0XFFE8BE13)
            : Color(0XFFE0E0E1).withOpacity(1 - animationValue),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
