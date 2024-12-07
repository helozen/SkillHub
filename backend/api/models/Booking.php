<?php
class Booking
{
    private $conn;
    private $table = "bookings";

    public $id;
    public $customer_id;
    public $service_id;
    public $booking_date;
    public $status;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    // Create a booking
    public function create()
    {
        $query = "INSERT INTO " . $this->table . " (customer_id, service_id, booking_date, status) 
                  VALUES (:customer_id, :service_id, :booking_date, :status)";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":customer_id", $this->customer_id);
        $stmt->bindParam(":service_id", $this->service_id);
        $stmt->bindParam(":booking_date", $this->booking_date);
        $stmt->bindParam(":status", $this->status);

        return $stmt->execute();
    }

    // Fetch bookings by customer ID
    public function readByCustomer($customer_id)
    {
        $query = "SELECT * FROM " . $this->table . " WHERE customer_id = :customer_id";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":customer_id", $customer_id);
        $stmt->execute();
        return $stmt;
    }
}
