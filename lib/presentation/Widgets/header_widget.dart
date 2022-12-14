import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String headerLeftText;

  final String headerRightText;

  const HeaderWidget(
      {Key? key, required this.headerLeftText, required this.headerRightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).bottomAppBarColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(45),
                )),
            child: Text(
              headerLeftText,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).cardTheme.color,
                radius: 5,
              )),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Text(
              headerRightText,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
