import 'package:custom_structure_folder/Utils/extensions.dart';
import 'package:flutter/material.dart';
import '../../../Constant/app_constant.dart';
import '../AppWidgets/app_text.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget(
      {Key? key,
      required this.price,
      required this.title,
      required this.image,
      required this.isAdded,
      required this.onAdd})
      : super(key: key);
  final String image, title, price;
  final VoidCallback onAdd;
  final bool isAdded;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          15.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  maxLines: 2,
                  height: 1.5,
                ),
                15.height,
                AppText(
                  text: '\$$price',
                  color: AppConstant.mainColor,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isAdded) {
                onAdd();
              }
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: isAdded ? Colors.black : Colors.grey[300],
                    borderRadius: BorderRadius.circular(6)),
                child: Visibility(
                  visible: !isAdded,
                  replacement: const Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.grey[700],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
