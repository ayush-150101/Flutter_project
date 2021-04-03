import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_map/pages/world_time.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _locationsTiles = [];

  int flag = 0;



  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),

  ];


  void loadingScreen(){
    setState(() {
      flag = 1;
    });
  }

  void updateTime(index) async {
    WorldTime instance = locations[index];
    loadingScreen();
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
      'size': instance.size,
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    animation = Tween<double>(begin: 0.002, end: 0.003).animate(animationController);
    animation.addListener((){
      setState((){
        print (animation.value.toString());
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
  }

  @override
  Widget build(BuildContext context) {
   if(flag == 0)
    {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }),
      );
    }
   else
     {
       return Scaffold(
         backgroundColor: Colors.blue[600],
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

               ],
             )

         ),

       );
     }
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Tween<double> _sizeAnimation = Tween<double> (begin: 0.0, end: 500.0);
  AnimatedLogo({Key key, Animation animation}):super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Scaffold(
        body: Center(
          child: Transform.scale(
            scale: _sizeAnimation.evaluate(animation),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage :  AssetImage(
                    'assets/icon.jpg',
                  ),
                  radius: 40,
                ),
              ],
            ),
          ),
        ));
  }
}


