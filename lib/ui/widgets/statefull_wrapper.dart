import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  final bool beforeBuild;
  const StatefulWrapper(
      {@required this.onInit, @required this.child, this.beforeBuild});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      widget.beforeBuild
          ? WidgetsBinding.instance.addPostFrameCallback((_) => widget.onInit())
          : widget.onInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
