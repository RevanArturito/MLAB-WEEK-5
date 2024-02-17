// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:deep_dive_get_cli/app/data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Post extends StatelessWidget {
  final PostModel postModel;
  final void Function()? onPressed;
  const Post({
    super.key,
    required this.postModel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  36,
                ),
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: Image.asset(
                    postModel.fotoProfile.isEmpty
                        ? ""
                        : 'assets/images/${postModel.fotoProfile}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postModel.namaAkun.isEmpty ? "" : postModel.namaAkun,
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  postModel.isSponsor
                      ? Text(
                          "Sponsored",
                          style: GoogleFonts.roboto(
                            fontSize: 11,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              Spacer(),
              Icon(Icons.more_horiz_rounded),
              SizedBox(width: 8)
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          'assets/images/${postModel.postingGambar}.png',
          width: double.infinity,
          height: 390,
        ),
        const SizedBox(
          height: 9.25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  postModel.isLike 
                  ? Icons.favorite
                  : Icons.favorite_border,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Image.asset('assets/images/comment.png', scale: 2.1),
              SizedBox(width: 14),
              Image.asset('assets/images/share.png', scale :2),
              Spacer(),
              Icon(Icons.bookmark_border_outlined, size: 28),
              SizedBox(width: 16,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 1),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: 'Liked by',
                  style: GoogleFonts.roboto(
                    color: Colors.black
                  ),
                ),
                TextSpan(
                  text: ' Raga',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                TextSpan(
                  text: ' and ${postModel.jumlahLike} Others',
                  style: GoogleFonts.roboto(
                    color: Colors.black
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child : RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '${postModel.namaAkun} ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                TextSpan(
                  text: '${postModel.description}',
                  style: GoogleFonts.roboto(
                   fontWeight: FontWeight.w400,
                   color: Colors.black
                  ),
                ),
              ],
            ),
          )
        ),
        SizedBox(height: 5),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "View all 16 comments",
            style: GoogleFonts.roboto(            
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Febryary 14  Suggested for you", 
            style: GoogleFonts.roboto(         
              textStyle: TextStyle(fontSize: 10)
            ),
          ),
        ),
      ],
    );
  }
}
