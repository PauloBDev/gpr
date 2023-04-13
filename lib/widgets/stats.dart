import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DesignerHomeStats extends StatelessWidget {
  final String title;
  final String content;
  final int index;
  final bool status;
  final double value;

  const DesignerHomeStats({
    super.key,
    required this.title,
    required this.content,
    required this.status,
    required this.index,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          index == 0
              ? status == true
                  ? const Expanded(
                      child: Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 90,
                      ),
                    )
                  : const Expanded(
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 90,
                      ),
                    )
              : index == 1
                  ? status == true
                      ? value >= 20
                          ? Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: Text(
                                '$value',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    color: Colors.green,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: Text(
                                '$value',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    color: Colors.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                      : Padding(
                          padding: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            'N/A',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                  : status == false
                      ? Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Text(
                            content,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            content,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
        ],
      ),
    );
  }
}
