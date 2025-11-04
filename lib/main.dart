import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "EventKu App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // Atur warna background utama jadi abu-abu sangat muda
        scaffoldBackgroundColor: Colors.grey[50], 
        
        // 2. Terapkan Poppins ke seluruh TextTheme
        // Ini akan membuat semua teks di aplikasi otomatis pakai Poppins
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(brightness: Brightness.light).textTheme,
        ),
        
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.black),
          
          // 3. Terapkan Poppins ke AppBar secara spesifik (agar konsisten)
          titleTextStyle: GoogleFonts.poppins( 
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}