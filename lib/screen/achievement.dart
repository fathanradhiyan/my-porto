import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_porto/const/colors.dart';
import 'package:my_porto/models/achievements_model.dart';
import 'package:my_porto/provider/achievements_provider.dart';
import 'package:my_porto/screen/empty_page.dart';
import 'package:my_porto/widget/achievement_grid_card.dart';
import 'package:provider/provider.dart';

class Achievement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final achievementsProvider = Provider.of<AchievementsProvider>(context);
    List<AchievementsModel> achievementList = achievementsProvider.achievement;
    return achievementList.isEmpty
        ? Scaffold(body: EmptyPage())
        : Scaffold(
            appBar: AppBar(
              elevation: 3,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                'Achievement',
                style: GoogleFonts.mcLaren(
                    color: Theme.of(context).textSelectionColor),
              ),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 250 / 360, // feedsProducts width/height
              // crossAxisSpacing: 8,
              // mainAxisSpacing: 8,
              children: List.generate(achievementList.length, (index) {
                return ChangeNotifierProvider.value(
                  value: achievementList[index],
                  child: AchievementGridCard(),
                );
              }),
            ));
  }
}