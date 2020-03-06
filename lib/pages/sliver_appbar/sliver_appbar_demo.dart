import 'package:flutter/material.dart';
import 'package:flutter_easy/core/menu.dart';

class SliverAppbarDemo extends StatelessWidget {
  final List<dynamic> pages = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('FlexibleSpaceBar Title'),
              background: Placeholder(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                pages.map((page) => _buildExpandableMenu(page, context)).toList()),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableMenu(MenuItem page, BuildContext context) {
    return ExpansionTile(
      leading: Icon(page.icon),
      title: Text(
        "${page.title} (${page.items.length} layouts)",
        style: Theme.of(context).textTheme.title,
      ),
      children: _buildSubMenus(page.items, context),
    );
  }

  List<Widget> _buildSubMenus(List<String> items, BuildContext context) {
    final List<Widget> subMenus = [];
    items.forEach((item) => subMenus.add(_buildSubMenu(item, context)));
    return subMenus;
  }

  Widget _buildSubMenu(String item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: ListTile(
        leading: Icon(Icons.arrow_right, color: Theme.of(context).primaryColor),
        contentPadding: EdgeInsets.all(0),
        dense: false,
        isThreeLine: false,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.code),
              onPressed: () {},
            ),
          ],
        ),
        title: Text(
          item,
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {},
      ),
    );
  }
}
