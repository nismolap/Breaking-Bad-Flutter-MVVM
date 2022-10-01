import 'package:BreakingBad/Controller/home_controller.dart';
import 'package:BreakingBad/presentation/Screens/info_screen.dart';
import 'package:BreakingBad/presentation/animation/shimmer_loading/structure.dart';
import 'package:flutter/material.dart';
import 'package:BreakingBad/presentation/Shared/Configs/Colors.dart';
import 'package:BreakingBad/presentation/Shared/Configs/TextStyles.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  final Color backgroundColor;

  final String image;
  final String name;
  final String nickName;
  final int index;

  const CardWidget(
      {Key? key,
      this.backgroundColor = AppColors.secondaryColor1,
      required this.image,
      required this.name,
      required this.nickName,
        required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return InkWell(
      onTap: (){
        controller.getQuotesData(controller.characters[index].charId!);
        Get.to(InfoScreen(index: index));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [Shadow.shadow()],
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // image: DecorationImage(
                    //   image: NetworkImage(image),
                    //   fit: BoxFit.cover,
                    //   alignment: Alignment.topCenter,
                    // ),
                  ),
                  child: Image.network(
                    image,
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const Structure(height: 10, width: double.infinity);
                    },
                  )
                    // FadeInImage(placeholder: Structure(height: 10, width: double.infinity), image: image,),
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name, style: AppTextStyle.titleStyle()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_reaction_outlined),
                    Container(
                      width: 10,
                    ),
                    Text(nickName, style: AppTextStyle.nickNameStyle()),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
