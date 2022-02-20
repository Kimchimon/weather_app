import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/model.dart';


class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirPollution});
  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}
class _WeatherScreenState extends State<WeatherScreen> {

  Model model = Model();
  String des = '';
  String cityName = '';

  int feeltemp = 0;
  int temp = 0;
  int hum = 0;
  int pre = 0;
  int aqi = 0;
  double pm10 = 0;
  double pm25 = 0;

  var date = DateTime.now();
  Widget? icon;
  Widget? airState;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData){
    double temp2 = weatherData['main']['temp'];
    double feeltemp2 = weatherData['main']['feels_like'];
    int condition = weatherData['weather'][0]['id'];
    int aircondition = airData['list'][0]['main']['aqi'];


    hum = weatherData['main']['humidity'];
    pre = weatherData['main']['pressure'];
    des = weatherData['weather'][0]['description'];
    aqi = airData['list'][0]['main']['aqi'];
    pm10 = airData['list'][0]['components']['pm10'];
    pm25 = airData['list'][0]['components']['pm2_5'];
    temp = temp2.round();
    feeltemp = feeltemp2.round();
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition);
    airState = model.getAirState(aircondition);
  }

  String getSystemTime(){
    var now = DateTime.now();
    return DateFormat('a h : mm').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(Icons.near_me),
            onPressed: (){},
            iconSize: 30.0,),
        actions: [IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.location_searching),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Stack(
          children: [
            Container(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 130.0,
                        ),
                        Text('$cityName',style: GoogleFonts.lato(fontSize: 30.0,fontWeight: FontWeight.bold,),),
                        Text(DateFormat('MMM dd EEEE').format(date), style: GoogleFonts.lato(fontSize: 16.0),),
                        TimerBuilder.periodic(
                          Duration(minutes: 1),
                          builder: (context){
                            return Text(('${getSystemTime()}'), style: GoogleFonts.lato(fontSize: 16.0),);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                        height: 230.0,
                        width: 230.0,
                        child: icon,
                      )
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$temp°C', style: GoogleFonts.lato(fontSize: 20.0,),),
                        Text('$des', style: GoogleFonts.lato(fontSize: 20.0,),),
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Column(
                      children: [
                        Divider(
                          height: 15.0,
                          thickness: 2.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Feels like', style: GoogleFonts.lato(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$feeltemp', style: GoogleFonts.lato(fontSize: 14.0,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('°C', style: GoogleFonts.lato(fontSize: 12.0,),),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Humidity', style: GoogleFonts.lato(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$hum', style: GoogleFonts.lato(fontSize: 14.0,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('%', style: GoogleFonts.lato(fontSize: 12.0,),),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Pressure', style: GoogleFonts.lato(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$pre', style: GoogleFonts.lato(fontSize: 14.0,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('hPa', style: GoogleFonts.lato(fontSize: 12.0,),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 40.0,
                                ),
                                Text('AQI', style:GoogleFonts.lato(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$aqi', style: GoogleFonts.lato(fontSize: 14.0,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                airState!
                              ],
                            ),
                            Column(
                              children: [
                                Text('PM10', style: GoogleFonts.lato(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$pm10', style: GoogleFonts.lato(fontSize: 14.0,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('μg/m3', style: GoogleFonts.lato(fontSize: 12.0,),),
                              ],
                            ),
                            Column(
                              children:[
                                Text('PM2.5', style: GoogleFonts.lato(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$pm25', style: GoogleFonts.lato(fontSize: 14.0,),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('μg/m3', style: GoogleFonts.lato(fontSize: 12.0,),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
