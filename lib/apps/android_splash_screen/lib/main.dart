// ignore_for_file: prefer_const_constructors

/*
 * Copyright (C) 2021 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
  * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';


class MySplashHomePage extends StatefulWidget {
  const MySplashHomePage({super.key, required this.title});

  final String title;

  @override
  State<MySplashHomePage> createState() => _MySplashHomePageState();
}

class _MySplashHomePageState extends State<MySplashHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android Center"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 42, bottom: 250),
                child: Align(
                    alignment: Alignment.topCenter, child: CustomAppBar())),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/* A Flutter implementation of the last frame of the splashscreen animation */
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Row(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36.0),
              child: Image.network(
                'https://yt3.googleusercontent.com/zvqp-zbY1gF-PlnaM70qLxc5JHEmgI7m3Zed7rNTJ2rKda1o9LudRJ4Zalc3rVjsxoTjq13aRw=s900-c-k-c0x00ffffff-no-rj',
                width: 72.0,
                height: 72.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text("Super Splash Screen Demo",
              style: TextStyle(color: Colors.black54, fontSize: 24)),
        ),
      ],
    );
    return titleSection;
  }
}
