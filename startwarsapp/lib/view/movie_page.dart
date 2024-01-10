import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:startwarsapp/models/movie_model.dart';
import 'package:startwarsapp/viewmodels/home.viewmodel.dart';

class MoviePage extends StatelessWidget {
  final Results movie;

  const MoviePage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = Get.find();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            title: Text(
              movie.title ?? '',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 30.0,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                height: Get.height / 4,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      movie.title ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(("Realease Date"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                )),
                            Text((movie.releaseDate ?? ''),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(("Director"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                )),
                            Text((movie.director ?? ''),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Producer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            if (movie.producer != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: movie.producer!
                                    .split(', ')
                                    .map((producerName) => Text(
                                          producerName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ))
                                    .toList(),
                              ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Opening craw",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                    const SizedBox(height: 10),
                    Text(
                      controller.truncateDescription(
                          movie.openingCrawl ?? '', 1000),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Created"),
                            Text(controller.formatDate(movie.created ?? '')),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Edited"),
                            Text(controller.formatDate(movie.edited ?? '')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
