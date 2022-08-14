import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:BreakingBad/Controller/home_controller.dart';
import 'package:BreakingBad/View/Shared/Configs/Colors.dart';
import 'package:BreakingBad/View/Widgets/info_card_widget.dart';

class InfoScreen extends StatelessWidget {
  final int index;

  const InfoScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      body: SafeArea(
        child: Obx(
          () => !controller.loadingQuotes.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor1,
                ))
              : Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Image(
                                image: NetworkImage(
                                    '${controller.characters[index].img}'),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InfoCardWidget(
                                  title: 'Name',
                                  info: controller.characters[index].name),
                              InfoCardWidget(
                                  title: 'BirthDay',
                                  info: controller.characters[index].birthday),
                              InfoCardWidget(
                                  title: 'Quote',
                                  info: controller.quotes[0].quote),
                              InfoCardWidget(
                                  title: 'Author',
                                  info: controller.quotes[0].author),
                              InfoCardWidget(
                                  title: 'Series',
                                  info: controller.quotes[0].series),
                            ],
                          ),
                        )),
                  ],
                ),
        ),
      ),
    );
  }
}
