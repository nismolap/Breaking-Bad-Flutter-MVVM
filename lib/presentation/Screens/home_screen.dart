// ignore_for_file: non_constant_identifier_names

import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/business_logic/characters_cubit.dart';
import 'package:BreakingBad/presentation/animation/shimmer_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/Shared/Configs/Colors.dart';
import '../../presentation/Shared/Configs/Constants.dart';
import '../../presentation/Widgets/behance_widget.dart';
import '../../presentation/Widgets/card_widget.dart';
import '../../presentation/Widgets/header_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CharactersModel> allCharacters = [];

  @override
  void initState() {
    super.initState();
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      body: SafeArea(
        child: mainWidget(),
      ),
    );
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          context.read<CharactersCubit>().getAllCharacters();
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        return LoadedWidget();
      } else {
        return LoadingWidget();
      }
    });
  }

  Widget mainWidget() {
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [BehanceWidget()],
        )),
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
            index: index,
          );
        });
  }

  Widget LoadingWidget() {
    return  CarouselSlider.builder(
        itemCount: 0,
        options: CarouselOptions(
          height: 400,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return const CardLoading();
        });
  }
}


