import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  TextEditingController searchController;

  CustomSearchBar({required this.searchController});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.labelColor),
        prefixIcon: IconButton(
          icon: SvgPicture.asset(
            "assets/Images/search_icon.svg",
            width: 40,
          ),
          onPressed: () {
            // Perform the search here
          },
        ),
        contentPadding: EdgeInsets.symmetric(vertical: height * 0.025),
        fillColor: Theme.of(context).cardColor,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
