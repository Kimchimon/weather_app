import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';



class Model{
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg', color: Colors.black,);
    }
    else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow.svg', color: Colors.black,);
    }
    else if (condition == 800) {
      return SvgPicture.asset('svg/climacon-sun.svg', color: Colors.black,);
    }
    else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg', color: Colors.black,);
    }
  }

  Widget? getAirState(int index){
    if (index == 1){
      return Text('Good', style: GoogleFonts.lato(fontSize: 14.0,),);
    }
    else if (index == 2){
      return Text("Fair", style: GoogleFonts.lato(fontSize: 14.0,),);
    }
    else if (index == 3){
      return Text('Moderate', style: GoogleFonts.lato(fontSize: 14.0,),);
    }
    else if (index == 4){
      return Text('Poor', style: GoogleFonts.lato(fontSize: 14.0,),);
    }
    else if (index == 5){
      return Text('Very Poor', style: GoogleFonts.lato(fontSize: 14.0,),);
    }
  }
}

