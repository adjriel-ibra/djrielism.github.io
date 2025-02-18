<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Seller</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="container mt-5 pt-5">
        <h1 class="mb-4">Profil Seller</h1>
        
        <?php if ($this->session->flashdata('success')): ?>
            <script>
                Swal.fire({
                    title: "Sukses!",
                    text: "<?= $this->session->flashdata('success'); ?>",
                    icon: "success"
                });
            </script>
        <?php endif; ?>
            
        <form action="<?= base_url('sllogin/update'); ?>" method="post">
            <div class="mb-3">
                <label for="seller_name" class="form-label">Nama</label>
                <input type="text" class="form-control" id="seller_name" name="seller_name" value="<?= htmlspecialchars($seller->seller_name ?? ''); ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<?= htmlspecialchars($seller->email ?? ''); ?>" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<?= htmlspecialchars($seller->password ?? ''); ?>" required>
            </div>
            <div class="mb-3">
                <label for="store_name" class="form-label">Nama Toko</label>
                <input type="text" class="form-control" id="store_name" name="store_name" value="<?= htmlspecialchars($seller->store_name ?? ''); ?>" required>
            </div>
            <div class="mb-3">
                <label for="store_address" class="form-label">Alamat Toko</label>
                <input type="text" class="form-control" id="store_address" name="store_address" value="<?= htmlspecialchars($seller->store_address ?? ''); ?>" required>
            </div>
            <div class="container px-4">
                <div class="row gx-5 mb-5 pb-5">
                    <div class="col d-flex align-items-center justify-content-center">
                        <div class="border">
                            <button id="update" type="submit" class="btn btn-dark">Update Profil</button>
                        </div>
                    </div>
                    <div class="col d-flex align-items-center justify-content-center">
                        <div class="border">
                            <a href="<?=base_url('sllogin/logout')?>" id="logout" class="btn btn-danger">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <h2 class="mt-5">Daftar Transaksi</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Buyer</th>
                    <th>Total Harga</th>
                    <th>Status</th>
                    <th>Dibuat Pada</th>
                    <th>Diperbarui Pada</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
            <?php if (!empty($transactions)): ?>
                <?php foreach ($transactions as $transaction): ?>
                    <tr>
                        <td><?= htmlspecialchars($transaction->buyer_name ?? 'Tidak Diketahui'); ?></td>
                        <td>Rp<?= number_format($transaction->total_price ?? 0, 0, ',', '.'); ?></td>
                        <td>
                        <form action="<?= base_url('sllogin/update_transaction_status'); ?>" method="post">
                            <input type="hidden" name="transaction_id" value="<?= $transaction->transaction_id ?? ''; ?>">
                            <select name="status" class="form-select">
                                <option value="pending" <?= ($transaction->status ?? '') == 'pending' ? 'selected' : ''; ?>>Pending</option>
                                <option value="paid" <?= ($transaction->status ?? '') == 'paid' ? 'selected' : ''; ?>>Paid</option>
                                <option value="shipped" <?= ($transaction->status ?? '') == 'shipped' ? 'selected' : ''; ?>>Shipped</option>
                                <option value="completed" <?= ($transaction->status ?? '') == 'completed' ? 'selected' : ''; ?>>Completed</option>
                                <option value="cancelled" <?= ($transaction->status ?? '') == 'cancelled' ? 'selected' : ''; ?>>Cancelled</option>
                            </select>
                            </td>
                            <td><?= $transaction->created_at ?? '-'; ?></td>
                            <td><?= $transaction->updated_at ?? '-'; ?></td>
                            <td>
                            <button type="submit" class="btn btn-dark">Simpan Perubahan</button>
                        </form>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                    <?php else: ?>
                    <tr>
                        <td colspan="6" class="text-center">Tidak ada transaksi</td>
                    </tr>
                    <?php endif; ?>
            </tbody>
        </table>

    </div>

    <script>
        // Update Profil
        const tombol = document.querySelector('#update');
        tombol.addEventListener("click", function(event) {
            event.preventDefault();
            Swal.fire({
                title: "Apakah Anda yakin ingin memperbarui profil?",
                icon: "question",
                showCancelButton: true,
                confirmButtonText: "Ya, Update!",
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    document.querySelector('form').submit();
                }
            });
        });

        // Logout
        const tombolLogout = document.querySelector('#logout');
        tombolLogout.addEventListener("click", function(event) {
            event.preventDefault();
            Swal.fire({
                title: "Yakin ingin logout?",
                text: "Anda akan keluar dari sesi ini.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Ya, Logout",
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "<?= site_url('sllogin/logout') ?>";
                }
            });
        });
    </script>
</body>
</html>
