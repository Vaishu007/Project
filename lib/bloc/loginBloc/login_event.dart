abstract class loginEvent{}

class logTextchangedEvent extends loginEvent{
  logTextchangedEvent(this.mobile,this.password);
  String mobile,password;
}
