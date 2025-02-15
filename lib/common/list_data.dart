import 'package:flutter/material.dart';

class ListData {
  final faqs = [
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

  final bookList = [
    {
      "name": "To Kill A Mockingbird",
      "author": "Harper Lee",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg",
      "rating": "5",
    },
    {
      "name": "Invisible Man",
      "author": "Ralph Ellison",
      "img":
          "https://m.media-amazon.com/images/I/41Gh5-nfqKL._SY445_SX342_.jpg",
      "rating": "4.5",
    },
    {
      "name": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "img":
          "https://rukminim2.flixcart.com/image/416/416/kgiaykw0/book/4/2/9/the-great-gatsby-original-imafwqc4fdxy5ymr.jpeg",
      "rating": "5",
    },
    {
      "name": "The Fault in Our Stars",
      "author": "John Green",
      "img":
          "https://m.media-amazon.com/images/I/51r27MDeQQL._SY445_SX342_.jpg",
      "rating": "4.5",
    },
    {
      "name": "Lord of The Flies",
      "author": "William Golding",
      "img":
          "https://upload.wikimedia.org/wikipedia/en/9/9b/LordOfTheFliesBookCover.jpg",
      "rating": "4",
    },
  ];

  final reviewsList = [
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

  final genresList = [
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

  final menuList = [
    {
      "name": "My Books",
      "icon": Icons.book,
    },
    {
      "name": "Profile",
      "icon": Icons.person,
    },
    {
      "name": "Favourite",
      "icon": Icons.favorite_rounded,
    },
    {
      "name": "Settings",
      "icon": Icons.settings,
    },
    {
      "name": "Account",
      "icon": Icons.account_circle,
    },
    {
      "name": "Help",
      "icon": Icons.info,
    },
    {
      "name": "FAQs",
      "icon": Icons.question_answer,
    },
    {
      "name": "Log Out",
      "icon": Icons.logout,
    },
  ];

  final pageArr = [
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

  final tagList = ['Genres', 'Best Sellers', 'Trending', 'New Release'];

  final bookGenresList = [
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

  final genresColor = [
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
}
