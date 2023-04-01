import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';


class loginBLoc extends Bloc<loginEvent,loginState>{
 loginBLoc():super(logIntialState()){
  on<logTextchangedEvent>((event, emit) {
   if(event.mobile.length<10){
    emit(logErrorState("Please Enter Valid Phone number"));
   }else if(event.password.length<8){
    emit(logErrorState('please enter valid password'));
   }else {
    emit(logValidState());
   }
  });

 }

}