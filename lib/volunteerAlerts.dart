import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class VolunteerAlerts extends StatefulWidget {
  const VolunteerAlerts({Key? key}) : super(key: key);

  @override
  State<VolunteerAlerts> createState() => _VolunteerAlertsState();
}

class _VolunteerAlertsState extends State<VolunteerAlerts> {

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Alerts"),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff895263),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                    color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                    onTap: (){
                      launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                    },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff895263),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                      onTap: (){
                        launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                      },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff895263),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                      onTap: (){
                        launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                      },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff895263),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                      onTap: (){
                        launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                      },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff895263),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                      onTap: (){
                        launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                      },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff895263),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                      onTap: (){
                        launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                      },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff895263),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello Volunteer",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Alert time: 10:15",style:TextStyle(
                      color: Colors.white
                  ),),
                  const Text("Please Move to this Point:",style:TextStyle(
                      color: Colors.white
                  ),),
                  InkWell(
                      onTap: (){
                        launchURL('https://maps.app.goo.gl/nSmhqxPCMnzhvTro8');
                      },
                      child: const Text("google Map pin",style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
