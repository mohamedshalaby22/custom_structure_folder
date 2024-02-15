import 'package:flutter/material.dart';
import '../../../Constant/app_constant.dart';
import 'app_text.dart';

class AppSearchForm extends StatelessWidget {
  const AppSearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AppText(
            text: 'Search',
            color: AppConstant.mainColor,
          ),
          Icon(
            Icons.search,
            color: AppConstant.mainColor,
            size: 22,
          )
        ],
      ),
    );
  }
}
