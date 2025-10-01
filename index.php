<?php
require_once "Pasien.php";

$pasien = new Pasien();

// CREATE

$pasien->tambahPasien(7,"Kolam",10,"iosaois","2894782");

echo "<h3>Data Pasien</h3>";

echo "<table border='1' cellspacing='0' cellpadding='5'>";
echo "<tr>
        <th>ID Pasien</th>
        <th>Nama</th>
        <th>Umur</th>
        <th>Alamat</th>
        <th>Telepon</th>
      </tr>";

$data = $pasien->tampilPasien();
foreach ($data as $row) {
    echo "<tr>
            <td>{$row['id_pasien']}</td>
            <td>{$row['nama']}</td>
            <td>{$row['umur']}</td>
            <td>{$row['alamat']}</td>
            <td>{$row['telepon']}</td>
          </tr>";
}

echo "</table>";


$pasien->ubahPasien(1,"Po",19,"JL. Monaco","087827331");

$pasien->hapusPasien(1)


?>
