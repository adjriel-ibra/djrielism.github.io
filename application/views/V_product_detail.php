<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Produk: <?= $products['product_name'] ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .product-header {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .product-image {
            height: 150px;
            width: 150px;
            object-fit: cover;
        }
        .product-actions {
            text-align: right;
        }
        .card-body {
            position: relative;
        }
        .btn-dark {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }
    </style>
</head>
<body class="min-vh-100">
    <div class="container my-5 min-vh-100">
        <div class="card p-4">
            <div class="product-header">
                <img src="<?= base_url($products['product_img']); ?>" class="product-image" alt="">
                <div>
                    <h2 class="card-title"><?= character_limiter($products['product_name'], 50) ?></h2>
                    <p class="card-text"><strong>Rp<?= number_format($products['product_price'], 0, ',', '.') ?></strong></p>
                </div>
            </div>
            <div class="card-body">
                <p class="card-text pb-5 mb-4"><?= $products['product_desc'] ?></p>
                <!-- Form untuk menambah produk ke keranjang -->
                <form action="<?= site_url('cart/add') ?>" method="POST">
                    <input type="hidden" name="product_id" value="<?= $products['product_id'] ?>">
                    <input type="hidden" name="product_price" value="<?= $products['product_price'] ?>">
                    <button type="submit" class="btn btn-dark mt-5">Tambah ke Keranjang</button>
                </form>
            </div>
        </div>
        <h2 class="m-4">Lainnya dari <?= $store ?></h2>
        <div class="row">
            <?php foreach ($names as $name): ?>
            <div class="col-md-3 mt-2">
                <div class="card h-100 d-flex flex-column">
                    <img src="<?= base_url($name['product_img']); ?>" class="card-img-top" alt="">
                    <div class="card-body flex-grow-1">
                        <h5 class="card-title"><?= character_limiter($name['product_name'], 20) ?></h5>
                        <p class="card-title"><?= character_limiter($name['product_desc'], 30) ?></p>
                        <p class="card-text">Rp<?= number_format($name['product_price'], 0, ',', '.') ?></p>
                    </div>  
                    <div class="card_footer m-3">
                        <a href="<?= site_url('home_control/detail/' . $name['product_id']) ?>" class="btn btn-dark">Detail</a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>

    <script>
        // Cek apakah ada session flashdata 'message' yang menunjukkan produk berhasil ditambahkan
        <?php if ($this->session->flashdata('message')): ?>
            // Menampilkan SweetAlert
            Swal.fire({
                title: 'Produk Ditambahkan!',
                text: 'Produk berhasil ditambahkan ke keranjang.',
                icon: 'success',
                confirmButtonText: 'Tutup'
            });
        <?php endif; ?>
    </script>
</body>
</html>
