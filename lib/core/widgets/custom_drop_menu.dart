import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropMenu<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String Function(T) itemLabel;

  const CustomDropMenu({
    super.key,
    required this.hintText,
    required this.items,
    required this.itemLabel,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      initialValue: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF0D1527),
        hintText: hintText,
        border: _border(context),
        hintStyle: _style(context),
        enabledBorder: _border(context),
        focusedBorder: _border(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      ),
      icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).hintColor),
      dropdownColor: const Color(0xFF0D1527),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            itemLabel(item),
            style: _style(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }

  TextStyle _style(BuildContext context) {
    return Styles.textStyle500.copyWith(
      fontSize: 17.sp,
      color: Theme.of(context).hintColor,
    );
  }

  OutlineInputBorder _border(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: Theme.of(context).hintColor.withValues(alpha: 0.3),
        width: 1,
      ),
    );
  }
}
