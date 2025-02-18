<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Seller</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        .chat-container {
            display: flex;
            width: 100%;
            height: 100%;
        }
        .chat-list {
            width: 30%;
            max-width: 300px;
            overflow-y: auto;
            border-right: 1px solid #ddd;
            background-color: #f8f9fa;
        }
        .chat-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .chat-list li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .chat-list li a {
            text-decoration: none;
            color: #000;
            display: block;
        }
        .chat-list li a:hover {
            background-color: #e9ecef;
        }
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .chat-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px; 
        }
        .messages {
            flex: 1;
            overflow-y: auto;
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #fff;
        }
        .message {
            margin-bottom: 10px;
        }
        .message .sender {
            font-weight: bold;
        }
        .img-kirim{
            height: 30px;
        }
        .img-fluid{
            opacity: 0.7;
            width: 70%;
        }
        .img-nav{
            width: 70px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navbar-dark bg-dark p-3">
    <div class="container">
        <a class="navbar-brand" href="http://localhost/fp/sllogin/dashboard"><img src="<?= base_url('asset/gshop.png');?>" class="img-nav" alt="gambar"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="http://localhost/fp/sllogin/tampil" class="nav-link">
                        <img src="<?= base_url('asset/profile.png'); ?>" alt="Profile" class="rounded-circle" style="height: 40px; width: 40px;">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5 pt-5">
    <h2>Edit Produk</h2>
    <form id="productForm" action="<?= site_url('sllogin/edit_produk/' . $product['product_id']) ?>" method="post">
        <div class="mb-3">
            <label for="product_name" class="form-label">Nama Produk</label>
            <input type="text" name="product_name" id="product_name" class="form-control" value="<?= $product['product_name'] ?>" required>
        </div>
        <div class="mb-3">
            <label for="product_desc" class="form-label">Deskripsi</label>
            <textarea name="product_desc" id="product_desc" class="form-control" rows="5" required><?= $product['product_desc'] ?></textarea>
        </div>
        <div class="mb-3">
            <label for="product_price" class="form-label">Harga</label>
            <input type="number" name="product_price" id="product_price" class="form-control" value="<?= $product['product_price'] ?>" required>
        </div>
        <div class="mb-3">
            <label for="product_stock" class="form-label">Stok</label>
            <input type="text" name="product_stock" id="product_stock" class="form-control" value="<?= $product['product_stock'] ?>">
        </div>
        <button type="button" id="saveButton" class="btn btn-dark">Simpan</button>
        <a href="<?= site_url('sllogin/dashboard') ?>" class="btn btn-secondary">Batal</a>
    </form>
</div>

<script>
    document.querySelector('#saveButton').addEventListener("click", function(event) {
        event.preventDefault();
        Swal.fire({
            title: "Simpan Perubahan?",
            text: "Pastikan semua data sudah benar.",
            icon: "question",
            showCancelButton: true,
            confirmButtonText: "Ya, Simpan!",
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.isConfirmed) {
                document.querySelector('#productForm').submit();
            }
        });
    });
</script>
</body>
</html>

