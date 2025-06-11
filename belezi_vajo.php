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

$iskanje = '';
$vaje = []; 

// ✅ ISKANJE VAJ - brez podvajanja
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['isci_vajo'])) {
    $iskanje = trim($_POST['iskanje']);
    $stmt = $conn->prepare("SELECT id, ime, slika, opis FROM vaje WHERE ime LIKE ? GROUP BY ime");
    $param = "%" . $iskanje . "%";
    $stmt->bind_param("s", $param);
    $stmt->execute();
    $result = $stmt->get_result();
    $vaje = $result->fetch_all(MYSQLI_ASSOC);
}

// ✅ BELEŽENJE VAJE V BAZO
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['vaja_ime'])) {
    $vaja_ime = $_POST['vaja_ime'];
    $seti = (int)$_POST['seti'];
    $ponovitve = (int)$_POST['ponovitve'];
    $kilaza = (float)$_POST['kilaza'];
    $user_id = $_SESSION['user_id'];

    // 📌 Pridobitev ID-ja vaje iz baze
    $stmt = $conn->prepare("SELECT id FROM vaje WHERE ime = ? LIMIT 1");
    $stmt->bind_param("s", $vaja_ime);
    $stmt->execute();
    $result = $stmt->get_result();
    $vaja = $result->fetch_assoc();

    if (!$vaja) {
        die("<script>alert('Napaka: Vaja ne obstaja v bazi!'); window.location.href='vaje.php';</script>");
    }

    $vaja_id = $vaja['id'];

    // 📌 Shrani podatke v tabelo izvedene_vaje
    $stmt = $conn->prepare("INSERT INTO izvedene_vaje (user_id, vaja_id, seti, ponovitve, kilaza, datum) VALUES (?, ?, ?, ?, ?, NOW())");
    $stmt->bind_param("iiidd", $user_id, $vaja_id, $seti, $ponovitve, $kilaza);

    if ($stmt->execute()) {
        echo "<script>alert('Vaja uspešno shranjena!'); window.location.href='belezi_vajo.php';</script>";

    } else {
        echo "<script>alert('Napaka pri shranjevanju vaje!');</script>";
    }
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Fitnes vaje</title>
    <link rel="stylesheet" href="StranCSS.css">
    <style>
        body {
            background: url('slika2.jpg?<?php echo time(); ?>') no-repeat center center fixed;
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
            width: 500px;
            margin: auto;
            background: rgba(41, 46, 56, 0.95);
            padding: 20px;
            border-radius: 12px;
            color: white;
            text-align: center;
        }
        form input {
            width: 90%;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background: #292E38;
            color: white;
        }
        form input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        form button {
            width: 90%;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background-color: #0D66F2;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        form button:hover {
            background-color: #084AB5;
        }
        img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
            margin-top: 10px;
        }
        .vaja {
            display: none;
        }
        .logo {
        position: absolute;
        top: 10px;
        left: 10px;
        width: 120px; /* Prilagodi velikost */
        height: auto;
        border-radius: 12px;
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



    </style>
</head>
<body>
    <div class="background-overlay"></div>
    <img src="slike/logo.png" alt="Fitnes Logo" class="logo">
    <div class="container">
    <img src="logo.png" alt="Fitnes Logo" class="logo">
    
        <h2>Fitnes vaje</h2>
        <form method="post">
            <input type="text" name="iskanje" placeholder="Išči vajo..." value="<?php echo htmlspecialchars($iskanje); ?>">
            <button type="submit" name="isci_vajo">Išči</button>
        </form>
        
        <?php if (!empty($vaje)): ?>
            <?php foreach ($vaje as $vaja): ?>
                <div class="vaja" style="display:block;">
                    <?php 
                        $slika_pot = "http://localhost/matura4/slike/" . strtolower(str_replace(' ', '_', $vaja['ime'])) . ".jpg";
                    ?>
                    <img src="<?php echo $slika_pot; ?>" alt="<?php echo htmlspecialchars($vaja['ime']); ?>"
                         onerror="this.onerror=null; this.src='http://localhost/matura4/slike/default.jpg';">
                    <p><strong><?php echo htmlspecialchars($vaja['ime']); ?></strong></p>
                    <p><?php echo htmlspecialchars($vaja['opis']); ?></p>
                    <form method="post" action="belezi_vajo.php">
                        <input type="hidden" name="vaja_ime" value="<?php echo htmlspecialchars($vaja['ime']); ?>">
                        <label>Seti:</label>
                        <input type="number" name="seti" required>
                        <label>Ponovitve:</label>
                        <input type="number" name="ponovitve" required>
                        <label>Kilaža:</label>
                        <input type="number" step="0.1" name="kilaza" required>
                        <button type="submit">Beleži vajo</button>
                    </form>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Vnesi ime vaje za prikaz rezultatov.</p>
            <a href="dashboard.php" class="back-btn">← Nazaj na nadzorno ploščo</a>
        <?php endif; ?>
    </div>
    
</body>
</html>
