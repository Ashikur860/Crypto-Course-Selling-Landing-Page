# ক্রিপ্টো কোর্স - বাংলায় ক্রিপ্টোকারেন্সি লার্নিং প্ল্যাটফর্ম

একটি সম্পূর্ণ বাংলা ক্রিপ্টোকারেন্সি কোর্স ল্যান্ডিং পেজ যা ডাটাবেস-চালিত এবং এডমিন প্যানেল সহ।

## 📋 Project Overview

এই প্রজেক্টে রয়েছে:
- 🎯 স্ট্যাটিক ল্যান্ডিং পেজ (`index.html`)
- 🔄 ডায়নামিক ডাটাবেস-চালিত পেজ (`index-dynamic.html`)
- 🛠️ এডমিন প্যানেল (`admin.html`)
- 🔌 REST API (`api.php`)
- 🗄️ ডাটাবেস স্কিমা (`database.sql`)
- 🚀 Vercel ডিপ্লয়মেন্ট কনফিগারেশন

## 🚀 Quick Start

### 1. স্ট্যাটিক ভার্সন (সহজ)
```bash
# সরাসরি ব্রাউজারে খুলুন
open index.html
```

### 2. ডায়নামিক ভার্সন (পূর্ণ কন্ট্রোল)
```bash
# ডাটাবেস সেটআপ
mysql -u root -p < database.sql

# ডাটাবেস কনফিগারেশন আপডেট করুন api.php তে
# তারপর খুলুন
open index-dynamic.html
```

## 📁 Project Structure

```
crypto-course-landing/
├── index.html              # স্ট্যাটিক ল্যান্ডিং পেজ
├── index-dynamic.html       # ডায়নামিক ল্যান্ডিং পেজ
├── admin.html              # এডমিন প্যানেল
├── api.php                 # REST API এন্ডপয়েন্ট
├── database.sql            # ডাটাবেস স্কিমা
├── vercel.json             # Vercel কনফিগারেশন
├── package.json            # প্রজেক্ট মেটাডেটা
└── README.md               # এই ফাইল
```

## 🗄️ Database Setup

### ডাটাবেস তৈরি করুন:
```sql
CREATE DATABASE crypto_course;
USE crypto_course;
-- database.sql ফাইল ইম্পোর্ট করুন
```

### API কনফিগারেশন:
`api.php` ফাইলে আপডেট করুন:
```php
$host = 'localhost';
$dbname = 'crypto_course';
$username = 'your_username';
$password = 'your_password';
```

## 🎛️ Admin Panel Features

এডমিন প্যানেল থেকে কন্ট্রোল করুন:
- ✅ Hero Section (টাইটেল, ডেসক্রিপশন, বাটন, স্ট্যাটিস্টিক্স)
- ✅ Course Features (আইকন, টাইটেল, ডেসক্রিপশন)
- ✅ Pricing (মূল্য, ডিসকাউন্ট, ফিচার, পেমেন্ট মেথড)
- ✅ Testimonials (শিক্ষার্থীর মতামত)
- ✅ FAQ (সচরাচর প্রশ্ন)
- ✅ Contact Info (যোগাযোগের তথ্য)

**এডমিন প্যানেল এক্সেস:** `admin.html`

## 🚀 Deployment Options

### 1. Vercel (সুপারিশকৃত)
```bash
# গিটহাবে পুশ করুন
git add .
git commit -m "Initial commit"
git push origin main

# Vercel এ ডিপ্লয় করুন
# 1. vercel.com এ যান
# 2. গিটহাব রেপো কানেক্ট করুন
# 3. Deploy ক্লিক করুন
```

### 2. XAMPP (লোকাল)
```bash
# XAMPP ইনস্টল করুন
# ফাইলগুলো htdocs ফোল্ডারে রাখুন
# http://localhost/crypto-course-landing/
```

### 3. স্ট্যাটিক হোস্টিং
```bash
# শুধু index.html আপলোড করুন
# Netlify, GitHub Pages, বা যেকোনো স্ট্যাটিক হোস্টিং
```

## 🎨 Features

### ল্যান্ডিং পেজ:
- 📱 সম্পূর্ণ রেসপন্সিভ ডিজাইন
- 🎨 মডার্ন UI/UX
- 🌐 বাংলা ভাষা সাপোর্ট
- ⚡ ফাস্ট লোডিং
- 🔄 স্মুথ অ্যানিমেশন
- 📊 সোশ্যাল প্রুফ

### ডায়নামিক ভার্সন:
- 🗄️ ডাটাবেস ইন্টিগ্রেশন
- 🔄 রিয়েল-টাইম আপডেট
- 🛠️ এডমিন প্যানেল
- 🔌 REST API
- 💾 কন্টেন্ট ম্যানেজমেন্ট

## 🛠️ Technologies Used

- **Frontend:** HTML5, CSS3, Tailwind CSS, JavaScript
- **Backend:** PHP
- **Database:** MySQL
- **Deployment:** Vercel
- **Fonts:** Google Fonts (Hind Siliguri)

## 📝 Customization

### কন্টেন্ট পরিবর্তন:
1. **স্ট্যাটিক:** `index.html` ফাইল সরাসরি এডিট করুন
2. **ডায়নামিক:** `admin.html` থেকে কন্ট্রোল করুন

### ডিজাইন পরিবর্তন:
- **কালার:** Tailwind CSS ক্লাস পরিবর্তন করুন
- **ফন্ট:** Google Fonts লিংক আপডেট করুন
- **লেআউট:** HTML স্ট্রাকচার মডিফাই করুন

## 🔧 API Endpoints

```
GET  /api.php?endpoint=hero         # Hero section
GET  /api.php?endpoint=features    # Course features
GET  /api.php?endpoint=pricing     # Pricing info
GET  /api.php?endpoint=testimonials # Testimonials
GET  /api.php?endpoint=faq         # FAQ section
GET  /api.php?endpoint=contact     # Contact info

POST /api.php?endpoint=hero        # Update hero
POST /api.php?endpoint=features    # Add feature
POST /api.php?endpoint=pricing     # Update pricing
POST /api.php?endpoint=testimonials # Add testimonial
POST /api.php?endpoint=faq         # Add FAQ
POST /api.php?endpoint=contact     # Update contact
```

## 📱 Browser Support

- ✅ Chrome 60+
- ✅ Firefox 55+
- ✅ Safari 12+
- ✅ Edge 79+
- ✅ Mobile Browsers

## 🔒 Security Notes

- ডাটাবেস ক্রিডেনশিয়ালস সিকিউর রাখুন
- এডমিন প্যানেল পাসওয়ার্ড প্রোটেক্ট করুন
- নিয়মিত ব্যাকআপ নিন
- SSL সার্টিফিকেট ব্যবহার করুন

## 📞 Support

সাহায্য প্রয়োজনে:
- 📧 crypto@course.com
- 📱 +880 1234-567890

## 📄 License

MIT License - ফ্রি ব্যবহারের জন্য

---

**তৈরি করেছেন:** ক্রিপ্টো কোর্স টিম  
**সংস্করণ:** 1.0.0  
**আপডেট:** ২০২৪
