<?php
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: login.php");
    exit();
}
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


$stmt = $conn->prepare("SELECT uporabnisko_ime, e_posta, avatar, ime, starost, visina, geslo FROM uporabniki WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_profile'])) {
    $ime = $_POST['ime'];
    $starost = (int) $_POST['starost'];
    $visina = (int) $_POST['visina'];

    if (!empty($ime) && $starost > 0 && $visina > 0) {
        $stmt = $conn->prepare("UPDATE uporabniki SET ime = ?, starost = ?, visina = ? WHERE id = ?");
        $stmt->bind_param("siii", $ime, $starost, $visina, $user_id);
        if ($stmt->execute()) {
            echo "<script>alert('Podatki uspešno posodobljeni!'); window.location.href='profil.php';</script>";
        } else {
            echo "<script>alert('Napaka pri posodabljanju podatkov!');</script>";
        }
    } else {
        echo "<script>alert('Vnesi pravilne podatke!');</script>";
    }
}


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_password'])) {
    $trenutno_geslo = $_POST['trenutno_geslo'];
    $novo_geslo = $_POST['novo_geslo'];

    if (password_verify($trenutno_geslo, $user['geslo'])) {
        $novo_geslo_hash = password_hash($novo_geslo, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("UPDATE uporabniki SET geslo = ? WHERE id = ?");
        $stmt->bind_param("si", $novo_geslo_hash, $user_id);
        if ($stmt->execute()) {
            echo "<script>alert('Geslo uspešno posodobljeno!'); window.location.href='profil.php';</script>";
        } else {
            echo "<script>alert('Napaka pri posodabljanju gesla!');</script>";
        }
    } else {
        echo "<script>alert('Trenutno geslo ni pravilno!');</script>";
    }
}


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['avatar']) && $_FILES['avatar']['error'] == 0) {
    $target_dir = "uploads/";
    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }
    $target_file = $target_dir . basename($_FILES["avatar"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];

    if (in_array($imageFileType, $allowed_types)) {
        if (move_uploaded_file($_FILES["avatar"]["tmp_name"], $target_file)) {
            $stmt = $conn->prepare("UPDATE uporabniki SET avatar = ? WHERE id = ?");
            $stmt->bind_param("si", $target_file, $user_id);
            $stmt->execute();
            header("Location: profil.php");
            exit();
        } else {
            echo "<script>alert('Napaka pri nalaganju slike.');</script>";
        }
    } else {
        echo "<script>alert('Dovoljeni so samo JPG, JPEG, PNG in GIF formati.');</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Profil uporabnika</title>
    <link rel="stylesheet" href="StranCSS.css">
    <style>
        body {
            background: url('slika.jpg') no-repeat center center fixed;
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
        .profile-container {
            width: 470px;
            margin: auto;
            background: rgba(41, 46, 56, 0.95);
            padding: 20px;
            border-radius: 12px;
            color: white;
            text-align: center;
        }
        input, button {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background: #292E38;
            color: white;
        }
        button {
            background-color: #0D66F2;
            cursor: pointer;
        }
        button:hover {
            background-color: #4A0072;
        }
        img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .logout-button {
    width: 100%;
    padding: 10px;
    background-color: #0D66F2;
    color: white;
    text-align: center;
    border-radius: 10px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    cursor: pointer;
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
    <div class="profile-container">
    <img src="logo.png" alt="Fitnes Logo" class="logo">
        <h2>Profil uporabnika</h2>
        <img src="<?php echo $user['avatar']; ?>" alt="Profilna slika">
        <p><strong>Uporabniško ime:</strong> <?php echo $user['uporabnisko_ime']; ?></p>
        <p><strong>Email:</strong> <?php echo $user['e_posta']; ?></p>

        <form method="post" enctype="multipart/form-data">
            <label>Spremeni avatar:</label>
            <input type="file" name="avatar">
            <button type="submit">Naloži sliko</button>
        </form>
        
        <form method="post">
            <label>Ime:</label>
            <input type="text" name="ime" value="<?php echo $user['ime']; ?>">
            <label>Starost:</label>
            <input type="number" name="starost" value="<?php echo $user['starost']; ?>">
            <label>Višina (cm):</label>
            <input type="number" name="visina" value="<?php echo $user['visina']; ?>">
            <button type="submit" name="update_profile">Posodobi podatke</button>
        </form>

        <form method="post">
            <label>Trenutno geslo:</label>
            <input type="password" name="trenutno_geslo" required>
            <label>Novo geslo:</label>
            <input type="password" name="novo_geslo" required>
            <button type="submit" name="update_password">Posodobi geslo</button>
        </form>

        <form method="get" action="profil.php">
            <button type="submit" name="logout" class="logout-button">Odjava</button>
        </form>

        <a href="dashboard.php" class="back-btn">← Nazaj na nadzorno ploščo</a>
    </div>
</body>
</html>
