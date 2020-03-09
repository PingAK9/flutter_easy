import 'package:flutter/material.dart';
import 'package:flutter_easy/core/menu.dart';

const String kAppName = 'Easy Flutter';
const double defaultPadding = 15;

const List<MenuItem> myMenu = [
  MenuItem(
      title: "Animations",
      icon: Icons.directions_run,
      items: ["Fancy Appbar Animation", "Sliver Appbar", "Hero Animation"]),
  MenuItem(title: "Onboarding", icon: Icons.info, items: [
    "Landing Page",
    "Onboarding 1",
    "Onboarding 2",
    "Onboarding 3",
    "Onboarding 4",
    "Onboarding 5",
    "Onboarding 6",
    "Onboarding 7",
    "Onboarding 8",
    "Onboarding 9",
    "Onboarding 10",
    "Onboarding 11"
  ]),
  MenuItem(
      title: "Profile",
      icon: Icons.account_box,
      items: ["Profile 1", "Profile 2"]),
  MenuItem(
      title: "Autnentication",
      icon: Icons.lock,
      items: ["Autnentication 1", "Autnentication 2"]),
  MenuItem(title: "List", icon: Icons.list, items: ["Places List one"]),
  MenuItem(title: "Food", icon: Icons.fastfood, items: [
    "Fastfood",
    "Cake Details",
    "Fruits Add to cart",
    "Recipe List",
    "Food Delivery"
  ]),
];
const List<Category> myCategory = [
  Category(title: 'Flare', icon: Icons.camera, router: '/flare'),
  Category(title: 'Pomping', icon: Icons.toll),
  Category(title: 'Comming soon', icon: Icons.navigate_next),
  Category(title: 'Aloha', icon: Icons.cake),
  Category(title: 'S1mple', icon: Icons.plus_one),
  Category(title: 'One more', icon: Icons.more),
  Category(title: 'Last Item', icon: Icons.last_page),
  Category(title: 'Still has', icon: Icons.question_answer),
];
