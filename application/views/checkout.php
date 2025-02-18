<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Konfirmasi Pembelian</title>
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
<br><br><br>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    
    <div class="container mt-5">
        <h2>Konfirmasi Pembelian</h2>
        
        <h4>Produk dari Seller: <?= isset($store_name) ? $store_name : 'Tidak Diketahui'; ?></h4>
        <p>Alamat Toko: <?= $seller_data['store_address']; ?></p>
        <p>Pembayaran: <?= $seller_data['bank_num']; ?> (<?= $seller_data['bank_type']; ?>)</p>
        
        <h5>Alamat Pembeli:</h5>
        <p>Nama Pembeli: <?= $buyer_data['buyer_name']; ?></p>
        <p>Alamat Pembeli: <?= $buyer_data['buyer_address']; ?></p>
        <p>Nomor Telepon: <?= $buyer_data['buyer_number']; ?></p>
        <br>
    <h5>Detail Pembelian:</h5>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Nama Produk</th>
                <th>Harga</th>
                <th>Jumlah</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <?php $total = 0; ?>
            <?php foreach ($items as $item): ?>
                <tr>
                    <td><?= $item['product_name'] ?></td>
                    <td><?= number_format($item['product_price'], 0, ',', '.') ?></td>
                    <td><?= $item['quantity'] ?></td>
                    <td><?= number_format($item['total_price'], 0, ',', '.') ?></td>
                </tr>
                <?php $total += $item['total_price']; ?>
            <?php endforeach; ?>
        </tbody>
    </table>

    <h5>Total: Rp<?= number_format($total, 0, ',', '.') ?></h5>


    <form action="<?= site_url('checkout/confirm_purchase/' . urlencode($seller_data['seller_name'])); ?>" method="POST">
        <input type="hidden" name="total_price" value="<?= $total ?>">
        <input type="hidden" name="items" value="<?= htmlspecialchars(json_encode($items)); ?>">
        
        <!-- Tambahkan data buyer dalam bentuk hidden input -->
        <input type="hidden" name="buyer_name" value="<?= $buyer_data['buyer_name']; ?>">
        <input type="hidden" name="buyer_address" value="<?= $buyer_data['buyer_address']; ?>">
        <input type="hidden" name="buyer_number" value="<?= $buyer_data['buyer_number']; ?>">

        <button type="submit" class="btn btn-success">Konfirmasi Pembelian</button>
    </form>
</div>
<br><br><br>
</body>
</html>
