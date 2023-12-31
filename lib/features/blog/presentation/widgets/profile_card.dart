import 'dart:io';

import 'package:blog_application/features/blog/domain/entities/user.dart';
import 'package:blog_application/features/blog/presentation/widgets/select_image%20copy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  final File? file;
  final Future<void> Function(File?) onSelected;
  final bool uploading;
  const ProfileCard(
      {super.key,
      required this.user,
      required this.onSelected,
      this.file,
      required this.uploading});
  @override
  Widget build(BuildContext context) {

    
    var  imageUrl = const DecorationImage(
                              image: AssetImage('assets/images/avator.jpeg') ,
                              fit: BoxFit.fill,
                            );
    if(user.image!= null){
      imageUrl = DecorationImage(
                              image: NetworkImage(user.image!) ,
                              fit: BoxFit.fill,
                            );
    }
    
    return Container(
        width: 340,
        height: 284,
        decoration: ShapeDecoration(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0F5182FF),
              blurRadius: 15,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),
      

        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        width: 84,
                        height: 84,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Color(0xFF376AED)),
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Container(
                          width: 66.71,
                          height: 66.71,
                          decoration: ShapeDecoration(
                            image: imageUrl,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        )),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: uploading
                            ? const Center(child: CircularProgressIndicator())
                            : ProfileImageSelect(onSelected: onSelected))
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@${user.email.substring(0, 5)}",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.24,
                      ),
                    ),
                    Text(
                      user.fullName ?? 'Natinael Tafese',
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        color:Theme.of(context).colorScheme.primary,
                        fontSize: 18,

                        fontStyle: FontStyle.italic,
                        fontFamily: GoogleFonts.urbanist().fontFamily,
                        fontWeight: FontWeight.w100,
                        height: 1.25,
                      ),
                    ),
            SizedBox(
                      width: 100,
                      child: Text(
                        user.expertise ?? 'UX Designer',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontFamily: GoogleFonts.urbanist().fontFamily,
                          fontWeight: FontWeight.w100,
                          height: 1.25,
                        ),

                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'About me',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: GoogleFonts.urbanist().fontFamily,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(height: 11),
            Text(
              user.bio ??
                  'Madison Blackstone is a director of user experience design, with experience managing global teams.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontFamily: GoogleFonts.urbanist().fontFamily,
                fontWeight: FontWeight.w100,
                height: 1.43,
              ),
            ),
          ]),
        ));
  }
}
