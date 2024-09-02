import 'package:flutter/material.dart';

// Define a model to hold image and review data
class CarouselBeforeAfterItem {
  final String imageUrl;
  final String afterImageUrl;
  final String review;
  final String Username;

  CarouselBeforeAfterItem({required this.Username,required this.imageUrl, required this.afterImageUrl, required this.review});
}

class BeforeAfterCarousel extends StatefulWidget {
  final String title;
  final List<CarouselBeforeAfterItem> items;

  const BeforeAfterCarousel({Key? key, required this.title, required this.items}) : super(key: key);

  @override
  _BeforeAfterCarouselState createState() => _BeforeAfterCarouselState();
}

class _BeforeAfterCarouselState extends State<BeforeAfterCarousel> {
  int _currentIndex = 0;

  // This controller will keep track of the current page in the PageView
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title Section
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Outfit',
              ),
            ),
          ),
          // Carousel Section with PageView
          Container(
            height: 200, // Fixed height for the carousel
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    // Before Image
                    Expanded(
                      child: Stack(
                          children:
                          [

                            Image.asset(
                              widget.items[index].imageUrl,
                              fit: BoxFit.fill,
                              height: 300,
                            ), Text("Before",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Outfit',
                            ),),
                          ]),
                    ),
                    // After Image
                    Expanded(
                      child: Stack(
                          children: [Image.asset(
                            widget.items[index].afterImageUrl,
                            fit: BoxFit.fill,
                            height: 300,
                          ),
                            Text("After",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit',
                              ),),
                          ]),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),
          // User Review Section
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.items[_currentIndex].Username,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Outfit',
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.items[_currentIndex].review,
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontFamily: 'Outfit',
              ),
            ),
          ),

          SizedBox(height: 8),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.items.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentIndex == index ? 16 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}


class CarouselItem {
  final String imageUrl;

  final String review;
  final String Username;

  CarouselItem({required this.Username,required this.imageUrl, required this.review});
}

class UserReviewCarousel extends StatefulWidget {
  final String title;
  final List<CarouselItem> items;

  const UserReviewCarousel({Key? key, required this.title, required this.items}) : super(key: key);

  @override
  _UserReviewCarouselState createState() => _UserReviewCarouselState();
}

class _UserReviewCarouselState extends State<UserReviewCarousel> {
  int _currentIndex = 0;

  // This controller will keep track of the current page in the PageView
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title Section
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Outfit',
              ),
            ),
          ),
          // Carousel Section with PageView
          Container(
            height: 200, // Fixed height for the carousel
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    // Before Image
                    Image.asset(
                      widget.items[index].imageUrl,
                      fit: BoxFit.fill,
                      height: 300,
                    ),
                    // After Image

                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),
          // User Review Section
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.items[_currentIndex].Username,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Outfit',
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.items[_currentIndex].review,
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontFamily: 'Outfit',
              ),
            ),
          ),

          SizedBox(height: 8),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.items.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentIndex == index ? 16 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
