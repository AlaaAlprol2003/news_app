import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class ChangeThemeAndLangWidget extends StatelessWidget {
  const ChangeThemeAndLangWidget({super.key, required this.label, required this.icon, required this.menuItems, required this.selectedItem,  this.onChanged});
  final String label;
  final String selectedItem;
  final IconData icon;
  final List<String> menuItems;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon,color: ColorsManager.white,),
            SizedBox(width: 12.w),
            Text(label, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: REdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.grey),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Text(
                selectedItem,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              DropdownButton(
                borderRadius: BorderRadius.circular(12),
                underline: Container(),
                iconEnabledColor: ColorsManager.grey,
                items: menuItems.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
