// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Structure extends StatefulWidget {
  final double? height,width;
  const Structure({Key? key, required this.height, required this.width}) : super(key: key);
  @override
  _StructureState createState() => _StructureState();
}

class _StructureState extends State<Structure> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation animationOne;
  late Animation animationTwo;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this);
    animationOne = ColorTween(begin: Colors.white10,end: Colors.black12).animate(animationController);
    animationTwo = ColorTween(begin: Colors.black12,end: Colors.white10).animate(animationController);
    animationController.forward();
    animationController.addListener((){
      if(animationController.status == AnimationStatus.completed){
        animationController.reverse();
      } else if(animationController.status == AnimationStatus.dismissed){
        animationController.forward();
      }
      setState((){});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
          gradient:  LinearGradient(
              colors: [animationOne.value, animationTwo.value]
          ),
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}