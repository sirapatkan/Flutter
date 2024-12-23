import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    title: "Profile",
    home: Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(  // เพื่อให้สามารถเลื่อนดูข้อมูลได้หากข้อมูลยาว
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ใช้ Image.asset เพื่อแสดงรูปภาพจาก assets
              ClipRRect(
                borderRadius: BorderRadius.circular(100),  // ทำให้รูปภาพเป็นวงกลม
                child: Image.asset(
                  "assets/images/person.jpg", // ระบุ path ของไฟล์รูปภาพใน assets
                  width: 150, // ขนาดรูปภาพ
                  height: 150,
                  fit: BoxFit.cover,  // ทำให้รูปภาพไม่ยืดหรือหด
                ),
              ),
              SizedBox(height: 20), // เว้นช่องว่างระหว่างรูปภาพและข้อมูล

              // แสดงข้อมูลชื่อ
              Text(
                "Phattanison Kaison",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              
              // ข้อมูล nickname
              Text(
                "Nickname: Phakbung",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              SizedBox(height: 20),

              // ข้อมูลงานอดิเรกและอาหาร
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInfoColumn("Hobby", "read a book"),
                  _buildInfoColumn("Food", "Noodles"),
                ],
              ),
              SizedBox(height: 20), // เว้นช่องว่างระหว่างบรรทัด

              // ข้อมูลสถานที่เกิด
              _buildSectionTitle("Birthplace"),
              Text(
                "Phichit",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 20),

              // ข้อมูลการศึกษา
              _buildSectionTitle("Education"),
              SizedBox(height: 10),

              // การศึกษา
              _buildEducationCard("Elementary", "Watkaosai School", "2015"),
              _buildEducationCard("Primary", "Kaosai tapklo Wittaya School", "2018"),
              _buildEducationCard("High School", "Kaosai tapklo Wittaya School", "2022"),
              _buildEducationCard("Undergrad", "Naresuan University", "2026"),
            ],
          ),
        ),
      ),
    ),
  );
  runApp(app);
}

// Widget สำหรับแสดงข้อมูลในรูปแบบ Section Title
Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
  );
}

// Widget สำหรับแสดงข้อมูลในรูปแบบ Column
Widget _buildInfoColumn(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    ),
  );
}

// Widget สำหรับแสดงข้อมูลการศึกษาที่ถูกตกแต่งให้ดูดี
Widget _buildEducationCard(String level, String school, String year) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0),  // เว้นระยะระหว่างการ์ด
    elevation: 5,  // เพิ่มเงาให้การ์ดดูลอย
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),  // ทำให้การ์ดมีมุมโค้ง
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$level: $school",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Year: $year",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}
