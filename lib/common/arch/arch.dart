import 'package:flutter_web/material.dart';

class PageState<T extends StatefulWidget, U extends Presenter>
    extends State<T> {
  U eventHandler;

  @override
  void dispose() {
    eventHandler?.deinit();
    eventHandler?.defaultInteractor?._stateSetters?.remove(_setState);
    super.dispose();
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    eventHandler?.defaultInteractor?._stateSetters?.add(_setState);
  }

  @override
  void initState() {
    super.initState();
    eventHandler?.context = context;
    eventHandler?.defaultInteractor?._stateSetters?.add(_setState);
    eventHandler?.init();
  }

  _setState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

mixin Presenter<T extends Interactor> {
  T defaultInteractor;
  BuildContext context;

  Future deinit() async {}

  Future init() async {}
}

mixin Interactor {
  final Set<Function> _stateSetters = Set();

  void updatePage() {
    for (var item in _stateSetters) {
      try {
        item();
      } catch (e) {
        continue;
      }
    }
  }
}
