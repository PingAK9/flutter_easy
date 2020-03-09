import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'animation_one_details.dart';

class HeroAnimationDemo extends StatefulWidget {
  @override
  _HeroAnimationDemoState createState() => _HeroAnimationDemoState();
}

class _HeroAnimationDemoState extends State<HeroAnimationDemo>
    with SingleTickerProviderStateMixin {
  final List<String> images = [
    'assets/images/images/1.jpg',
    'assets/images/images/2.jpg',
    'assets/images/images/3.jpg',
  ];

  final List<Map> dummy = [
    {"title": "Beautiful Cardigan", "price": "\$600"},
    {"title": "Leather Bag", "price": "\$400"},
    {"title": "White Beautiful Bag", "price": "\$350"},
  ];

  int currentIndex = 0;
  int prevIndex = 0;
  final SwiperController _swiperController = SwiperController();
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Best items",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const TextSpan(text: " from around"),
          ])),
          Expanded(
            flex: 2,
            child: Swiper(
              physics: const BouncingScrollPhysics(),
              viewportFraction: 0.8,
              itemCount: 3,
              loop: false,
              controller: _swiperController,
              onIndexChanged: (index) {
                _controller.reverse();
                setState(() {
                  prevIndex = currentIndex;
                  currentIndex = index;
                  _controller.forward();
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 1),
                            pageBuilder: (_, __, ___) => AnimationOneDetails(
                              index: index,
                              image: images[index],
                              dummy: dummy[index],
                            ),
                          ),
                        ),
                        child: Hero(
                          tag: "image$index",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
          Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: currentIndex == 0 ? 1 : 0,
                child: _buildDesc(0),
                duration: const Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 1 ? 1 : 0,
                child: _buildDesc(1),
                duration: const Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 2 ? 1 : 0,
                child: _buildDesc(2),
                duration: const Duration(seconds: 1),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDesc(int index) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 10),
          Hero(
            tag: "title$index",
            child: Material(
              type: MaterialType.transparency,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  dummy[index]["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Hero(
            tag: "price$index",
            child: Material(
              type: MaterialType.transparency,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  dummy[index]["price"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
