import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor=0.78;
  double _heightCardScale=220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 312,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

if (index == _currentPageValue.floor()) {
  // card ở giữa
  var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
  var currTrans = _heightCardScale * (1 - currScale) / 2;

  matrix = Matrix4.diagonal3Values(1, currScale, 1)
    ..setTranslationRaw(0, currTrans, 0);

} else if (index == _currentPageValue.floor() + 1) {
  // card bên phải
  var currScale =
      _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
  var currTrans = _heightCardScale * (1 - currScale) / 2;

  matrix = Matrix4.diagonal3Values(1, currScale, 1)
    ..setTranslationRaw(0, currTrans, 0);

} else if (index == _currentPageValue.floor() - 1) {
  // card bên trái
  var currScale =
      _scaleFactor + (index - _currentPageValue + 1) * (1 - _scaleFactor);
  var currTrans = _heightCardScale * (1 - currScale) / 2;

  matrix = Matrix4.diagonal3Values(1, currScale, 1)
    ..setTranslationRaw(0, currTrans, 0);

} else {
  // các card còn lại
  var currScale = _scaleFactor;
  var currTrans = _heightCardScale * (1 - currScale) / 2;

  matrix = Matrix4.diagonal3Values(1, currScale, 1)
    ..setTranslationRaw(0, currTrans, 0);
}

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.red : Colors.blue,
              image: const DecorationImage(
                image: AssetImage("assets/image/food1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 122,
              margin: const EdgeInsets.only(left: 36, right: 36, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: index.isEven ? Colors.white : Colors.blue,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Nutritious fruit meal in China"),
      
                    const SizedBox(height: 8),
                    // Row 1: Stars + rating
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (i) => const Icon(
                              Icons.star,
                              color: Colors.greenAccent,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        SmallText(text: "4.5 • 1287 •	comments"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Row 2: Icons and text
                    Row(
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle,
                            text: "Normal",
                            iconColor: Colors.amberAccent),
                        const SizedBox(width: 16),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor),
                        const SizedBox(width: 16),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ),


            ),
          ),
        ],
      ),
    );
  }
}
