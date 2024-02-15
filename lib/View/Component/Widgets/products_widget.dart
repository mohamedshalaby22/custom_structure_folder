import 'package:flutter/material.dart';
import '../../../Constant/app_constant.dart';
import '../AppWidgets/app_text.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget(
      {Key? key,
      required this.price,
      required this.title,
      required this.image,
      required this.onAdd})
      : super(key: key);
  final String image, title, price;
  final VoidCallback onAdd;
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
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  maxLines: 2,
                  height: 1.5,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppText(
                  text: '\$$price',
                  color: AppConstant.mainColor,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onAdd();
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6)),
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.grey[700],
                )),
          ),
        ],
      ),
    );
  }
}
