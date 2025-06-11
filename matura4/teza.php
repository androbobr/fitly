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


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['shrani_tezo'])) {
    $teza = $_POST['teza'];
    $datum = $_POST['datum']; 
    
    $stmt = $conn->prepare("INSERT INTO teza (user_id, teza, datum) VALUES (?, ?, ?)");
    $stmt->bind_param("ids", $user_id, $teza, $datum);
    $stmt->execute();
    header("Location: teza.php");
    exit();
}


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['ponastavi_graf'])) {
    $stmt = $conn->prepare("DELETE FROM teza WHERE user_id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    header("Location: teza.php");
    exit();
}


if ($_SERVER["REQUEST_METHOD"] == "DELETE" && isset($_DELETE['izbrisi_vajo'])){
    $stmt = $conn->preprare("
    DELETE FROM izvedene_vaje
    WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    header("Location: teza.php");
    exit();
}

$teza_podatki = [];
$stmt = $conn->prepare("SELECT teza, datum FROM teza WHERE user_id = ? ORDER BY datum ASC");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $teza_podatki[] = $row;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Beleženje teže</title>
    <link rel="stylesheet" href="StranCSS.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <img src="logo.png" alt="Fitnes Logo" class="logo">
    <style>
        body {
            background: url('slika7.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
        }
        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: inherit;
            filter: blur(5px);
            z-index: -1;
        }
        .teza-container {
            width: 420px;
            background: rgba(41, 46, 56, 0.95);
            padding: 25px;
            border-radius: 12px;
            color: white;
            text-align: center;
            position: relative;
            z-index: 1;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            margin-left: auto;
            margin-right: auto;
        }
        .teza-container h2 {
            font-size: 22px;
            margin-bottom: 15px;
        }
        form input {
            width: 100%;
            margin-bottom: 15px;
            padding: 3px;
            border-radius: 10px;
            border: none;
            background: #292E38;
            color: white;
            font-size: 16px;
            outline: none;
        }
        form button {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            background-color: #0D66F2;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        form button:hover {
            background-color: #4A0072;
        }
        .reset-button {
            margin-top: 10px;
            background-color: #FF4C4C;
        }
        .reset-button:hover {
            background-color: #D40000;
        }
        canvas {
            margin-top: 20px;
            width: 100%;
            max-width: 400px;
            height: 300px;
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
    <div class="teza-container">
        <h2>Beleženje telesne teže</h2>
        <form method="post">
            <label>Vnesi težo (kg):</label>
            <input type="number" name="teza">
            <label>Izberi datum:</label>
            <input type="date" name="datum" required>
            <button type="submit" name="shrani_tezo">Shrani težo</button>
        </form>
        
        <canvas id="tezaGraf"></canvas>
        
        <form method="post">
            <button type="submit" name="ponastavi_graf" class="reset-button">Ponastavi graf</button>
        </form>

        <a href="dashboard.php" class="back-btn">← Nazaj na nadzorno ploščo</a>

    </div>
    
    <script>
        var ctx = document.getElementById('tezaGraf').getContext('2d');
        var tezaData = <?php echo json_encode($teza_podatki); ?>;
        var labels = tezaData.map(item => item.datum);
        var values = tezaData.map(item => item.teza);
        
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Teža (kg)',
                    data: values,
                    borderColor: '#0D66F2',
                    backgroundColor: 'rgba(106, 13, 173, 0.2)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                scales: {
                    y: { beginAtZero: false }
                }
            }
        });
    </script>
</body>
</html>
