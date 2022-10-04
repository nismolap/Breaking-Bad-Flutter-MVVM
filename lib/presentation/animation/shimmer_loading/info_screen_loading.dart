import 'package:BreakingBad/presentation/animation/shimmer_loading/structure.dart';
import 'package:flutter/material.dart';

class InfoScreenLoading extends StatelessWidget {
  const InfoScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Structure(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        const Expanded(flex: 10,child: Structure(height: 50, width: 200)),
                        Expanded(child: Container()),
                      ],
                    ),
                  )
              ],
            )),
      ],
    );
  }
}
