<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-card img {
            height: 200px;
            object-fit: cover;
        }
    </style> 
<div class="container min-vh-100">
    <h2>Produk</h2>
    <div class="container my-5">
    <?php if (isset($query) && $query): ?>
        <h3 class="mb-4">Hasil Pencarian untuk: "<?= $query ?>"</h3>
    <?php endif; ?>

    <!-- Grid Produk -->
    <div class="row g-4">
        <?php if (!empty($products)): ?>
            <?php foreach ($products as $product): ?>
                <div class="col-md-3">
                    <div class="card h-100">
                        <img src="<?= base_url($product['product_img']); ?>" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><?= character_limiter($product['product_name'],20) ?></h5>
                            <p class="card-title"><?= character_limiter($product['product_desc'],30) ?></p>
                            <p class="card-text">Rp<?= number_format($product['product_price'], 0, ',', '.') ?></p>
                        </div>
                        <div class="card_footer m-3">
                        <a href="<?= site_url('home_control/detail/' . $product['product_id']) ?>" class="btn btn-dark">Detail</a>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p class="text-center">Tidak ada produk ditemukan.</p>
        <?php endif; ?>
    </div>
</div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
