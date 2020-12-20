import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsg_flutter/excersice/model/product_model.dart';

class OrderWidget extends StatelessWidget {
  Product product;
  OrderWidget(this.product);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    // TODO: implement build
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      elevation: 10,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        height: 120.h,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  image: DecorationImage(
                      image: AssetImage(product.imageUrl), fit: BoxFit.cover)),
              height: 120.h,
              width: 120.w,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      product.companyName,
                      style: TextStyle(fontSize: 18, color: Color(0xff999999)),
                    ),
                    Row(
                      children: [
                        Text('Color: ',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff999999))),
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: product.color, shape: BoxShape.circle),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.price,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff175ED4)),
                        ),
                        Text(
                          product.status,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff175ED4)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
