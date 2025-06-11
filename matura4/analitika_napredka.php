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
$vaja_filter = isset($_GET['vaja']) ? $_GET['vaja'] : '';

$query = "SELECT vaje.ime, izvedene_vaje.seti, izvedene_vaje.ponovitve, izvedene_vaje.kilaza, izvedene_vaje.datum 
          FROM izvedene_vaje 
          JOIN vaje ON izvedene_vaje.vaja_id = vaje.id 
          WHERE izvedene_vaje.user_id = ?";

if (!empty($vaja_filter)) {
    $query .= " AND vaje.ime = ?";
}

$query .= " ORDER BY izvedene_vaje.datum ASC";
$stmt = $conn->prepare($query);

if (!empty($vaja_filter)) {
    $stmt->bind_param("is", $user_id, $vaja_filter);
} else {
    $stmt->bind_param("i", $user_id);
}

$stmt->execute();
$result = $stmt->get_result();
$vaje = $result->fetch_all(MYSQLI_ASSOC);
$stmt->close();

// Izračun povprečij
$povprecni_seti = $povprecne_ponovitve = $povprecna_kilaza = 0;
$total_entries = count($vaje);
if ($total_entries > 0) {
    foreach ($vaje as $vaja) {
        $povprecni_seti += $vaja['seti'];
        $povprecne_ponovitve += $vaja['ponovitve'];
        $povprecna_kilaza += $vaja['kilaza'];
    }
    $povprecni_seti /= $total_entries;
    $povprecne_ponovitve /= $total_entries;
    $povprecna_kilaza /= $total_entries;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Analitika napredka</title>
    <link rel="stylesheet" href="StranCSS.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        .chart-container {
            width: 100%;
            height: 300px;
            margin-top: 20px;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #0D66F2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
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
    <img src="logo.png" alt="Fitnes Logo" class="logo">
    <div class="background-overlay"></div>
    <div class="container">
        <h2>Analitika napredka</h2>
        <p>Povprečni seti: <?php echo round($povprecni_seti, 1); ?></p>
        <p>Povprečne ponovitve: <?php echo round($povprecne_ponovitve, 1); ?></p>
        <p>Povprečna kilaža: <?php echo round($povprecna_kilaza, 1); ?> kg</p>

        <div class="chart-container">
            <canvas id="progressChart"></canvas>
        </div>

        <a href="dashboard.php" class="back-btn">← Nazaj na nadzorno ploščo</a>
    </div>

    <script>
        const ctx = document.getElementById('progressChart').getContext('2d');
        const chartData = {
            labels: [<?php foreach ($vaje as $vaja) { echo "'" . $vaja['datum'] . "',"; } ?>],
            datasets: [{
                label: 'Kilaža (kg)',
                data: [<?php foreach ($vaje as $vaja) { echo $vaja['kilaza'] . ","; } ?>],
                backgroundColor: 'rgba(13, 102, 242, 0.5)',
                borderColor: '#0D66F2',
                borderWidth: 2
            }]
        };

        new Chart(ctx, {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
