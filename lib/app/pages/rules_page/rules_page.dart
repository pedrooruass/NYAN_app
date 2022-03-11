import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /* ------------------------------- Autonomous ------------------------------- */
          AutoSizeText(
            'Autonomous',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.09,
              color: AppColors.green,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          AutoSizeText(
            "Robots may Deliver Pre-loaded Boxes to a randomly selected level of the Alliance Shipping Hub. Teams may opt to use the Duck placed on the field, or may use their Team Shipping Element, which provides more points when used to determine where Freight is delivered to the correct level of the Alliance Shipping Hub. Alliances also earn points by Navigating to the Storage Unit or Warehouse, Scoring Freight in the Storage Unit or Alliance Shipping Hub, and Delivering Ducks onto the Playing Field Floor via the Carousel.",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 2,
            color: AppColors.grey,
          ),
          /* --------------------------- Driver Crontrolled --------------------------- */
          AutoSizeText(
            'Driver Controlled',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.09,
              color: AppColors.orange,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          AutoSizeText(
            'Alliances earn points by collecting Freight from the Warehouse and Scoring the Freight in the Storage Unit, their Aliance Shippping Hub, or the Shared Shipping Hub',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 2,
            color: AppColors.grey,
          ),
          /* -------------------------------- End Game -------------------------------- */
          AutoSizeText(
            'End Game',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.09,
              color: AppColors.red,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          AutoSizeText(
            'Alliances may Deliver Ducks onto the Playing Field via the Carousels. If the Team Shipping Element was not introduced during pre-Match setup, Alliances may also Deliver their Team Shipping Element. The Team Shipping Element may be used to Cap their Alliance Shipping Hub to earn points. An Alliance will earn Balance points for the Alliance Shipping Hub being Balanced. If an Alliance’s section of the Shared Shipping Hub is contacting the tile floor, the Alliance will earn points.',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 2,
            color: AppColors.grey,
          ),
          AutoSizeText(
            'Sponsors',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.09,
              color: Colors.blue,
            ),
          ),
          Image.asset(
            "assets/laser precision.png",
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.033),
            child: Image.asset(
              "assets/HydraForce.png",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Image.asset(
            "assets/Carmel Crest Ribbon.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
