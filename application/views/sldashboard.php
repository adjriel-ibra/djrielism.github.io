<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Seller</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<br><br>
<div class="container pt-5 mt-5">
    <h3>Selamat datang, <?= $seller_name ?></h3>
    <p>Selamat datang di dashboard seller!</p>

    <!-- Button Tambah Produk -->
    <div class="mb-4">
        <a href="<?= site_url('sllogin/tambah_produk') ?>" class="btn btn-dark">Tambah Produk</a>
    </div>

    <div class="row">
        <?php foreach ($products as $product): ?>
            <div class="col-md-3 my-4">
                <div class="card h-100 d-flex flex-column">
                    <img src="<?= base_url($product['product_img']); ?>" class="card-img-top" alt="">
                    <div class="card-body flex-grow-1">
                        <h5 class="card-title"><?= character_limiter($product['product_name'], 20) ?></h5>
                        <p class="card-title"><?= character_limiter($product['product_desc'], 30) ?></p>
                        <p class="card-text">Stock <?=($product['product_stock']) ?></p>
                        <p class="card-text">Rp<?= number_format($product['product_price'], 0, ',', '.') ?></p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="<?= site_url('sllogin/edit_produk/' . $product['product_id']) ?>" class="btn btn-dark btn-sm">Edit</a>
                        <button class="btn btn-danger btn-sm delete-button" data-url="<?= site_url('sllogin/hapus_produk/' . $product['product_id']) ?>">Delete</button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<script>
    document.querySelectorAll('.delete-button').forEach(button => {
        button.addEventListener('click', function() {
            const deleteUrl = this.dataset.url;
            Swal.fire({
                title: "Apakah Anda yakin?",
                text: "Produk yang dihapus tidak dapat dikembalikan!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Ya, Hapus!",
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = deleteUrl;
                }
            });
        });
    });
</script>

</body>
</html>
