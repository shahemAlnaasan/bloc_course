# bloc_course

BloC:
Bloc stands for Business Logic Component, and it is a state management pattern that helps in separating the UI components from the business logic
It helps in managing state and make access to data from a central place in our project.
relies on events to trigger state changes rather than functions.
receive events and convert the incoming events into outgoing states.

 - Bloc takes an event triggered by the user like changeAppTheme Button as an input, and responds back to the UI with the relevant state.
 - When you use flutter bloc you are going to create events to trigger the interactions with the app and then the bloc in charge is going to emit the requested data with a state

Now to access bloc data in UI we need to provide this bloc to the widget tree so that we can use the data and display it on the screen, so here we'er going to use Widgets provided by bloc like:
  -BlocProvider:
      .this widget provides one bloc to its children.
      .We have to put it at the place from where all the children can access the bloc, So we can wrap the BlocProvider inside MaterialApp.
      .If we have multiple blocs we will use a MultiBlocProvider for it, It provides us a MultiBlocProvider widget that takes a List of Bloc and provides it to its children.
      
  -BlocBuilder:
      BlocBuilder is a widget that helps Re-building the UI based on State changes, So it builds the UI every single time state changes.
      make sure you wrap the BlocBuilder around the widget that needs to be rebuilt when the state changes, Because alot of time and power will be consumed when your whole widget tree rebuilds 
      just to update a Text widget inside the tree.
         . BlocBuilder takes two things bloc, and state.
         . builder the function is required which takes two parameters. context and the state And it should return Widget in response.
         
   also we can access Bloc using:
    -context.read<WeatherBloc>().add(Decrement());
                            or
    -BlocProvider.of<WeatherBloc>(context)add(Decrement())
      
  -BlocListener:
     .this will listen to any state change as BlocBuilder does 
     .But instead of building the widget like BlocBuilder, it takes one function, listener which is called only once per state, not including the initial state.
     .It only listens to the state changes and performs some operations. The operation could be (Navigating to other screens when state changes, Showing Snackbar on a particular state, etc).
    
  -BlocConsumer:
    . This widget combines both BlocListener and BlocBuilder.
    . So we can build a widget using build property and showing a snackbar using listener property

Cubit
 - When we use cubit, we can only send “states” and to trigger these states we can do it by calling a function (like actions)
 - The Big difference between BLoC and Cubit is that “BLoC is Event-Driven and Cubit not.”
 - The choice between Bloc and Provider largely depends on the complexity and requirements of your project.
 - Cubit can be used in the same way that Bloc is used to access data in UI



   
