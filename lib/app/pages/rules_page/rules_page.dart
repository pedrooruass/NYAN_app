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
           Text(
            'Autonomous',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: AppColors.green,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Robots may Deliver Pre-loaded Boxes to a randomly selected level of the Alliance Shipping Hub. Teams may opt to use the Duck placed on the field, or may use their Team Shipping Element, which provides more points when used to determine where Freight is delivered to the correct level of the Alliance Shipping Hub. Alliances also earn points by Navigating to the Storage Unit or Warehouse, Scoring Freight in the Storage Unit or Alliance Shipping Hub, and Delivering Ducks onto the Playing Field Floor via the Carousel.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
           Divider(
            thickness: 2,
            color: AppColors.grey,
          ),
          /* --------------------------- Driver Crontrolled --------------------------- */
           Text(
            'Driver Controlled',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: AppColors.orange,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Alliances earn points by collecting Freight from the Warehouse and Scoring the Freight in the Storage Unit, their Aliance Shippping Hub, or the Shared Shipping Hub',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
           Divider(
            thickness: 2,
            color: AppColors.grey,
          ),
          /* -------------------------------- End Game -------------------------------- */
           Text(
            'End Game',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: AppColors.red,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Alliances may Deliver Ducks onto the Playing Field via the Carousels. If the Team Shipping Element was not introduced during pre-Match setup, Alliances may also Deliver their Team Shipping Element. The Team Shipping Element may be used to Cap their Alliance Shipping Hub to earn points. An Alliance will earn Balance points for the Alliance Shipping Hub being Balanced. If an Alliance’s section of the Shared Shipping Hub is contacting the tile floor, the Alliance will earn points.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          Image.asset(
            "assets/ftc.png",
            height: 45,
          ),
          Container(color: AppColors.white, height: 150,),
        ],
      ),
    );
  }
}
