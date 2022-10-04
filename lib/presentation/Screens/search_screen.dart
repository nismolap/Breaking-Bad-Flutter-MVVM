// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/presentation/Screens/home_screen.dart';
import 'package:BreakingBad/presentation/Shared/Routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/characters/characters_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController query = TextEditingController();
  List suggest = ['random', 'Breaking Bad', 'Better Call Saul', 'All'];
  List<CharactersModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardTheme.color,
        title: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 4,
          shadowColor: Colors.white10,
          child: TextFormField(
            controller: query,
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            autofocus: true,
            onChanged: (newValue) {
              context.read<CharactersCubit>().getCharacterByName(newValue);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).cardTheme.color,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => query.text = '', icon: const Icon(Icons.clear))
        ],
      ),
      body: BlocWidgetCheck(),
    );
  }

  Widget BlocWidgetCheck() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is SearchDataLoaded) {
        searchResult = state.searchData;
        return ResultWidget();
      }
      if (state is SearchDataEmpty) {
        return SuggestesWidget();
      } else {
        return SuggestesWidget();
      }
    });
  }

  Widget SuggestesWidget() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: suggest.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.star),
          title: Text(suggest[index]),
          onTap: (){
            if(suggest[index]=='Better Call Saul'){
              Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context)=> BlocProvider(create: (context)=>CharactersCubit()..getCharacterCBetterCall(),child: MyHomePage(),))), (route) => false);
            }
            if(suggest[index]=='Breaking Bad'){
              Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context)=> BlocProvider(create: (context)=>CharactersCubit()..getCharacterCBreakingBad(),child: MyHomePage(),))), (route) => false);
            }
            if(suggest[index]=='random'){
              Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context)=> BlocProvider(create: (context)=>CharactersCubit()..getCharacterRandom(),child: MyHomePage(),))), (route) => false);
            }
            if(suggest[index]=='All'){
              Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context)=> BlocProvider(create: (context)=>CharactersCubit()..getAllCharacters(),child: MyHomePage(),))), (route) => false);
            }
          },
        );
      },
    );
  }

  Widget ResultWidget() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: searchResult.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            searchResult[index].name!,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/info',
                arguments: InfoScreenArguments(
                    index: searchResult[index].charId!,
                    name: searchResult[index].name!,
                    image: searchResult[index].img!));
          },
        );
      },
    );
  }
}
