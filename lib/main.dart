import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpr/widgets/stats.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List listNames = [
    ['Status', '0'],
    ['Value', '28.2'],
    ['Reports', '15'],
  ];

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'GPR Project',
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16.sp),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                padding: const EdgeInsets.all(10),
                child: Card(
                    shadowColor: Colors.black,
                    elevation: 10.0,
                    color: Colors.blueAccent.withOpacity(0.4),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Camera',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              listNames[0][1] != '1'
                                  ? const Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                    )
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          //criar http.get localhost/video
                          Expanded(
                              child: Container(
                            color: Colors.black,
                            child: Image.asset(
                              'assets/pi_2.jpg',
                              fit: BoxFit.fill,
                            ),
                          )),
                        ]))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: listNames.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        color: Colors.blueAccent.withOpacity(0.4),
                        child: DesignerHomeStats(
                          status: true,
                          index: index,
                          value: 24.9,
                          title: listNames[index][0],
                          content: listNames[index][1],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
