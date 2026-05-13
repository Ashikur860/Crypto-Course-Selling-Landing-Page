<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Database connection
$host = 'localhost';
$dbname = 'crypto_course';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

// Get request method and endpoint
$method = $_SERVER['REQUEST_METHOD'];
$endpoint = $_GET['endpoint'] ?? '';

switch($endpoint) {
    case 'hero':
        handleHero($pdo, $method);
        break;
    case 'features':
        handleFeatures($pdo, $method);
        break;
    case 'pricing':
        handlePricing($pdo, $method);
        break;
    case 'testimonials':
        handleTestimonials($pdo, $method);
        break;
    case 'faq':
        handleFAQ($pdo, $method);
        break;
    case 'contact':
        handleContact($pdo, $method);
        break;
    default:
        http_response_code(404);
        echo json_encode(['error' => 'Endpoint not found']);
}

function handleHero($pdo, $method) {
    if ($method === 'GET') {
        $stmt = $pdo->query("SELECT * FROM hero_content ORDER BY id DESC LIMIT 1");
        $hero = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($hero);
    } elseif ($method === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $stmt = $pdo->prepare("UPDATE hero_content SET title_bn=?, subtitle_bn=?, description_bn=?, buy_button_text=?, demo_button_text=?, students_count=?, rating=?, satisfaction_rate=? WHERE id=1");
        $stmt->execute([
            $data['title_bn'],
            $data['subtitle_bn'],
            $data['description_bn'],
            $data['buy_button_text'],
            $data['demo_button_text'],
            $data['students_count'],
            $data['rating'],
            $data['satisfaction_rate']
        ]);
        echo json_encode(['success' => true]);
    }
}

function handleFeatures($pdo, $method) {
    if ($method === 'GET') {
        $stmt = $pdo->query("SELECT * FROM course_features WHERE is_active=1 ORDER BY display_order");
        $features = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($features);
    } elseif ($method === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $stmt = $pdo->prepare("INSERT INTO course_features (icon, title_bn, description_bn, display_order) VALUES (?, ?, ?, ?)");
        $stmt->execute([$data['icon'], $data['title_bn'], $data['description_bn'], $data['display_order']]);
        echo json_encode(['success' => true]);
    }
}

function handlePricing($pdo, $method) {
    if ($method === 'GET') {
        $stmt = $pdo->query("SELECT * FROM pricing WHERE is_active=1 ORDER BY id DESC LIMIT 1");
        $pricing = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($pricing) {
            $pricing['features'] = explode(',', $pricing['features']);
            $pricing['payment_methods'] = explode(',', $pricing['payment_methods']);
        }
        echo json_encode($pricing);
    } elseif ($method === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $stmt = $pdo->prepare("UPDATE pricing SET course_name=?, current_price=?, original_price=?, discount_percentage=?, features=?, payment_methods=? WHERE id=1");
        $stmt->execute([
            $data['course_name'],
            $data['current_price'],
            $data['original_price'],
            $data['discount_percentage'],
            implode(',', $data['features']),
            implode(',', $data['payment_methods'])
        ]);
        echo json_encode(['success' => true]);
    }
}

function handleTestimonials($pdo, $method) {
    if ($method === 'GET') {
        $stmt = $pdo->query("SELECT * FROM testimonials WHERE is_active=1 ORDER BY display_order");
        $testimonials = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($testimonials);
    } elseif ($method === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $stmt = $pdo->prepare("INSERT INTO testimonials (student_name, student_location, testimonial_text, initial, display_order) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([
            $data['student_name'],
            $data['student_location'],
            $data['testimonial_text'],
            $data['initial'],
            $data['display_order']
        ]);
        echo json_encode(['success' => true]);
    }
}

function handleFAQ($pdo, $method) {
    if ($method === 'GET') {
        $stmt = $pdo->query("SELECT * FROM faq WHERE is_active=1 ORDER BY display_order");
        $faq = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($faq);
    } elseif ($method === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $stmt = $pdo->prepare("INSERT INTO faq (question_bn, answer_bn, display_order) VALUES (?, ?, ?)");
        $stmt->execute([$data['question_bn'], $data['answer_bn'], $data['display_order']]);
        echo json_encode(['success' => true]);
    }
}

function handleContact($pdo, $method) {
    if ($method === 'GET') {
        $stmt = $pdo->query("SELECT * FROM contact_info ORDER BY id DESC LIMIT 1");
        $contact = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($contact);
    } elseif ($method === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $stmt = $pdo->prepare("UPDATE contact_info SET email=?, phone=?, address_bn=?, facebook_url=?, twitter_url=?, youtube_url=?, linkedin_url=? WHERE id=1");
        $stmt->execute([
            $data['email'],
            $data['phone'],
            $data['address_bn'],
            $data['facebook_url'] ?? null,
            $data['twitter_url'] ?? null,
            $data['youtube_url'] ?? null,
            $data['linkedin_url'] ?? null
        ]);
        echo json_encode(['success' => true]);
    }
}
?>
