<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$uri = $_SERVER['REQUEST_URI'];
$path = parse_url($uri, PHP_URL_PATH);

if ($path == '/users') {
    include_once '../controllers/UserController.php';
} elseif ($path == '/services') {
    include_once '../controllers/ServiceController.php';
} elseif ($path == '/bookings') {
    include_once '../controllers/BookingController.php';
}
