<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Keranjang Belanja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .img-nav {
            width: 70px;
        }
        .product-card {
            margin-bottom: 20px;
        }
        .product-img {
            max-width: 100px;
            max-height: 100px;
        }
        .checkout-btn {
            margin-top: 20px;
        }
        .total-price {
            font-weight: bold;
        }
        .product-actions {
            display: flex;
            gap: 10px;
            justify-content: flex-start;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navbar-dark bg-dark p-3">
    <div class="container">
        <a class="navbar-brand" href="<?= site_url('home_control'); ?>">
            <img src="<?= base_url('asset/gshop.png'); ?>" class="img-nav" alt="gambar">
        </a>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="<?= site_url('bylogin/tampil'); ?>" class="nav-link">
                        <img src="<?= base_url('asset/profile.png'); ?>" alt="Profile" class="rounded-circle" style="height: 40px; width: 40px;">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br><br><br>

<div class="container mt-5">
    <h2>Keranjang Belanja</h2>
    
    <?php if (!empty($cart_items)): ?>
        <?php 
        // Menyusun array yang dikelompokkan berdasarkan store_name
        $cart_grouped = [];
        foreach ($cart_items as $item) {
            $cart_grouped[$item['store_name']][] = $item; // Mengelompokkan produk berdasarkan seller
        }

        // Menampilkan produk per seller
        foreach ($cart_grouped as $store_name => $items): ?>
            <div class="product-card">
                <h3 class="mt-4">Toko: <?= $store_name ?></h3>
                <div class="card p-3">
                    <?php $total_per_seller = 0; ?>
                    <?php foreach ($items as $item): ?>
                        <div class="row align-items-center mb-3">
                            <div class="col-4 col-sm-3 col-md-2">
                                <img src="<?= base_url($item['product_img']); ?>" class="img-fluid product-img" alt="">
                            </div>
                            <div class="col-8 col-sm-6 col-md-8">
                                <h5><?= $item['product_name'] ?></h5>
                                <p>Rp<?= number_format($item['product_price'], 0, ',', '.') ?></p>
                                <form action="<?= site_url('cart/update') ?>" method="POST">
                                    <input type="hidden" name="cart_item_id" value="<?= $item['cart_item_id'] ?>">
                                    <input type="number" name="quantity" value="<?= $item['quantity'] ?>" min="1" class="form-control mb-2">
                                    <div class="product-actions">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                        <a href="<?= site_url('cart/remove/' . $item['cart_item_id']) ?>" class="btn btn-danger">Hapus</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <?php 
                        // Menghitung total harga per seller
                        $total_per_seller += $item['product_price'] * $item['quantity']; 
                        ?>
                    <?php endforeach; ?>
                    
                    <!-- Menampilkan tombol checkout per seller -->
                    <div class="d-flex justify-content-between">
                        <h4 class="total-price">Total: Rp<?= number_format($total_per_seller, 0, ',', '.') ?></h4>
                        <a href="<?= site_url('cart/checkout/' . urlencode($store_name)) ?>" class="btn btn-dark checkout-btn">Checkout Produk</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>

    <?php else: ?>
        <p>Keranjang Anda kosong.</p>
    <?php endif; ?>
<br><br><br>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
