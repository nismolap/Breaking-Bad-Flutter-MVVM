
import 'package:BreakingBad/presentation/Shared/Routes/App_Routes.dart';
import 'package:BreakingBad/presentation/animation/shimmer_loading/structure.dart';
import 'package:flutter/material.dart';
import 'package:BreakingBad/presentation/Shared/Configs/TextStyles.dart';

class CardWidget extends StatelessWidget {

  final String image;
  final String name;
  final String nickName;
  final int index;

  const CardWidget({Key? key,
    required this.image,
    required this.name,
    required this.nickName,
    required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeController controller = Get.put(HomeController());
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/info',arguments: InfoScreenArguments(index: index,name: name,image: image));
        // Navigator.of(context).push(SlideTransitionRoute(page: BlocProvider(
        //   create: (context) => CharactersCubit()..getQuotesData(index),
        //   child: InfoScreen(index: index, img: image, name: name,),
        // )));
        // controller.getQuotesData(controller.characters[index].charId!);
        // Get.to(InfoScreen(index: index));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
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
                    ),
                    child: LoadImageWidget(image,context),
                )),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.titleMedium),
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

  // ignore: non_constant_identifier_names
  Widget LoadImageWidget(String img,context) {
    return Image.network(
      img,
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return const Structure(
            height: 10, width: double.infinity);
      },
      errorBuilder: (_, child, progress) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.image_not_supported_outlined, size: 100,),
            Wrap(
              children: [
                Text("we're sorry the preview didn't load",
                  textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),),
              ],
            ),
          ],
        );
      },
    );
  }
}
