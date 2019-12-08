/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:time/time.dart';

import 'package:diet_driven/models/models.dart';

/// Shows optionally sticky nutrition header.
class NutritionHeader extends StatelessWidget {
  /// Meal name eg. Breakfast.
  final String mealName;

  /// ...
  final bool nutrientsVisible;

  /// List of nutrients to show in addition to calories.
  final List<Nutrient> nutrients;

  /// Called when the user taps this nutrition header.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this nutrition header.
  final GestureLongPressCallback onLongPress;

  const NutritionHeader({
    Key key,
    @required this.mealName,
    this.nutrientsVisible = false,
    @required this.nutrients,
    this.onTap,
    this.onLongPress
  }) : assert(mealName != null), assert(nutrients != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // Opaque header container
        height: 30,
//        height: 40,
//        padding: const EdgeInsets.symmetric(horizontal: 16),
//        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        padding: const EdgeInsets.only(left: 16, right: 16),
//        margin: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.centerLeft,
//        color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.08), // .withOpacity(stuckAmount.clamp(0.0, 1.0)),
//            color: Color.fromRGBO(0, 0, 0, 0.08 * stuckAmount.clamp(0.0, 1.0)), // .withOpacity(stuckAmount.clamp(0.0, 1.0)),
          )),
        ),
        child: Row(
          // Align text to single baseline
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            // Meal name takes as much space as possible
            Expanded(
              child: Text(
                mealName.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: const Color.fromRGBO(0, 0, 0, 0.6),
                ),
              ),
            ),

            // Fixed sized nutrient headers are dynamically loaded
            for (var nutrient in nutrients)
              AnimatedOpacity(
                opacity: nutrientsVisible ? 1 : 0,
                duration: 200.milliseconds,
                curve: Curves.easeInOut, // linear
                child: SizedBox(
                  width: 60,
                  child: Text(
                    nutrient.toString().toUpperCase(), // TODO: capitalize!
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                      color: nutrient == Nutrient.protein // TODO: dynamic, store in map
                        ? const Color(0xFF8B041B)
                        : nutrient == Nutrient.fat
                          ? const Color(0xFFC89C00)
                          : const Color(0xFF219653),
                    ),
                  ),
                ),
              ),

            // Fixed sized calorie header
            AnimatedOpacity(
              opacity: nutrientsVisible ? 1 : 0,
              duration: 200.milliseconds,
              curve: Curves.easeInOut, // linear
              child: SizedBox(
                width: 60,
                child: Text(
                  "CALS",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                    color: const Color.fromRGBO(0, 0, 0, 0.9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
