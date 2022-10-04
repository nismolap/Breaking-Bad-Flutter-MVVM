// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/business_logic/dark_mode/dark_mode_cubit.dart';
import 'package:BreakingBad/presentation/animation/shimmer_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/characters/characters_cubit.dart';
import '../../presentation/Shared/Configs/Constants.dart';
import '../../presentation/Widgets/behance_widget.dart';
import '../../presentation/Widgets/card_widget.dart';
import '../../presentation/Widgets/header_widget.dart';
import '../Shared/Routes/routes_name.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<CharactersModel> allCharacters = [];
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: mainWidget(context),
      ),
      floatingActionButton: BlocBuilder<DarkModeCubit, DarkModeState>(
  builder: (context, state) {
    return FloatingActionButton(
        onPressed: () {
          context.read<DarkModeCubit>().changeSystemMode();
        },
        backgroundColor: state is DarkModeOn ? Colors.black : state is DarkModeOff ?  Colors.white : Colors.white,
        child: Icon(Icons.brightness_4,color: state is DarkModeOn ? Colors.white : state is DarkModeOff ?  Colors.black : Colors.black,),
      );
  },
),
    );
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if(allCharacters.isEmpty){
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return LoadedWidget();
        }
        if(state is CharactersError){
          return WidgetError(context);
        }
        else {
          return LoadingWidget();
        }
      }
      else{
        return LoadedWidget();
      }
    });
  }

  Widget mainWidget(context) {
    return Column(
      children: [
        const Expanded(
            child: HeaderWidget(
          headerRightText: Constants.headerRightText,
          headerLeftText: Constants.headerLeftText,
        )),
        Expanded(
          flex: 3,
          child: BuildBlocWidget(),
        ),
        Expanded(
            child: Center(child: ButtonWidget(onPress: () {Navigator.of(context).pushNamed(AppRoutesName.searchRoute);},buttonText: "Search",))),
      ],
    );
  }

  Widget LoadedWidget() {
    return CarouselSlider.builder(
        itemCount: allCharacters.length,
        options: CarouselOptions(
          height: 400,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return CardWidget(
            image: '${allCharacters[index].img}',
            name: '${allCharacters[index].name}',
            nickName: '${allCharacters[index].nickname}',
            index: allCharacters[index].charId!
          );
        });
  }

  Widget LoadingWidget() {
    return  CarouselSlider.builder(
        itemCount: 0,
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return const CardLoading();
        });
  }
  Widget WidgetError(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.image_not_supported_outlined, size: 100,color: Colors.white,),
          Wrap(
            children:  [
              Text("we're sorry the preview didn't load , Error with the server",
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),),
            ],
          ),
        ],
      ),
    );
  }
}


