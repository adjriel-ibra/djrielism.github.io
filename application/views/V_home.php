<div style="margin-top: 100px;"></div>
<br>
<hr>
<section class="container my-5">
    <h2 class="category-title text-center">Kategori</h2>

    <div class="d-flex justify-content-center flex-wrap">
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Womens') ?>" class="text-decoration-none text-dark">
                <img src="asset/wanita.png" class="img-fluid" style="height: 50px; width: auto;" alt="Fashion">
                <h5 class="mt-2">Womens</h5>
            </a>
        </div>
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Elektronik') ?>" class="text-decoration-none text-dark">
                <img src="asset/elektronik.png" class="img-fluid" style="height: 50px; width: auto;" alt="Elektronik">
                <h5 class="mt-2">Elektronik</h5>
            </a>
        </div>
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Otomotif') ?>" class="text-decoration-none text-dark">
                <img src="asset/otomotif.png" class="img-fluid" style="height: 50px; width: auto;" alt="Otomotif">
                <h5 class="mt-2">Otomotif</h5>
            </a>
        </div>
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Hobi') ?>" class="text-decoration-none text-dark">
                <img src="asset/hobi.png" class="img-fluid" style="height: 50px; width: auto;" alt="Hobi">
                <h5 class="mt-2">Hobi</h5>
            </a>
        </div>
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Dekorasi') ?>" class="text-decoration-none text-dark">
                <img src="asset/dekorasi.png" class="img-fluid" style="height: 50px; width: auto;" alt="Dekorasi">
                <h5 class="mt-2">Dekorasi</h5>
            </a>
        </div>
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Perawatan') ?>" class="text-decoration-none text-dark">
                <img src="asset/perawatan.png" class="img-fluid" style="height: 50px; width: auto;" alt="Perawatan">
                <h5 class="mt-2">Perawatan</h5>
            </a>
        </div>
        <!-- Kesehatan -->
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Kesehatan') ?>" class="text-decoration-none text-dark">
                <img src="asset/kesehatan.png" class="img-fluid" style="height: 50px; width: auto;" alt="Kesehatan">
                <h5 class="mt-2">Kesehatan</h5>
            </a>
        </div>
        <div class="p-3 text-center col-6 col-md-4 col-lg-3">
            <a href="<?= site_url('home_control/kategori/Mans') ?>" class="text-decoration-none text-dark">
                <img src="asset/pria.png" class="img-fluid" style="height: 50px; width: auto;" alt="fashion pria">
                <h5 class="mt-2">Man's</h5>
            </a>
        </div>
    </div>
</section>
<hr>
<?php if ($this->session->flashdata('message')): ?>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Pembelian Berhasil',
            text: '<?= $this->session->flashdata('message'); ?>',
        }).then(function() {
            window.location.href = '<?= site_url('home_control') ?>';  // Kembali ke halaman utama
        });
    </script>
<?php endif; ?>
