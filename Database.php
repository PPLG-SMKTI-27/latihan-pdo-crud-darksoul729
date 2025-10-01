<?php
class Database {
    private $host = "localhost";
    private $dbname = "klinik_kesehatan";
    private $username = "root";
    private $password = "";
    private $pdo;

    public function __construct() {
        try {
            $this->pdo = new PDO(
                "mysql:host=$this->host;dbname=$this->dbname",
                $this->username,
                $this->password
            );
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Koneksi berhasil!<br>";
        } catch (PDOException $e) {
            echo "Koneksi gagal: " . $e->getMessage();
        }
    }

    public function getConnection() {
        return $this->pdo;
    }
}
?>
