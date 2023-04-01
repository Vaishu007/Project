import 'dart:ui';

import 'package:flutter/material.dart';

import '../page/mrg_detail.dart';
class Boy extends StatefulWidget {
  const Boy({Key? key}) : super(key: key);

  @override
  State<Boy> createState() => _BoyState();
}

class _BoyState extends State<Boy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Text(
                  'Meet designers from around the world',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: InkWell(
                  onTap: () async {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Mrg_Detail(),));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://images.unsplash.com/photo-1652201767823-ae96c668b670?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60',
                        ).image,
                      ),
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 5,
                          color: Color(0x2B202529),
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 5,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0x6CFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Smit Modi',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: Text(
                                          '23/08/2002',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 6, 0, 6),
                                        child: Text(
                                          '9925478901',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:
                                            Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'c/218 bhavik nagar ,adinathnager odhav ahmedabad',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 44),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        'https://images.unsplash.com/photo-1652207168425-33b5bb4c14b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60',
                      ).image,
                    ),
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 5,
                        color: Color(0x2B202529),
                        offset: Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 5,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                color: const Color(0x6CFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Judy Garland',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 0),
                                      child: Text(
                                        'Founder, CEO',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Founded her own agency and works with creatives from around the globe for fortune 500 companies.',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
