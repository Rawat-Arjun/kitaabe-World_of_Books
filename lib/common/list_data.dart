import 'package:flutter/material.dart';
import 'package:kitaabe/views/home/drawer/contact%20us/contact_us_view.dart';
import 'package:kitaabe/views/home/drawer/faqs/faqs_view.dart';
import 'package:kitaabe/views/home/drawer/logout/logout_view.dart';
import 'package:kitaabe/views/home/drawer/profile/profile_view.dart';
import 'package:kitaabe/views/home/drawer/terms%20and%20policies/terms_and_policies_view.dart';

class ListData {
  static List onboardingPageArr = [
    {
      'title': "Discover a World of Stories",
      'sub_text':
          "Delve into a diverse collection of novels, non-fiction, poetry, and more. Whether you're into mysteries, self-help, or classics, there's something for every reader",
      'img': 'assets/images/on_1.svg',
    },
    {
      'title': "Personalized Just for You",
      'sub_text':
          "We understand your taste. Get personalized book recommendations based on your preferences, reading history, and favorite genres",
      'img': 'assets/images/on_2.svg',
    },
    {
      'title': "Your Reading, Anytime, Anywhere",
      'sub_text':
          "Enjoy your books wherever you are. With online reading, bookmarks, and customizable themes, your library is always at your fingertips.",
      'img': 'assets/images/on_3.svg',
    }
  ];

  static List<Map<String, String>> faqs = [
    {
      "question": "How do I enable night mode?",
      "answer":
          "Go to Settings and toggle Night Mode to reduce eye strain while reading in the dark.",
    },
    {
      "question": "Can I sign in with my Google account?",
      "answer":
          "Yes! Just tap 'Sign in with Google' on the login screen for quick access.",
    },
    {
      "question": "How do I find books by genre?",
      "answer":
          "Use the 'Genres' section to browse books based on categories like Fiction, Mystery, and many more.",
    },
    {
      "question": "Can I change my preferred genre?",
      "answer":
          "Yes! Go to Settings or the Genres tab to update your preferences anytime.",
    },
    {
      "question": "How do I leave a review for a book?",
      "answer":
          "Open the book details page, scroll down, and tap 'Write a Review' to share your thoughts.",
    },
    {
      "question": "How do I add a book to my favorites?",
      "answer":
          "Tap the heart ❤️ icon on any book to save it to your Favorites list.",
    },
    {
      "question": "Where can I find my bookmarked books?",
      "answer":
          "Go to your Profile and open the Favorites section to view your saved books.",
    },
    {
      "question": "What should I do if I can't log in?",
      "answer":
          "Check your internet connection and try again. If the issue persists, tap 'Forgot Password' or reinstall the app.",
    },
  ];

  static List<Map<String, String>> reviewsList = [
    {
      "book_name": "book name",
      "author_name": "author name",
      "review":
          "this is the review by user  this is the review by user this is the review by userthis is the rethis is the review by user this is the review by userthis is the rethis is the review by user this is the review by userthis is the rethis is the review by user this is the review by userthis is the rethis is the review by user this is the review by userthis is the rethis is the review by user this is the review by userthis is the re  this is the review by user this is the review by userthis is the review by userthis is the review by user",
      "rating": "4.5",
      "img": "book image"
    },
    {
      "book_name": "book name",
      "author_name": "author name",
      "review": " this is the review by user",
      "rating": "4.5",
      "img": "book image"
    },
    {
      "book_name": "book name",
      "author_name": "author name",
      "review": " this is the review by user",
      "rating": "4.5",
      "img": "book image"
    },
    {
      "book_name": "book name",
      "author_name": "author name",
      "review": " this is the review by user",
      "rating": "4.5",
      "img": "book image"
    },
    {
      "book_name": "book name",
      "author_name": "author name",
      "review": " this is the review by user",
      "rating": "4.5",
      "img": "book image"
    },
  ];

  static List<Map<String, String>> genresList = [
    {
      "name": "Romance",
      "img":
          "https://i0.wp.com/readwithstefani.com/wp-content/uploads/2021/12/collage-1.png"
    },
    {
      "name": "Fiction",
      "img":
          "https://www.scholastic.com/content/dam/scholastic/educators/book-lists/080824-nonfiction-grades-3-5-16-9.png.corpimagerendition.xxl.1400.788.png"
    },
    {
      "name": "Thriller",
      "img":
          "https://novelsuspects.com/wp-content/uploads/2020/09/EscapeIntoThesePsychologicalThrillers.png"
    },
    {
      "name": "Fantasy",
      "img":
          "https://cdn.kpbs.org/dims4/default/f829725/2147483647/strip/true/crop/1750x1078+83+0/resize/1760x1084!/format/webp/quality/90/?url=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2024%2F05%2F08%2Funtitled-design-63-_wide-ceaf458f328eaf47079bfc4c7560c59e97bfde79.jpg"
    },
    {
      "name": "Horror",
      "img":
          "https://images.herzindagi.info/her-zindagi-english/images/2024/10/25/article/image/horror-1729868961021.jpg"
    },
  ];

  static List<Map<String, dynamic>> drawerList = [
    {
      "name": "Profile",
      "icon": Icons.person,
      "route": MaterialPageRoute(
        builder: (context) => const ProfileView(),
      ),
    },
    {
      "name": "Contact Us",
      "icon": Icons.call,
      "route": MaterialPageRoute(
        builder: (context) => ContactUsView(),
      ),
    },
    {
      "name": "FAQs",
      "icon": Icons.question_answer,
      "route": MaterialPageRoute(
        builder: (context) => const FAQsView(),
      ),
    },
    {
      "name": "Terms N Policies",
      "icon": Icons.policy,
      "route": MaterialPageRoute(
        builder: (context) => const TermsAndPoliciesView(),
      ),
    },
    {
      "name": "Log Out",
      "icon": Icons.logout,
      "route": MaterialPageRoute(
        builder: (context) => const LogoutView(),
      ),
    },
  ];

  static List<Map<String, String>> pageArr = [
    {
      'title': "Discover a World of Stories",
      'sub_text':
          "Delve into a diverse collection of novels, non-fiction, poetry, and more. Whether you're into mysteries, self-help, or classics, there's something for every reader",
      'img': 'assets/images/on_1.svg',
    },
    {
      'title': "Personalized Just for You",
      'sub_text':
          "We understand your taste. Get personalized book recommendations based on your preferences, reading history, and favorite genres",
      'img': 'assets/images/on_2.svg',
    },
    {
      'title': "Your Reading, Anytime, Anywhere",
      'sub_text':
          "Enjoy your books wherever you are. With online reading, bookmarks, and customizable themes, your library is always at your fingertips.",
      'img': 'assets/images/on_3.svg',
    }
  ];

  static List<Map<String, String>> bookGenresList = [
    {
      "name": "Fiction & Sci-Fi",
      "img":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414i/44767458.jpg",
    },
    {
      "name": "Mystery & Thriller",
      "img":
          "https://novelonmymind.com/wp-content/uploads/2023/03/The-Silent-Patient-by-Alex-Michaelides.jpg"
    },
    {
      "name": "Comedy & Humor",
      "img":
          "https://m.media-amazon.com/images/I/51sEKdL7GlL._SY445_SX342_.jpg",
    },
    {
      "name": "Fantasy",
      "img":
          "https://ik.imagekit.io/panmac/tr:f-auto,di-placeholder_portrait_aMjPtD9YZ.jpg,w-270/edition/9781035052868.jpg",
    },
    {
      "name": "Romance",
      "img":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1651585695i/58857822.jpg"
    },
    {
      "name": "Horror",
      "img": "https://m.media-amazon.com/images/I/715qjNTdYML._SY466_.jpg",
    },
    {
      "name": "Biography",
      "img":
          "https://m.media-amazon.com/images/I/41zd1OAciUL._SY445_SX342_.jpg",
    },
    {
      "name": "Personal Development",
      "img": "https://booksondemand.ma/cdn/shop/files/POM.png",
    },
    {
      "name": "History & Politics",
      "img": "https://m.media-amazon.com/images/I/61BAecyH6oL._SY466_.jpg",
    },
    {
      "name": "Business & Finance",
      "img":
          "https://www.ft.com/__origami/service/image/v2/images/raw/http://ig.ft.com/static/sites/business-book-of-the-year/covers/More_Money_Than_God.jpg?source=ft_ig_business_book_award&width=400&quality=high",
    },
  ];

  static List<Color> genresColor = [
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.orange,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.indigo,
    Colors.brown,
    Colors.black,
    Colors.grey,
  ];

  static List<Map<String, String>> termsAndConditionsList = [
    {
      "term": "Introduction",
      "policy":
          "Welcome to Kitaabe, an online book reading platform. By using this app, you agree to the following terms and policies.",
    },
    {
      "term": "User Accounts & Responsibilities",
      "policy":
          "You must provide accurate information when signing up. Misuse, unauthorized access, or violation of community guidelines may result in account suspension.",
    },
    {
      "term": "Content Usage & Restrictions",
      "policy":
          "All book content is for personal use only. You may not copy, distribute, or reproduce any material without permission.",
    },
    {
      "term": "Privacy Policy",
      "policy":
          "We collect user data such as email, bookmarks, and reviews to improve user experience. We do not sell or misuse personal data.",
    },
    {
      "term": "Reviews & Community Guidelines",
      "policy":
          "Users must ensure that their reviews are respectful and relevant. Any offensive or misleading content may be removed.",
    },
    {
      "term": "Account Deletion & Data Removal",
      "policy":
          "You can request to delete your account from the profile settings. Some data may be retained for security and legal reasons.",
    },
    {
      "term": "Disclaimer & Liability",
      "policy":
          "This app is provided 'as is' without any warranties. We are not responsible for issues caused by third-party content.",
    },
    {
      "term": "Updates & Changes",
      "policy":
          "These terms may be updated from time to time. Continued use of the app indicates acceptance of the new terms.",
    },
    {
      "term": "Contact Information",
      "policy":
          "If you have any questions about these terms, please contact us at arjunrawat12121@gmail.com.",
    },
  ];
}
