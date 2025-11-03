import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spa_app/widgets/additional_services_section.dart';
import 'package:spa_app/widgets/appbar_widget.dart';
import 'package:spa_app/widgets/booking_bar.dart';
import 'package:spa_app/widgets/included_in_program_section.dart';
import 'package:spa_app/widgets/program_section.dart';

class SpaScreen extends StatefulWidget {
  const SpaScreen({super.key});

  @override
  State<SpaScreen> createState() => _SpaScreenState();
}

class _SpaScreenState extends State<SpaScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (!_controller.position.isScrollingNotifier.value &&
          // ignore: invalid_use_of_protected_member
          !_controller.position.isScrollingNotifier.hasListeners) {
        _handleSnap();
      }
    });

    _controller.addListener(_snapOnStop);
  }

  void _snapOnStop() {
    if (!_controller.position.isScrollingNotifier.value) {
      _handleSnap();
    }
  }

  void _handleSnap() {
    double offset = _controller.offset;
    const double threshold = 100.0;
    const double snapDown = 190.0;

    if (offset > threshold && offset < snapDown) {
      _controller.animateTo(
        snapDown,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    } else if (offset < threshold && offset > 0) {
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(_) => Scaffold(
    body: SafeArea(
      top: false,
      child: Stack(
        children: <Widget>[
          NotificationListener<UserScrollNotification>(
            onNotification: (UserScrollNotification notification) {
              if (notification.direction == ScrollDirection.idle) {
                _handleSnap();
              }
              return false;
            },
            child: CustomScrollView(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                AppBarWidget(),
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProgramSection(),
                      IncludedInProgramSection(),
                      AdditionalServicesSection(),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: BookingBar()),
        ],
      ),
    ),
  );
}
