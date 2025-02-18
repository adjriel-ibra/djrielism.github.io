<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>G-Shop</title>
    <style>
    .img-nav{
        width: 70px;
    }
    </style>
</head>
<body class="flex-grow-1 min-vh-100">
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navbar-dark bg-dark p-3">
    <div class="container">
        <a class="navbar-brand" href="http://localhost/fp/home_control"><img src="<?= base_url('asset/gshop.png');?>" class="img-nav" alt="gambar"></a>
        <!-- Toggler for small screens -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarContent">
            <!-- Form Pencarian -->
            <form class="d-flex position-absolute top-50 start-50 translate-middle" role="search" style="width: 30%;" action="<?= site_url('home_control/search') ?>" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Cari" aria-label="Search" required>
                <button class="btn btn-outline-light" type="submit">Cari</button>
            </form>
            
            <!-- Profile Image -->
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="http://localhost/fp/bylogin/tampil" class="nav-link">
                        <img src="<?= base_url('asset/profile.png'); ?>" alt="Profile" class="rounded-circle" style="height: 40px; width: 40px;">
                    </a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost/fp/cart/" class="nav-link">
                        <img src="<?= base_url('asset/cart.png'); ?>" alt="cart" class="mx-2" style="height: 40px; width: 40px;">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

    <br><br>
