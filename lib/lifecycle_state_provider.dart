
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LifecycleStateNotifier extends Notifier<bool> {
  @override
  bool build() {
    final lifecycleEventHandler = LifecycleEventHandler._(ref);
    WidgetsBinding.instance.addObserver(lifecycleEventHandler);
    return true;
  }

  void updateState(val) {
    state = val;
  }
}

final lifecycleProvider = NotifierProvider<LifecycleStateNotifier, bool>(() {
  
  return LifecycleStateNotifier();
});

class LifecycleEventHandler extends WidgetsBindingObserver {
  Ref ref;
  LifecycleEventHandler._(this.ref);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
         ref.read(lifecycleProvider.notifier).updateState(false);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
         ref.read(lifecycleProvider.notifier).updateState(true);
        break;
    }
  }
}
