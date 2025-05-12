import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget 
{
  const CustomTextFormField({super.key, required this.label, required this.prefixIcon, this.isObscured = false, this.onChanged, required this.suffixIcon, this.keyboardType = TextInputType.text, this.readOnly = false, this.initialValue, this.maxLines = 1, this.floatingLabelBehavior = FloatingLabelBehavior.auto});
  final String label;
  final int maxLines;
  final Widget prefixIcon;
  final Widget? suffixIcon; 
  final String? initialValue;
  final bool isObscured, readOnly; 
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> 
{
  @override
  Widget build(BuildContext context) => TextFormField( 
    readOnly: widget.readOnly, 
    maxLines: widget.maxLines, 
    onChanged: widget.onChanged,
    obscureText: widget.isObscured,
    initialValue: widget.initialValue,
    keyboardType: widget.keyboardType,
    style: AppStyles.pharmaScan15Weight500Black, 
    autovalidateMode: AutovalidateMode.onUserInteraction, 
    decoration: InputDecoration(
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      floatingLabelBehavior: widget.floatingLabelBehavior,
      label: Text(widget.label, style: AppStyles.pharmaScan15Weight500Black),
      border: AppStyles.customOutlineInputBorderGrey(), 
      disabledBorder: AppStyles.customOutlineInputBorderGrey(),
      enabledBorder: AppStyles.customOutlineInputBorderBlue(),
      focusedBorder: AppStyles.customOutlineInputBorderBlue(), 
    ),
    validator: (data)
    {
      if(data!.isEmpty)
      {
        return 'This field is required';
      }
      return null;
    },
    onTapOutside: (event) => FocusScope.of(context).unfocus(),
  ); 
}