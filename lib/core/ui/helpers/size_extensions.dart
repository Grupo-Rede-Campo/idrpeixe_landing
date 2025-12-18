import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get breakpointPhone => 480; // Phones (até 480px)
  double get breakpointSmallTablet => 768; // Small Tablets (entre 481px e 768px)
  double get breakpointTablet => 1279; // Tablets (entre 769px e 1279px)
  double get breakpointMediumDesktop => 1439; // Medium Desktops (entre 1280px e 1439px)
  double get breakpointLargeDesktop => 1440; // Large Desktops (acima de 1440px)

  // Verifica se o dispositivo é mobile (até 480px)
  bool get isMobile => screenWidth <= breakpointPhone;
  // Verifica se o dispositivo é tablet (entre 481px e 768px)
  bool get isSmallTablet => screenWidth > breakpointPhone && screenWidth <= breakpointSmallTablet;
  // Verifica se o dispositivo é tablet (entre 769px e 1279px)
  bool get isTablet => screenWidth > breakpointSmallTablet && screenWidth <= breakpointTablet;
  // Verifica se o dispositivo é medium desktop (entre 1280px e 1439px)
  bool get isMediumDesktop => screenWidth > breakpointTablet && screenWidth <= breakpointMediumDesktop;
  // Verifica se o dispositivo é large desktop (acima de 1440px)
  bool get isLargeDesktop => screenWidth >= breakpointLargeDesktop;

  //bool get isSmallerThanPhone => screenWidth <= breakpointPhone;
  bool get isSmallerThanSmallTablet => screenWidth <= breakpointSmallTablet;
  bool get isSmallerThanTablet => screenWidth <= breakpointTablet;
  bool get isSmallerThanMediumDesktop => screenWidth <= breakpointMediumDesktop;
  bool get isSmallerThanLargeDesktop => screenWidth <= breakpointLargeDesktop;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  double percentWidth(double percent) => MediaQuery.of(this).size.width * percent;
  double percentHeight(double percent) => MediaQuery.of(this).size.height * percent;
}
