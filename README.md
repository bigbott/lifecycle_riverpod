# lifecycle_riverpod

This small project shows the integration of WidgetsBindingObserver with Riverpod. 
As a result, we have lifecycle provider which can be used as follow: 

` Widget build(BuildContext context, WidgetRef ref) {
    bool inBackground = ref.watch(lifecycleProvider);`

Hence, the widget is rebuilt every time the app goes to the background and back.   
