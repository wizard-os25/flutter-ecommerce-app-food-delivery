import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => MainFoodPageState();
}

class MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8), // tổng khoảng cách top ≈ 100
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Vietnam",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: const [
                            SmallText(text: "City"),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.mainColor,
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),
              FoodPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
