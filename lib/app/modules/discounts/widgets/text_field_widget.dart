import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valevantagens/app/utils/debouncer/debouncer.dart';
import 'package:valevantagens/app/utils/formatter/formatter.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final double height;
  final double width;
  final bool enabled;
  final bool numberType;
  final bool inputDoubleType;
  final int limitCaracteres;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TextFieldWidget({
    Key? key,
    required this.label,
    this.height = 48,
    this.width = double.infinity,
    this.enabled = true,
    required this.controller,
    this.numberType = false,
    this.inputDoubleType = false,
    this.limitCaracteres = 200,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String get label => widget.label;
  double get height => widget.height;
  double get width => widget.width;
  bool get enabled => widget.enabled;
  bool get numberType => widget.numberType;
  bool get inputDoubleType => widget.inputDoubleType;
  int get limitCaracteres => widget.limitCaracteres;
  TextEditingController get controller => widget.controller;
  FocusNode get focusNode => widget.focusNode;

  Debouncer _debouncer = Debouncer(milliseconds: 1500);

  @override
  void initState() {
    if (inputDoubleType) Formatter.toCurrencyReal(controller.text, controller);
    super.initState();
  }

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
            focusNode: focusNode,
            maxLines: null,
            expands: true,
            enabled: enabled,
            keyboardType: numberType
                ? inputDoubleType
                    ? TextInputType.numberWithOptions(decimal: true)
                    : TextInputType.number
                : TextInputType.text,
            inputFormatters: inputDoubleType
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    LengthLimitingTextInputFormatter(limitCaracteres),
                  ]
                : [LengthLimitingTextInputFormatter(limitCaracteres)],
            onChanged: (value) {
              if (inputDoubleType) {
                _debouncer.run(
                  () {
                    Formatter.toCurrencyReal(value, controller);
                  },
                );
              }
            },
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
