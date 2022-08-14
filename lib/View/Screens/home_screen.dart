import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:BreakingBad/Controller/home_controller.dart';
import 'package:BreakingBad/View/Screens/info_screen.dart';
import 'package:BreakingBad/View/Shared/Configs/Colors.dart';
import 'package:BreakingBad/View/Shared/Configs/Constants.dart';
import 'package:BreakingBad/View/Widgets/behance_widget.dart';
import 'package:BreakingBad/View/Widgets/card_widget.dart';
import 'package:BreakingBad/View/Widgets/header_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
                child: HeaderWidget(
              headerRightText: Constants.headerRightText,
              headerLeftText: Constants.headerLeftText,
            )),
            Obx(
              () => Expanded(
                flex: 3,
                child: !controller.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor1,
                      ))
                    : CarouselSlider.builder(
                        itemCount: controller.characters.length,
                        options: CarouselOptions(
                          height: 400,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return MaterialButton(
                            onPressed: () {
                              int? id = controller.characters[index].charId;
                              controller.getQuotesData(id!);
                              Get.to(InfoScreen(index: index));
                            },
                            padding: EdgeInsets.zero,
                            child: CardWidget(
                                image: '${controller.characters[index].img}',
                                name: '${controller.characters[index].name}',
                                nickName:
                                    '${controller.characters[index].nickname}'),
                          );
                        }),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [BehanceWidget()],
            )),
          ],
        ),
      ),
    );
  }
}
