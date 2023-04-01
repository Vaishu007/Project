abstract class registrationState{}

class regInitialState extends registrationState{}
class regValidState extends registrationState{}
class regErrorState extends registrationState{
 regErrorState(this.msg);
  String msg;
}
