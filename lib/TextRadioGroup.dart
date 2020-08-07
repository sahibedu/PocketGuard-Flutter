import 'package:flutter/material.dart';

class TextRadioGroup extends StatefulWidget {
  final List<Text> childrenText;
  final EdgeInsets itemPadding;
  final Color unSelectedBackgroundColor;
  final TextStyle unSelectedStyle;
  final double marginBetweenItems;

  @override
  State createState() => _TextRadioGroupState();

  TextRadioGroup(
      this.childrenText,
      this.itemPadding,
      this.unSelectedBackgroundColor,
      this.unSelectedStyle,
      this.marginBetweenItems)
      : assert(childrenText != null);
}

class _TextRadioGroupState extends State<TextRadioGroup> {
  var _selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.childrenText.asMap().entries.map<Widget>((e) {
        return Container(
          margin: EdgeInsets.only(right: widget.marginBetweenItems),
          color: e.key == _selectedPos
              ? e.value.style.backgroundColor
              : widget.unSelectedBackgroundColor,
          padding: widget.itemPadding,
          child: Text(
            e.value.data,
            style: e.key == _selectedPos
                ? e.value.style?.copyWith(backgroundColor: Colors.transparent)
                : widget.unSelectedStyle,
          ),
        );
      }).toList(),
    );
  }
}
