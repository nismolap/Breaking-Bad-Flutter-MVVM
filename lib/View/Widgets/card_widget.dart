import 'package:flutter/material.dart';
import 'package:BreakingBad/View/Shared/Configs/Colors.dart';
import 'package:BreakingBad/View/Shared/Configs/TextStyles.dart';

class CardWidget extends StatelessWidget {
  final Color backgroundColor;

  final String image;
  final String name;
  final String nickName;

  const CardWidget(
      {Key? key,
      this.backgroundColor = AppColors.secondaryColor1,
      required this.image,
      required this.name,
      required this.nickName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
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
    );
  }
}
