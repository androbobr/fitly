<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$host = 'localhost';
$user = 'root';
$geslo = '';
$dbname = 'fitness_tracker';

$conn = new mysqli($host, $user, $geslo, $dbname);
if ($conn->connect_error) {
    die("Povezava neuspešna: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

$user_id = $_SESSION['user_id'];
$query = "SELECT vaje.ime, izvedene_vaje.seti, izvedene_vaje.ponovitve, izvedene_vaje.kilaza, izvedene_vaje.datum, izvedene_vaje.id FROM izvedene_vaje JOIN vaje ON izvedene_vaje.vaja_id = vaje.id WHERE izvedene_vaje.user_id = ? ORDER BY izvedene_vaje.datum DESC";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$vaje = $result->fetch_all(MYSQLI_ASSOC);
$stmt->close();


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['izbrisi_vajo'])) {
    $id = (int)$_POST['izbrisi_vajo'];

    $stmt = $conn->prepare("DELETE FROM izvedene_vaje WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    
    // Preusmeri nazaj
    header("Location: pregled_vaj.php");
    exit();
}


?>
<!DOCTYPE html>
<html>
<head>
    <title>Pregled opravljenih vaj</title>
    <link rel="stylesheet" href="StranCSS.css">
    <style>
        body {
            background: url('slika2.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .background-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: inherit;
            filter: blur(8px);
            z-index: -1;
        }
        .container {
            width: 600px;
            margin: auto;
            background: rgba(41, 46, 56, 0.95);
            padding: 20px;
            border-radius: 12px;
            color: white;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background: #0D66F2;
            color: white;
        }
        tr:hover {
        background-color: rgba(100, 100, 150, 0.3) !important;
        }
        .delete-btn {
            width: 100px;
            background-color: red;
            border: none;
            padding: 8px 12px;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;
            font-size: 14px;
        }
        .delete-btn:hover {
            background-color: darkred;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #0D66F2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
        }
        .back-btn:hover {
            background-color: #084AB5;
        }
        .logo {
        position: absolute;
        top: 10px;
        left: 10px;
        width: 120px;
        height: auto;
	    border-radius: 12px;
        }
    </style>
</head>
<body>
    <div class="background-overlay"></div>
    <div class="container">
    <img src="logo.png" alt="Fitnes Logo" class="logo">
        <h2>Pregled opravljenih vaj</h2>
        <table>
            <tr>
                <th>VAJA</th>
                <th>SETI</th>
                <th>PONOVITVE</th>
                <th>KILAŽA</th>
                <th>DATUM</th>
                <th>AKCIJA</th>
            </tr>
            <?php foreach ($vaje as $vaja): ?>
                <tr>
                    <td><?php echo htmlspecialchars($vaja['ime']); ?></td>
                    <td><?php echo $vaja['seti']; ?></td>
                    <td><?php echo $vaja['ponovitve']; ?></td>
                    <td><?php echo number_format($vaja['kilaza'], 2); ?> kg</td>
                    <td><?php echo $vaja['datum']; ?></td>
                    <td>
                        <form method="post" action="pregled_vaj.php" style="display:inline;
                            <input type="hidden" name="izbrisi_vajo" value="<?php echo $vaja['id']; ?>">
                            <button type="submit" class="delete-btn">x</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
        <a href="dashboard.php" class="back-btn">← Nazaj na nadzorno ploščo</a>
    </div>
</body>
</html>
