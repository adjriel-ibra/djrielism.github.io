<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Produk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    
    <div class="container my-5 py-5">
        <h2>Tambah Produk Baru</h2>
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger"><?= $error ?></div>
        <?php endif; ?>
        <form id="productForm" action="<?= site_url('sllogin/tambah_produk') ?>" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="product_name" class="form-label">Nama Produk</label>
                <input type="text" name="product_name" id="product_name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="product_desc" class="form-label">Deskripsi</label>
                <textarea name="product_desc" id="product_desc" class="form-control" rows="5" required></textarea>
            </div>
            <div class="mb-3">
                <label for="product_price" class="form-label">Harga</label>
                <input type="number" name="product_price" id="product_price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="product_img" class="form-label">Gambar</label>
                <input type="file" name="product_img" id="product_img" class="form-control" required>
            </div>
            <div class="mb-3"> 
                <label for="product_category" class="form-label">Kategori</label>
                <select name="product_category" id="product_category" class="form-select" required>
                    <option value="" disabled selected>Pilih Kategori</option>
                    <option value="womens">Womens</option>
                    <option value="hobi">Hobi</option>
                    <option value="perawatan">Perawatan</option>
                    <option value="mans">Mans</option>
                    <option value="dekorasi">Dekorasi</option>
                    <option value="elektronik">Elektronik</option>
                    <option value="otomotif">Otomotif</option>
                    <option value="kesehatan">Kesehatan</option>
                </select>
            </div>
            <button type="submit" class="btn btn-dark">Tambah Produk</button>
            <a href="<?= site_url('sllogin/dashboard') ?>" class="btn btn-secondary">Batal</a>
        </form>
    </div>

    <script>
        document.getElementById('productForm').onsubmit = function(event) {
            event.preventDefault(); // Mencegah pengiriman form langsung
            
            Swal.fire({
                title: "Apakah Anda yakin?",
                text: "Produk akan ditambahkan!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya, Tambahkan!",
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Berhasil!",
                        text: "Produk telah ditambahkan.",
                        icon: "success",
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Kirim form setelah SweetAlert dikonfirmasi
                    setTimeout(() => {
                        document.getElementById('productForm').submit();
                    }, 2000); // Delay 2 detik agar alert terlihat
                }
            });
        };
    </script>
</body>
</html>
