import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:space_app/modal/data_modal.dart';

import '../../provider/solar_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SolorProvider>().getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          itemCount: context.watch<SolorProvider>().solarSystemData.length,
          itemBuilder: (context, index) {
            return HomeDetails(
              context: context,
              name: context.watch<SolorProvider>().solarSystemData[index].name!,
              ditail:
                  context
                      .watch<SolorProvider>()
                      .solarSystemData[index]
                      .description!,
              gif: context.watch<SolorProvider>().solarSystemData[index].gif!,
            );
          },
        ),
      ),
    );
  }
}

class HomeDetails extends StatefulWidget {
  const HomeDetails({
    super.key,
    required this.context,
    required this.name,
    required this.ditail,
    required this.gif,
  });

  final BuildContext context;
  final String name;
  final String ditail;
  final String gif;

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {
      context.read<SolorProvider>().changeGif();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Align(alignment: Alignment.center),
          Text(
            widget.name,
            style: GoogleFonts.orbitron(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              widget.ditail,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          Align(alignment: Alignment.bottomCenter),
          Expanded(
            child: SizedBox(
              child: AnimatedAlign(
                duration: Duration(seconds: 2),
                alignment:
                    (context.watch<SolorProvider>().isUp)
                        ? Alignment.topCenter
                        : Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (!context.watch<SolorProvider>().isUp)
                        ? AnimatedContainer(
                          duration: Duration(seconds: 2),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.white10),
                        )
                        : SizedBox(),
                    buildBounceInDown(),
                    (context.watch<SolorProvider>().isUp)
                        ? Row(
                          children: [
                            planetContainerDetails(title: 'AGE',count: '4.5',detailText: 'BILLION\nYEARS'),
                            SizedBox(width: 10),
                            planetContainerDetails(title: 'GRAVITY',count: '8.8',detailText: 'M/S'),
                          ],
                        )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget planetContainerDetails({
    required String title,
    required String count,
    required String detailText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        height: 170,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Small icon/logo
            const Icon(Icons.public, size: 24, color: Colors.white70),
            const SizedBox(height: 16),
            // AGE text
             Text(
              title,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            // 4.5 BILLION YEARS text
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  count,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    detailText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BounceInDown buildBounceInDown() {
    return BounceInDown(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(widget.gif)),
        ),
      ),
    );
  }
}
