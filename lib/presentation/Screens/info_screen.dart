import 'package:BreakingBad/Model/Models/quotes_model.dart';
import 'package:BreakingBad/business_logic/bloc_exports.dart';
import 'package:BreakingBad/presentation/Widgets/info_card_widget.dart';
import 'package:BreakingBad/presentation/animation/shimmer_loading/info_screen_loading.dart';
import 'package:BreakingBad/presentation/animation/shimmer_loading/structure.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String img;
  final String name;
  final int index;

  InfoScreen(
      {Key? key, required this.index, required this.img, required this.name})
      : super(key: key);

  List<QuotesModel> quotes = [];

  @override
  Widget build(BuildContext context) {
    // HomeController controller = Get.put(HomeController());
    return Scaffold(
        body: SafeArea(
            child: BlocWidgetCheck()

          // Obx(
          //   () => !controller.loadingQuotes.value
          //       ? const Center(
          //           child: CircularProgressIndicator(
          //           color: AppColors.primaryColor1,
          //         ))
          //       : Column(
          //           children: [
          //             Expanded(
          //                 flex: 2,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Container(
          //                       margin: const EdgeInsets.symmetric(vertical: 10),
          //                       child: Image(
          //                         image: NetworkImage(
          //                             '${controller.characters[index].img}'),
          //                       ),
          //                     ),
          //                   ],
          //                 )),
          //             Expanded(
          //                 flex: 4,
          //                 child: SingleChildScrollView(
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       InfoCardWidget(
          //                           title: 'Name',
          //                           info: controller.characters[index].name),
          //                       InfoCardWidget(
          //                           title: 'BirthDay',
          //                           info: controller.characters[index].birthday),
          //                       InfoCardWidget(
          //                           title: 'Quote',
          //                           info: controller.quotes[0].quote),
          //                       InfoCardWidget(
          //                           title: 'Author',
          //                           info: controller.quotes[0].author),
          //                       InfoCardWidget(
          //                           title: 'Series',
          //                           info: controller.quotes[0].series),
          //                     ],
          //                   ),
          //                 )),
          //           ],
          //         ),
          // ),
        ),
    );
  }

  Widget BlocWidgetCheck() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is QuotesLoaded) {
            quotes = state.quotes;
            return WidgetLoaded(context);
          } else if(state is QuotesError){
            return WidgetError();
          } else if(state is QuotesLoading){
            return const InfoScreenLoading();
          }else{
            return const InfoScreenLoading();
          }
        }
    );
  }

  Widget WidgetLoaded(context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: LoadImageWidget(img,context)
            )),
        Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCardWidget(
                      title: 'Name',
                      info: name),
                  InfoCardWidget(
                      title: 'Quote',
                      info: quotes[0].quote),
                  InfoCardWidget(
                      title: 'Author',
                      info: quotes[0].author),
                  InfoCardWidget(
                      title: 'Series',
                      info: quotes[0].series),
                  ],
              ),
            )),
      ],
    );
  }

  // Widget WidgetLoading() {
  //   return Container();
  // }

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

  Widget WidgetError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.image_not_supported_outlined, size: 100,color: Colors.white,),
          Wrap(
            children: const [
              Text("we're sorry the preview didn't load , Error with the server",
                textAlign: TextAlign.center, style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),),
            ],
          ),
        ],
      ),
    );
  }


}
