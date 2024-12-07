<?php
class Service
{
    private $conn;
    private $table = "services";

    public $id;
    public $provider_id;
    public $title;
    public $description;
    public $category;
    public $location;
    public $contact_info;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    // Create a service
    public function create()
    {
        $query = "INSERT INTO " . $this->table . " (provider_id, title, description, category, location, contact_info) 
                  VALUES (:provider_id, :title, :description, :category, :location, :contact_info)";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":provider_id", $this->provider_id);
        $stmt->bindParam(":title", $this->title);
        $stmt->bindParam(":description", $this->description);
        $stmt->bindParam(":category", $this->category);
        $stmt->bindParam(":location", $this->location);
        $stmt->bindParam(":contact_info", $this->contact_info);

        return $stmt->execute();
    }

    // Fetch all services
    public function readAll()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Fetch services by category
    public function readByCategory($category)
    {
        $query = "SELECT * FROM " . $this->table . " WHERE category = :category";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":category", $category);
        $stmt->execute();
        return $stmt;
    }
}
