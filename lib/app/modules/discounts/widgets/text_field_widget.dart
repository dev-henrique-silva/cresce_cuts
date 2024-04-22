import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final double height;
  final double width;
  final bool enabled;
  final TextEditingController controller;
  const TextFieldWidget({
    Key? key,
    required this.label,
    this.height = 48,
    this.width = double.infinity,
    this.enabled = true,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String get label => widget.label;
  double get height => widget.height;
  double get width => widget.width;
  bool get enabled => widget.enabled;
  TextEditingController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: 5.0),
        Container(
          width: width,
          height: height,
          child: TextField(
            controller: controller,
            maxLines: null,
            expands: true,
            enabled: enabled,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              filled: !enabled,
              fillColor: !enabled
                  ? Theme.of(context).colorScheme.onTertiaryContainer
                  : null,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}
