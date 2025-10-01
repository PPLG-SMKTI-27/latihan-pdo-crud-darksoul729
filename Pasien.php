<?php
require_once "Database.php";

class Pasien {
    private $pdo;

    public function __construct() {
        $db = new Database();
        $this->pdo = $db->getConnection();
    }

    // CREATE
    public function tambahPasien($id_pasien, $nama, $umur, $alamat, $telepon) {
        $sql = "INSERT INTO pasien (id_pasien, nama, umur, alamat, telepon) 
                VALUES (:id_pasien, :nama, :umur, :alamat, :telepon)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(":id_pasien", $id_pasien);
        $stmt->bindParam(":nama", $nama);
        $stmt->bindParam(":umur", $umur);
        $stmt->bindParam(":alamat", $alamat);
        $stmt->bindParam(":telepon", $telepon);

        return $stmt->execute();
    }

    // READ
    public function tampilPasien() {
        $sql = "SELECT * FROM pasien";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // UPDATE
    public function ubahPasien($id_pasien, $nama, $umur, $alamat, $telepon) {
        $sql = "UPDATE pasien 
                SET nama = :nama, umur = :umur, alamat = :alamat, telepon = :telepon 
                WHERE id_pasien = :id_pasien";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(":id_pasien", $id_pasien);
        $stmt->bindParam(":nama", $nama);
        $stmt->bindParam(":umur", $umur);
        $stmt->bindParam(":alamat", $alamat);
        $stmt->bindParam(":telepon", $telepon);

        return $stmt->execute();
    }

    // DELETE
    public function hapusPasien($id_pasien) {
        $sql = "DELETE FROM pasien WHERE id_pasien = :id_pasien";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(":id_pasien", $id_pasien);
        return $stmt->execute();
    }
}