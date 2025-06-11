<?php
session_start();
$host = 'localhost';
$user = 'root';
$geslo = '';
$dbname = 'fitness_tracker';

$conn = new mysqli($host, $user, $geslo, $dbname);
if ($conn->connect_error) {
    die("Povezava neuspešna: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['prijava'])) {
    $uporabnisko_ime = $_POST['uporabnisko_ime'];
    $geslo = $_POST['geslo'];

    $stmt = $conn->prepare("SELECT id, geslo FROM uporabniki WHERE uporabnisko_ime = ?");
    $stmt->bind_param("s", $uporabnisko_ime);
    $stmt->execute();
    $stmt->store_result();
    
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $hashed_geslo);
        $stmt->fetch();
        
        if (password_verify($geslo, $hashed_geslo)) {
            $_SESSION['user_id'] = $id;
            $_SESSION['uporabnisko_ime'] = $uporabnisko_ime;
            header("Location: dashboard.php"); 
            exit();
        } else {
            echo "<script>alert('Napačno geslo!');</script>";
        }
    } else {
        echo "<script>alert('Uporabnik ne obstaja!');</script>";
    }
}


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['registracija'])) {
    $uporabnisko_ime = $_POST['uporabnisko_ime'];
    $geslo = password_hash($_POST['geslo'], PASSWORD_DEFAULT);
    $e_posta = $_POST['e_posta'];

    
    $stmt = $conn->prepare("SELECT id FROM uporabniki WHERE uporabnisko_ime = ? OR e_posta = ?");
    $stmt->bind_param("ss", $uporabnisko_ime, $e_posta);
    $stmt->execute();
    $stmt->store_result();
    
    if ($stmt->num_rows == 0) {
        $stmt = $conn->prepare("INSERT INTO uporabniki (uporabnisko_ime, geslo, e_posta) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $uporabnisko_ime, $geslo, $e_posta);
        
        if ($stmt->execute()) {
            echo "<script>alert('Registracija uspešna!'); window.location.href='login.php';</script>";
        } else {
            echo "<script>alert('Napaka pri registraciji!');</script>";
        }
    } else {
        echo "<script>alert('Uporabniško ime ali email že obstaja!');</script>";
    }
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Prijava / Registracija</title>
    <link rel="stylesheet" href="StranCSS.css">
    <img src="logo.png" alt="Fitnes Logo" class="logo">
    <style>
        body {
            background: url('slika.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            position: relative;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        /* Dodan blur ozadja */
        .background-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: inherit;
            filter: blur(5px); /* Blur efekt */
            z-index: -1;
        }

        .login-container {
            max-width: 400px;
            background: rgba(41, 46, 56, 0.9);
            padding: 20px;
            border-radius: 12px;
            color: white;
            text-align: center;
        }
        form input,
        form button {
            width: 100%;
            margin-bottom: 15px;
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
    
    <div class="login-container">
        <h2>Prijava</h2>
        <form method="post">
            <label>Uporabniško ime:</label>
            <input type="text" name="uporabnisko_ime" required>
            <label>Geslo:</label>
            <input type="password" name="geslo" required>
            <button type="submit" name="prijava">Prijava</button>
        </form>

        <h2>Registracija</h2>
        <form method="post">
            <label>Uporabniško ime:</label>
            <input type="text" name="uporabnisko_ime" required>
            <label>Email:</label>
            <input type="email" name="e_posta" required>
            <label>Geslo:</label>
            <input type="password" name="geslo" required>
            <button type="submit" name="registracija">Registracija</button>
        </form>
    </div>
</body>
</html>
