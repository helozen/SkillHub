<?php
require_once '../config/database.php';
require_once '../models/Service.php';

$db = (new Database())->getConnection();
$service = new Service($db);

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($data->action == 'create') {
        $service->provider_id = $data->provider_id;
        $service->title = $data->title;
        $service->description = $data->description;
        $service->category = $data->category;
        $service->location = $data->location;
        $service->contact_info = $data->contact_info;

        if ($service->create()) {
            echo json_encode(["message" => "Service created successfully."]);
        } else {
            echo json_encode(["message" => "Failed to create service."]);
        }
    }
} elseif ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['category'])) {
        $stmt = $service->readByCategory($_GET['category']);
    } else {
        $stmt = $service->readAll();
    }

    $services = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $services[] = $row;
    }

    echo json_encode($services);
}
