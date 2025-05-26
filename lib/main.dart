import 'package:flutter/material.dart';

void main() => runApp(const TabControllerApp());

class TabControllerApp extends StatelessWidget {
  const TabControllerApp({super.key});

  static const List<Tab> tabs = <Tab>[Tab(text: 'Explorer'), Tab(text: 'Mes réservations'), Tab(text: 'Mon profil')];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabControllerWidget(tabs: tabs));
  }
}

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({required this.tabs, super.key});

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: TabControllerListener(
        onTabChanged: (int index) {
          debugPrint('tab changed: $index');
        },
        child: Scaffold(
          appBar: AppBar(bottom: TabBar(tabs: tabs)),
          body: TabBarView(
            children:
                tabs.map((Tab tab) {
                  return Center(
                    child: Text(
                      '${tab.text!} Tab',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}

class TabControllerListener extends StatefulWidget {
  const TabControllerListener({required this.onTabChanged, required this.child, super.key});

  final ValueChanged<int> onTabChanged;

  final Widget child;

  @override
  State<TabControllerListener> createState() => _TabControllerListenerState();
}

class _TabControllerListenerState extends State<TabControllerListener> {
  TabController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final TabController? defaultTabController = DefaultTabController.maybeOf(context);

    assert(() {
      if (defaultTabController == null) {
        throw FlutterError(
          'No DefaultTabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.',
        );
      }
      return true;
    }());

    if (defaultTabController != _controller) {
      _controller?.removeListener(_listener);
      _controller = defaultTabController;
      _controller?.addListener(_listener);
    }
  }

  void _listener() {
    final TabController? controller = _controller;

    if (controller == null || controller.indexIsChanging) {
      return;
    }

    widget.onTabChanged(controller.index);
  }

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}