import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/states/display/display_bloc.dart';
import 'package:calculator/states/display/display_event.dart';
import 'package:calculator/states/display/display_state.dart';
import 'package:calculator/widgets/display_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, appTheme) => Container(
        color: appTheme.theme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            BlocBuilder<DisplayBloc, DisplayState>(
              builder: (context, displayState) => Expanded(
                child: SizedBox.expand(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => BlocProvider.of<DisplayBloc>(context)
                            .add(PushResultToClipboard()),
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              displayState.result,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: appTheme.theme.text,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              displayState.expression,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: appTheme.theme.text,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
            const DisplayBar(),
          ],
        ),
      ),
    );
  }
}
