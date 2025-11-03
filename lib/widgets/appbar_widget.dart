import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});
  
  @override
  Widget build(_) => SliverAppBar(
    pinned: true,
    primary: false,
    toolbarHeight: kToolbarHeight * 2 - 56,
    collapsedHeight: kToolbarHeight * 2 - 56,
    expandedHeight: 300,
    backgroundColor: Colors.white,
    flexibleSpace: LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        double max = 300;
        double min = kToolbarHeight * 2;
        double current = constraints.maxHeight;

        double t = ((current - min) / (max - min)).clamp(0.0, 1.0);

        double bgOpacity = t;
        double overlayOpacity = 1 - t;
        double delayedTextOpacity = ((overlayOpacity - 0.7) / 0.3).clamp(
          0.0,
          1.0,
        );

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Opacity(
              opacity: bgOpacity,
              child: Image.asset('assets/images/hero.jpg', fit: BoxFit.cover),
            ),
            Container(color: Colors.white.withValues(alpha: overlayOpacity)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Opacity(
                  opacity: delayedTextOpacity,
                  child: Text(
                    '911',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: Container(
        height: 24,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
    ),
  );
}
