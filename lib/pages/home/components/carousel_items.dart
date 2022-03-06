import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'dart:html' as html;

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "APP DEVELOPER",
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "FAIZ\nAHAMMED",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Mobile Application developer, based in Kochi",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Need a full custom app?",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      " Got a project? Let's talk.",
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage("instagram_icon.png"),
                            fit: BoxFit.fill)),
                  ),
                  onTap: () {
                    html.window.open(
                        'https://www.instagram.com/faizahmmd/', "instagram");
                  },
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage("linkedin_icon.png"),
                            fit: BoxFit.fill)),
                  ),
                  onTap: () {
                    html.window.open(
                        'https://www.linkedin.com/in/faiz-ahammed-82b013b7/',
                        "linkedIn");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    image: Container(
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Image.asset(
          "assets/faizahammed.png",
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),
);
