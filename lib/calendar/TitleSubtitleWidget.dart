import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final Text title;
  final Text subtitle;

  TitleSubtitleWidget(this.boxDecoration, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: boxDecoration,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            Container(
              margin: EdgeInsets.only(top: 8),
              child: subtitle,
            )
          ],
        ),
      ),
    );
  }
}
