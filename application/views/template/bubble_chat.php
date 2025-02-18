<style>
    .fixed-link {
        position: fixed;  /* Menyimpan elemen di posisi tetap */
        bottom: 10px;  /* Jarak dari bawah */
        right: 10px;   /* Jarak dari kanan */
        z-index: 1000;  /* Menghindari tumpang tindih dengan elemen lain */
        text-decoration: none;  /* Menghilangkan underline dari link */
    }
    
    .fixed-link img {
        width: 50px;  /* Mengatur lebar gambar */
        height: 50px;  /* Mengatur tinggi gambar */
        object-fit: cover;  /* Memastikan gambar tidak terpotong */
    }
</style>

<a href='http://localhost/fp/chat' class="fixed-link mb-3 me-3 btn btn-dark">
    <img src="<?= base_url('asset/chat.png') ?>" alt="Link Icon">
</a>
