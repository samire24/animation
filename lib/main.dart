import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int pageState= 0;
  var backgroundColor = Colors.white;
  var headColor = Color(0xFFB40284A);


  double headingTop = 100;
  double loginHeight = 0;
  double loginYOffset = 0;
  double loginXOffset = 0;
  double loginWidth = 0;
  double loginOpacity = 1;
  double registerYOff = 0;
  double registerHeight = 0;
  double windowWidth = 0;
  double windowHeight = 0;

  bool keyboadVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        keyboadVisible = visible;
        print("Keyboad State Changed : $visible");
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    loginHeight = windowHeight - 270;
    registerHeight = windowHeight - 270;

    switch ( pageState){
      case 0:
        headingTop =100;
        backgroundColor = Colors.white;
        headColor = Color(0xFFB40284A);
        loginYOffset = windowHeight;
        loginHeight = keyboadVisible ? windowHeight : windowHeight - 270;
        loginWidth = windowWidth;
        loginXOffset =0;
        loginOpacity = 1;
        registerYOff = windowHeight;
        break;
        case 1:
          headingTop =90;
        backgroundColor = Color(0xFFBD34C59);
        headColor = Colors.white;
        loginYOffset = keyboadVisible ? 40 : 270;
        loginHeight = keyboadVisible ? windowHeight : windowHeight - 270;
        loginXOffset = 0;
        loginWidth = windowWidth;
        loginOpacity = 1;
        registerYOff = windowHeight;

        break;
        case 2:

         headingTop = 80;
        backgroundColor = Color(0xFFBD34C59);
        headColor = Colors.white;
        loginYOffset = keyboadVisible ? 30 : 240;
        loginHeight = keyboadVisible ? windowHeight : windowHeight - 240;
        loginXOffset = 20;
        loginWidth = windowWidth - 40;
        loginOpacity = 0.70;
        registerYOff = keyboadVisible ? 50 : 270;
        registerHeight = keyboadVisible ? windowHeight : windowHeight - 270;
        break;
    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageState = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(
                          milliseconds: 1000
                        ),
                        margin: EdgeInsets.only(top: headingTop),
                          child: Text("Learn More",
                          style: TextStyle(
                              color: headColor,
                            fontSize: 29.0
                          ),
                          ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.all(32.0),
                        child: Text("the detailed organization and implementation of a complex operation"
                        "the logistics of a large-scale rock show demand certain necessities",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: headColor,
                          fontSize: 17.0
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Center(
                  child: Image.asset("assets/images/logg1.jpg"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if (pageState !=0){
                        pageState = 0;

                      }else
                        {
                          pageState = 1;
                        }
                    });

                  },
                  child: Container(
                    margin: EdgeInsets.all(32.0),
                    padding: EdgeInsets.all(20.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFB40284A),
                      borderRadius: BorderRadius.circular(50.0)
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),


        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: loginWidth,
          height: loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),
            transform: Matrix4.translationValues(loginXOffset, loginYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(loginOpacity),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Login To Continue",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email... ",
                  ),
                  SizedBox(height: 20,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password... ",
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Column(
               children: [
                 PrimaryButton(
                   btntxt: "Login",
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 GestureDetector(
                   onTap: (){
                     setState(() {
                       pageState = 2;
                     });
                   },
                   child: Onlinebtn(
                     btntxt: "Create New Account",
                   ),
                 ),
               ],
              ),
            ],
          ),

        ),
        AnimatedContainer(
          height: registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),
            transform: Matrix4.translationValues(0, registerYOff, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Create a New Account",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email... ",
                  ),
                  SizedBox(height: 20,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password... ",
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  PrimaryButton(
                    btntxt: "Create Account",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        pageState = 1;
                      });
                    },
                    child: Onlinebtn(
                      btntxt: "Back To Login",
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({this.icon, this.hint});
  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFBC7C7C7),
          width: 2
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: [
          Container(
            width: 60,
              child: Icon(
                  widget.icon,
              size: 20,
                color: Color(0xFFBB98989),
              ),
          ),
          Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint
                ),
              )
          )
        ],
      ),
    );
  }
}



class PrimaryButton extends StatefulWidget {
  final String btntxt;
  PrimaryButton({this.btntxt});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFB40284A),
        borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(widget.btntxt,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}

class Onlinebtn extends StatefulWidget {
  final String btntxt;
  Onlinebtn({this.btntxt});
  @override
  _OnlinebtnState createState() => _OnlinebtnState();
}

class _OnlinebtnState extends State<Onlinebtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFB40284A),
          width: 2
        ),

          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(widget.btntxt,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFB40284A),
          ),
        ),
      ),
    );
  }
}





