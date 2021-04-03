import 'package:flutter/material.dart';
import 'package:world_map/pages/world_time.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController animationController;



  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
      'size' : instance.size,
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    animation = Tween<double>(begin: 0.002, end: 0.003).animate(animationController);
    animation.addListener((){
      setState((){
        //print (animation.value.toString());
      });
    });
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      } else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blue,
      body:
      Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvatarGlow(
            glowColor: Colors.grey[700],
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(     // Replace this child with your own
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.blue[800],
                child: CircleAvatar(
                  backgroundImage :  AssetImage(
                    'assets/icon.jpg',
                  ),
                  radius: 40,
                ),
                radius: 40.0,
              ),
            ),
          ),

          SizedBox(height: 30,),

          SizedBox(
            height: 50,
            child: WavyAnimatedTextKit(
              textStyle: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
              text: [
                "WORLD MAP",
              ],
              isRepeatingAnimation: true,
            ),
          ),

        ],
      )

      ),

   );
  }
}

