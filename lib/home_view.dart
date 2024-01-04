import 'package:flutter/material.dart';
import 'package:portfolio_personal/widgets/normal_view.dart';
import 'package:portfolio_personal/widgets/small_view.dart';
import 'package:rive/rive.dart'; 

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final riveController = SimpleAnimation('Animation 1');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: _bodyWidget(),
      ),
      floatingActionButton: _dashAnimation(),
    );
  }

  Widget _bodyWidget() => LayoutBuilder(
    builder: (context, constraints) {
      if(constraints.maxWidth > 1200) {
        return Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: NormalView()
        );
      } else {
        return Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SmallView(),
        );
      }
    }
  );

  Widget _dashAnimation() => SizedBox(
    height: MediaQuery.of(context).size.height * 0.4,
    width: MediaQuery.of(context).size.width * 0.4,
    child: Listener(
      child: RiveAnimation.asset(
        'assets/icons/dash_flutter.riv',
        fit: BoxFit.cover,
        alignment: Alignment.bottomRight,
        stateMachines: ['birb'],
      ),
    ),
  );
}
