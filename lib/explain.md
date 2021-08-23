### Provider State Managment Appraoch

The most common appoarch is for statement is to used call backs / setstate, however lifting the state appoarch is not be ideal for complex application when we multiple screens. so reducing the callbacks we may provider whihch is also not ideal for big projects but as compare to callbacks it's far better.

state = data that's our application/widget use.

## Provider Package
3 techniques are used in the provider package.
1) Change notifier 
2) Change n0tifer provider
3) Consumer 

 Change notifier
   state which will be changed that can be defiend change notifier. chnage notifier is used to notify the consumer(widgets) that the state has changed. Instance of change notifier can be called anywhere in the code but we have to rapped that widget to change notifier provider that we can call the instance of change notiifer provider. like if we want to access all over the code than we can rapped our myApp widget with change notifer provider. However the recommended way to only do deep dive is to change widget for better performance.
   ```
   Text = Hello World -> change notifier 
   Consumer(
       Hello World
   )
    notifyLisnter will call after the change notifier is called.
   ```
