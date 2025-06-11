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


$stmt = $conn->prepare("SELECT uporabnisko_ime, e_posta, avatar FROM uporabniki WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Nadzorna plošča</title>
    <link rel="stylesheet" href="StranCSS.css">
    
    <style>
        body {
        background: url('slika5.jpg') no-repeat center center fixed;
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
        
        
        
        .dashboard-container {
        width: 500px;
        margin: auto;
        background: rgba(41, 46, 56, 0.95);
        padding: 25px;
        border-radius: 12px;
        color: white;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    
    .profile-info img {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        margin-bottom: 15px;
    }

    .profile-info p {
        margin: 5px 0;
        font-size: 16px;
    }

    .btn {
        width: 100%;
        max-width: 320px;
        padding: 12px;
        margin: 8px 0;
        border-radius: 10px;
        border: none;
        background-color: #0D66F2;
        color: white;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        font-size: 18px;
        transition: background 0.3s ease-in-out;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .btn:hover {
        background-color: #084AB5;
    }

    .btn i {
        font-size: 20px;
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
    <div class="dashboard-container">
    <img src="logo.png" alt="Fitnes Logo" class="logo">
   
    <h2>Nadzorna plošča</h2>
        
        <div class="profile-info">
            <img src="<?php echo $user['avatar']; ?>" alt="Profilna slika">
            <p><strong>Uporabniško ime:</strong> <?php echo $user['uporabnisko_ime']; ?></p>
            <p><strong>Email:</strong> <?php echo $user['e_posta']; ?></p>
        </div>

        <a href="belezi_vajo.php" class="btn">🔹 Beleži vajo</a>
        <a href="pregled_vaj.php" class="btn">📊 Pregled opravljenih vaj</a>
        <a href="profil.php" class="btn">⚙️ Uredi profil</a>
        <a href="teza.php" class="btn">⚖️ Sledenje teže</a>
        <a href="analitika_napredka.php" class="btn">📈Analitika napredka</a>
        <a href="logout.php" class="btn">🚪 Odjava</a>
    </div>
</body>
</html>
