import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smit_project/bloc/registrationBloc/registratioin_state.dart';
import 'package:smit_project/bloc/registrationBloc/registration_event.dart';



class registrationBloc extends Bloc<Registration_event,registrationState>{
  registrationBloc():super(regInitialState()){
    on<regTextChangedEvent>((event, emit) {
      if(event.name==""){
        emit(regErrorState("Please Enter Name"));
      }else if(event.mobile.length<10){
        emit(regErrorState("Please Enter Mobile Number"));
      }else if(EmailValidator.validate(event.email)==false){
        emit(regErrorState("Please Enter Email"));
      }else if(event.password.length<8){
        emit(regErrorState("Please Enter Password"));
      }else if(event.address==""){
        emit(regErrorState("Please Enter Address"));
      }else{
        emit(regValidState());
      }
    });
  }
}