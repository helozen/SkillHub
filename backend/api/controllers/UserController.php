<?php
require_once '../config/database.php';
require_once '../models/User.php';

$db = (new Database())->getConnection();
$user = new User($db);

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($data->action == 'register') {
        $user->name = $data->name;
        $user->email = $data->email;
        $user->password = $data->password;
        $user->role = $data->role;

        if ($user->register()) {
            echo json_encode(["message" => "User registered successfully."]);
        } else {
            echo json_encode(["message" => "Unable to register user."]);
        }
    } elseif ($data->action == 'login') {
        $user->email = $data->email;
        $user->password = $data->password;

        if ($user->login()) {
            echo json_encode(["message" => "Login successful.", "user" => ["id" => $user->id, "name" => $user->name, "role" => $user->role]]);
        } else {
            echo json_encode(["message" => "Invalid email or password."]);
        }
    }
}
