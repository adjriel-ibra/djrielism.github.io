<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
        }
        .login-box {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 8px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
<body>
    
    <!-- batas haram -->
<div class="login-box">
        <h3 class="text-center">Login Seller</h3>
        
        <?php if ($this->session->flashdata('error')): ?>
        <div class="alert alert-danger">
                <?= $this->session->flashdata('error'); ?>
            </div>
        <?php endif; ?>
        <form action="<?= site_url('sllogin/authenticate') ?>" method="post">
            <div class="mb-3">
                <label for="seller_name" class="form-label">Seller Name</label>
                <input type="text" class="form-control" id="seller_name" name="seller_name" required>
            </div>
        
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-dark w-100">Login</button>
        </form>
        <div class="text-center mt-3">
            <span>Belum punya akun?</span>
            <a href="<?= site_url('byregister'); ?>" class="btn btn-link-dark">Daftar Sekarang</a>
        </div>
    </div>
    <!-- batas haram -->
<!-- Menambahkan JS Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-Q6wU6rjMhNdbDpP7W8Hx5kq0f3Q9QY5QtxlShp1d9ORvnt7mcLtm4D+rzvKcL58w" crossorigin="anonymous"></script>
</body>
</html>
