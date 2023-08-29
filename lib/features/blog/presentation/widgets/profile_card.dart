import 'package:blog_application/features/blog/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  ProfileCard({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    
    const image_url = AssetImage("assets/images/avator.jpg");
    if(user.image!= null){
      NetworkImage image_url = NetworkImage(user.image?? "");
    }
    
    return Container(
        width: 295,
        height: 284,
        decoration: ShapeDecoration(
          color: Colors.white,
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
                Container(
                    width: 84,
                    height: 84,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF376AED)),
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Container(
                      width: 66.71,
                      height: 66.71,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                        scale: 10,
                        image: image_url,
                          
                          fit: BoxFit.scaleDown,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    )),
                const SizedBox(width: 24),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@" + user.email.substring(0,5),
                      style: const TextStyle(
                        color: Color(0xFF2D4379),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.24,
                      ),
                    ),
                    Text(
                      user.fullName ?? "Jovi Daniel",
                      style: TextStyle(
                        color:const  Color(0xFF0D253C),
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: GoogleFonts.urbanist().fontFamily,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      user.expertise ?? 'UX Designer',
                      style: TextStyle(
                        color: Color(0xFF376AED),
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontFamily: GoogleFonts.urbanist().fontFamily,
                        fontWeight: FontWeight.w100,
                        height: 1.25,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 24),
            Text(
              'About me',
              style: TextStyle(
                color: Color(0xFF0D253C),
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: GoogleFonts.urbanist().fontFamily,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 11),
            Text(
              user.bio ?? 'Madison Blackstone is a director of user experience design, with experience managing global teams.',
              style: TextStyle(
                color: Color(0xFF2D4379),
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
