<?php
require_once '../config/database.php';
require_once '../models/Booking.php';

$db = (new Database())->getConnection();
$booking = new Booking($db);

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($data->action == 'create') {
        $booking->customer_id = $data->customer_id;
        $booking->service_id = $data->service_id;
        $booking->booking_date = $data->booking_date;
        $booking->status = 'pending';

        if ($booking->create()) {
            echo json_encode(["message" => "Booking created successfully."]);
        } else {
            echo json_encode(["message" => "Failed to create booking."]);
        }
    }
} elseif ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['customer_id'])) {
        $stmt = $booking->readByCustomer($_GET['customer_id']);
        $bookings = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $bookings[] = $row;
        }
        echo json_encode($bookings);
    }
}
