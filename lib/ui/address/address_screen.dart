import 'package:e_commerce_app/components/custom_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_button_screen_name.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "address_screen";

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.09),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        "assets/Images/arrow_left.svg",
                        height: height * 0.05,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                child: Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).hintColor),
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: CustomTextField(
                labelText: 'Name',
                hintText: 'Mrh Raju',
                controller: nameController,
                maxLines: 1),
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: CustomTextField(
                    labelText: 'Country',
                    hintText: 'Bangladesh',
                    controller: countryController,
                    maxLines: 1),
              )),
              SizedBox(width: width * 0.05),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: width * 0.04),
                child: CustomTextField(
                    labelText: 'City',
                    hintText: 'Sylhet',
                    controller: cityController,
                    maxLines: 1),
              )),
            ],
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: CustomTextField(
                labelText: 'Phone Number',
                hintText: '+880 1453-987533',
                controller: phoneController,
                maxLines: 1),
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: CustomTextField(
                labelText: 'Address',
                hintText: 'Chhatak, Sunamgonj 12/8AB',
                controller: addressController,
                maxLines: 1),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text("Save as primary address",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).secondaryHeaderColor)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Save Address',
      ),
    );
  }
}
