import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget 
{
  const CustomTextFormField({super.key, required this.label, required this.prefixIcon, this.isObscured = false, this.onChanged, required this.suffixIcon,});
  final String label;
  final bool isObscured; 
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> 
{
  @override
  Widget build(BuildContext context) => TextFormField( 
    onChanged: widget.onChanged,
    obscureText: widget.isObscured,
    style: AppStyles.pharmaScan10Weight500Black, 
    autovalidateMode: AutovalidateMode.onUserInteraction, 
    decoration: InputDecoration(
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      label: Text(widget.label, style: AppStyles.pharmaScan10Weight500Black),
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