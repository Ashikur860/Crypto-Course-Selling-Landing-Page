-- Database Schema for Crypto Course Landing Page

CREATE DATABASE IF NOT EXISTS crypto_course;
USE crypto_course;

-- Hero Section Content
CREATE TABLE hero_content (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title_bn VARCHAR(255) NOT NULL,
    subtitle_bn TEXT NOT NULL,
    description_bn TEXT NOT NULL,
    buy_button_text VARCHAR(100) NOT NULL,
    demo_button_text VARCHAR(100) NOT NULL,
    students_count INT NOT NULL DEFAULT 5000,
    rating DECIMAL(2,1) NOT NULL DEFAULT 4.8,
    satisfaction_rate INT NOT NULL DEFAULT 98,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Course Features
CREATE TABLE course_features (
    id INT PRIMARY KEY AUTO_INCREMENT,
    icon VARCHAR(50) NOT NULL,
    title_bn VARCHAR(255) NOT NULL,
    description_bn TEXT NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Pricing Information
CREATE TABLE pricing (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    current_price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2) NOT NULL,
    discount_percentage INT NOT NULL DEFAULT 50,
    currency VARCHAR(3) NOT NULL DEFAULT 'BDT',
    features TEXT NOT NULL,
    payment_methods TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Testimonials
CREATE TABLE testimonials (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    student_location VARCHAR(255) NOT NULL,
    rating INT NOT NULL DEFAULT 5,
    testimonial_text TEXT NOT NULL,
    initial CHAR(1) NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- FAQ Section
CREATE TABLE faq (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_bn VARCHAR(255) NOT NULL,
    answer_bn TEXT NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contact Information
CREATE TABLE contact_info (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address_bn TEXT NOT NULL,
    facebook_url VARCHAR(255),
    twitter_url VARCHAR(255),
    youtube_url VARCHAR(255),
    linkedin_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert Default Data
INSERT INTO hero_content (title_bn, subtitle_bn, description_bn, buy_button_text, demo_button_text) VALUES 
('বাংলায় শিখুন<br><span class=\"text-yellow-300\">ক্রিপ্টোকারেন্সি</span>', 'ক্রিপ্টোকারেন্সির জগতে আপনার প্রথম পদক্ষেপ। শূন্য থেকে শুরু করে এক্সপার্ট হয়ে উঠুন আমাদের বিস্তারিত বাংলা কোর্সে।', '🎯 কোর্সটি কিনুন - ৳২৯৯৯', '📹 ফ্রি ডেমো দেখুন');

INSERT INTO course_features (icon, title_bn, description_bn, display_order) VALUES 
('📚', 'বেসিক থেকে এডভান্সড', 'শূন্য থেকে শুরু করে এক্সপার্ট লেভেলের ক্রিপ্টো জ্ঞান। ব্লকচেইন, মাইনিং, ট্রেডিং সবকিছু।', 1),
('🎥', '৫০+ ভিডিও লেসন', 'বাংলায় তৈরি উচ্চমানের ভিডিও টিউটোরিয়াল। যেকোনো সময় দেখতে পারবেন, যতবার খুশি।', 2),
('💬', 'সাপোর্ট গ্রুপ', 'এক্সক্লুসিভ ফেসবুক গ্রুপে ২৪/৭ সাপোর্ট। প্রশ্ন করুন, শিখুন, অন্যদের সাহায্য করুন।', 3),
('📱', 'মোবাইল অ্যাপ', 'যেকোনো সময় যেকোনো জায়গা থেকে কোর্স করুন। অ্যান্ড্রয়েড ও iOS অ্যাপ উপলব্ধ।', 4),
('📜', 'সার্টিফিকেট', 'কোর্স সম্পন্ন করলে অফিসিয়াল সার্টিফিকেট। আপনার অর্জনের প্রমাণ।', 5),
('🔄', 'লাইফটাইম আপডেট', 'ক্রিপ্টো মার্কেট পরিবর্তনের সাথে কোর্স ম্যাটেরিয়াল আপডেট। কোনো এক্সট্রা চার্জ নেই।', 6);

INSERT INTO pricing (course_name, current_price, original_price, discount_percentage, features, payment_methods) VALUES 
('ক্রিপ্টো মাস্টারি কোর্স', 2999.00, 5999.00, 50, 'সম্পূর্ণ কোর্স অ্যাক্সেস,লাইফটাইম ভিডিও আপডেট,সাপোর্ট গ্রুপে অ্যাক্সেস,অফিসিয়াল সার্টিফিকেট,মোবাইল অ্যাপ অ্যাক্সেস', 'বিকাশ, রকেট, নগদ, কার্ড');

INSERT INTO testimonials (student_name, student_location, testimonial_text, initial, display_order) VALUES 
('রহিম উদ্দিন', 'ঢাকা', '"অসাধারণ কোর্স! বাংলায় এত সুন্দরভাবে ক্রিপ্টো বুঝানো হয়েছে, জীবনেও ভাবিনি।"', 'র', 1),
('সামিয়া আক্তার', 'চট্টগ্রাম', '"কোর্সটি করার পর আমি নিয়মিত ট্রেডিং করে ভালো ইনকাম করছি। সাপোর্ট অসাধারণ।"', 'স', 2),
('কামাল হোসেন', 'রাজশাহী', '"প্রফেশনাল লেভেলের কন্টেন্ট। যেকোনো নতুন শিক্ষার্থীর জন্য সেরা চয়েস।"', 'ক', 3);

INSERT INTO faq (question_bn, answer_bn, display_order) VALUES 
('কোর্সটি করতে কত সময় লাগবে?', 'সম্পূর্ণ কোর্সটি করতে সাধারণত ২-৩ মাস সময় লাগে। তবে আপনি নিজের সুবিধামতো সময় নিতে পারেন।', 1),
('আমি কি কোনো পূর্ব জ্ঞান ছাড়া কোর্সটি করতে পারব?', 'হ্যাঁ! কোর্সটি সম্পূর্ণ নতুনদের জন্য তৈরি। আপনার কোনো পূর্ব জ্ঞান লাগবে না।', 2),
('কোর্সটি কিনলে কতদিন অ্যাক্সেস পাব?', 'একবার কিনলে আজীবন অ্যাক্সেস পাবেন। কোনো মাসিক বা বার্ষিক ফি নেই।', 3),
('কিভাবে পেমেন্ট করতে পারব?', 'বিকাশ, রকেট, নগদ, ক্রেডিট/ডেবিট কার্ড - সব ধরনের পেমেন্ট মেথড উপলব্ধ।', 4),
('কোর্সটি কি আপডেট থাকে?', 'হ্যাঁ, ক্রিপ্টো মার্কেটের সাথে কোর্স ম্যাটেরিয়াল নিয়মিত আপডেট করা হয়।', 5);

INSERT INTO contact_info (email, phone, address_bn) VALUES 
('crypto@course.com', '+880 1234-567890', 'ঢাকা, বাংলাদেশ');
