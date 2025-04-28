import 'package:flutter/material.dart';
import 'package:pharmascan/models/drug_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_text_styles.dart';

class CustomDrugContainer extends StatefulWidget {
  CustomDrugContainer({super.key, required this.drugModel, this.ontap});
 void Function()? ontap;
  DrugModel drugModel;

  @override
  State<CustomDrugContainer> createState() => _CustomDrugContainerState();
}

class _CustomDrugContainerState extends State<CustomDrugContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blue, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 5),
            Image.asset('assets/${widget.drugModel.drugImage}', scale: 1.3),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.drugModel.drugName,
                    style: AppTextStyles.text.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${widget.drugModel.drugPrice} EGP',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (int.parse(widget.drugModel.quantity) > 0) {
                              widget.drugModel.quantity =
                                  (int.parse(widget.drugModel.quantity) - 1)
                                      .toString();
                            }
                          });
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                '-',
                                style: AppTextStyles.text.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        widget.drugModel.quantity,
                        style: AppTextStyles.text.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.drugModel.quantity =
                                (int.parse(widget.drugModel.quantity) + 1)
                                    .toString();
                          });
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                '+',
                                style: AppTextStyles.text.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            const Spacer(),
      
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/${widget.drugModel.drugparcode}',
                    scale: 0.9,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(9),
                          topRight: Radius.circular(9),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              size: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Add to cart',
                              style: AppTextStyles.text.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
