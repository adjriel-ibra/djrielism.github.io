<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Buyer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
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
<body class="min-vh-100">
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navbar-dark bg-dark p-3">
    <div class="container">
        <a class="navbar-brand" href="http://localhost/fp/home_control"><img src="<?= base_url('asset/gshop.png');?>" class="img-nav" alt="gambar"></a>
        <!-- Toggler for small screens -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarContent">
            
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
<div class="container mt-5 pt-5">
    <h1 class="mb-4">Profil Buyer</h1>
    
    <?php if ($this->session->flashdata('success')): ?>
        <div class="alert alert-success"><?= $this->session->flashdata('success'); ?></div>
    <?php endif; ?>

    <form action="<?= base_url('bylogin/update') ?>" method="post">
        <div class="mb-3">
            <label for="buyer_name" class="form-label">Nama</label>
            <input type="text" class="form-control" id="buyer_name" name="buyer_name" value="<?= $buyer->buyer_name ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<?= $buyer->email ?>" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" value="<?= $buyer->password ?>" required>
        </div>
        <div class="mb-3">
            <label for="buyer_address" class="form-label">Alamat</label>
            <input type="text" class="form-control" id="buyer_address" name="buyer_address" value="<?= $buyer->buyer_address ?>" required>
        </div>
        <div class="mb-3">
            <label for="buyer_number" class="form-label">Nomor Telepon</label>
            <input type="text" class="form-control" id="buyer_number" name="buyer_number" value="<?= $buyer->buyer_number ?>" required>
        </div>

        <div class="container px-4">
            <div class="row gx-5">
                <div class="col d-flex align-items-center justify-content-center">
                    <div class="border">
                        <button type="submit" class="btn btn-dark">Update Profil</button>
                    </div>
                </div>
                <div class="col d-flex align-items-center justify-content-center">
                    <div class="border">
                        <a href="<?= site_url('bylogin/logout') ?>" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Tampilkan Transaksi Buyer -->
    <div class="mt-5">
        <h3>Transaksi Saya</h3>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID Transaksi</th>
                        <th>Seller</th>
                        <th>Total Harga</th>
                        <th>Status</th>
                        <th>Tanggal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (!empty($transactions)): ?>
                        <?php foreach ($transactions as $trx): ?>
                            <tr>
                                <td><?= $trx->transaction_id ?></td>
                                <td><?= $trx->seller_name ?></td>
                                <td>Rp<?= number_format($trx->total_price, 0, ',', '.') ?></td>
                                <td><?= ucfirst($trx->status) ?></td>
                                <td><?= date('d M Y', strtotime($trx->created_at)) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5" class="text-center">Belum ada transaksi.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
    <br><br><br>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
