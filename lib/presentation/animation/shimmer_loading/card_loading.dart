import 'package:BreakingBad/presentation/animation/shimmer_loading/structure.dart';
import 'package:flutter/material.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(flex:2,child: Structure(width: double.infinity, height: double.infinity,),),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Structure(height: 10, width: double.infinity),
                Structure(height: 10, width: double.infinity),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
