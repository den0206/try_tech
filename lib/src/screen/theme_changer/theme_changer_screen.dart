import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_tech/src/routes/routes.dart';
import 'package:try_tech/src/theme/theme.dart';

class ThemeChangerScreen extends StatelessWidget {
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
      ),
      drawer: ThemeDrawer(),
      body: _MenuList(),
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      itemCount: pageRoutes.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: appTheme.colorScheme.secondary);
      },
      itemBuilder: (BuildContext context, int index) {
        final route = pageRoutes[index];

        return ListTile(
          title: Text(route.title),
          trailing: Icon(
            route.iconData,
            color: appTheme.colorScheme.secondary,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return route.page;
                },
              ),
            );
          },
        );
      },
    );
  }
}

class ThemeDrawer extends StatelessWidget {
  const ThemeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                child: Text(
                  "NM",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(
            child: _MenuList(),
          ),
          ListTile(
            title: Text("Dark Mode"),
            leading: Icon(
              Icons.lightbulb_outline,
              color: appTheme.currentTheme.colorScheme.secondary,
            ),
            trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              onChanged: (value) {
                appTheme.darkTheme = value;
              },
            ),
          ),
          SafeArea(
            bottom: true,
            left: false,
            right: false,
            top: false,
            child: ListTile(
              title: Text("Custom Mode"),
              leading: Icon(
                Icons.add_to_home_screen,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                onChanged: (value) {
                  appTheme.customTheme = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
