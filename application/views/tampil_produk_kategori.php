<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produk Kategori <?= urldecode($category); ?></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-card img {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body class="min-vh-100">
    <div class="container my-5">
        <h2 class="text-center mb-4">Produk Kategori: <?= urldecode($category) ?></h2>
    </div>
</body>