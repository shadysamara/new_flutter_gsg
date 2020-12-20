import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsg_flutter/excersice/model/product_model.dart';
import 'package:gsg_flutter/excersice/repositories/data_repository.dart';
import 'package:gsg_flutter/excersice/ui/widgets/order_widget.dart';
import 'package:gsg_flutter/excersice/utils/colors.dart';
import 'package:gsg_flutter/excersice/utils/styles.dart';
import 'package:gsg_flutter/excersice/ui/widgets/custom_appbar.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;
  List<Product> displayedProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayedProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Text(
                'Orders',
                style: Styles.titleStyle,
              ),
            ),
            Container(
              height: 50.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: orderStatus.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      this.selectedIndex = index;
                      setState(() {
                        if (selectedIndex == 0) {
                          displayedProducts = products;
                        } else if (selectedIndex == 1) {
                          displayedProducts = products
                              .where(
                                  (element) => element.status == orderStatus[1])
                              .toList();
                        } else if (selectedIndex == 2) {
                          displayedProducts = products
                              .where(
                                  (element) => element.status == orderStatus[2])
                              .toList();
                        } else if (selectedIndex == 3) {
                          displayedProducts = products
                              .where(
                                  (element) => element.status == orderStatus[3])
                              .toList();
                        }
                      });
                    },
                    child: Container(
                      width: 120.w,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? selectedButtonColor
                              : unSelectedButtonColor,
                          borderRadius: BorderRadius.circular(50.w)),
                      alignment: Alignment.center,
                      child: Text(
                        orderStatus[index],
                        style: TextStyle(
                            color: index == selectedIndex
                                ? unSelectedButtonColor
                                : selectedButtonColor),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) {
                return OrderWidget(displayedProducts[index]);
              },
            ))
          ],
        ),
      ),
    );
  }
}
