import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorPickerInput extends StatefulWidget {
  const ColorPickerInput({
    super.key,
    required this.defaultColor,
    required this.onColorChanged,
    required this.label,
  });

  final Color defaultColor;
  final ValueChanged<Color> onColorChanged;
  final String label;

  @override
  State<ColorPickerInput> createState() => _ColorPickerInputState();
}

class _ColorPickerInputState extends State<ColorPickerInput> {
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.defaultColor;
  }

  Future<void> _openColorPicker(BuildContext context) async {
    final Color newColor = await showColorPickerDialog(
      context,
      selectedColor,
      title: Text(widget.label),
      columnSpacing: 20,
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.wheel: true,
      },
      showRecentColors: false,
      showColorCode: true,
      colorCodeHasColor: true,
      enableShadesSelection: false,
    );
    if (newColor != selectedColor) {
      setState(() {
        selectedColor = newColor;
      });
      widget.onColorChanged(newColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String hexCode =
        '#${selectedColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}';

    return InkWell(
      onTap: () => _openColorPicker(context),
      child: IgnorePointer(
        child: TextFormField(
          controller: TextEditingController(text: hexCode),
          decoration: InputDecoration(
            labelText: widget.label,
            border: const OutlineInputBorder(),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
