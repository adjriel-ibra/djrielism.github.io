<?php
class Checkout extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('M_transaction');
        $this->load->model('M_cart');
        $this->load->model('M_checkout');

    }

    public function index() {
        $data['items'] = $this->session->userdata('checkout_items');
        $data['store_name'] = $this->session->userdata('store_name');
        $buyer_name = $this->session->userdata('buyer_name');
        
        if (empty($data['items'])) {
            $this->session->set_flashdata('error', 'Tidak ada data checkout.');
            redirect('cart');
        }

        $data['buyer_data'] = $this->M_cart->get_buyer_data($buyer_name);
        $data['seller_data'] = $this->M_cart->get_seller_data($data['store_name']);

        $this->load->view('checkout', $data);
        $this->load->view('template/footer');
    }

    public function confirm_purchase($seller_name) {
        // Mengganti simbol '+' dengan spasi pada seller_name jika diperlukan
        $seller_name = str_replace('+', ' ', $seller_name);
    
        // Ambil data buyer dari session
        $buyer_name = $this->session->userdata('buyer_name'); // Asumsi buyer sudah login
    
        // Ambil data total harga dari form input
        $total_price = $this->input->post('total_price');
    
        // Mengambil data produk dalam format JSON yang dikirimkan melalui POST
        $items = json_decode($this->input->post('items'), true); 
    
        // Status awal transaksi
        $status = 'pending';
    
        // Buat transaksi baru
        $transaction_data = [
            'buyer_name' => $buyer_name,
            'seller_name' => $seller_name,
            'total_price' => $total_price,
            'status' => $status,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ];
    
        // Simpan data transaksi ke tabel transactions
        $transaction_id = $this->M_transaction->create_transaction($transaction_data);
    
        // Simpan data produk ke tabel transaction_items
        foreach ($items as $item) {
            $transaction_item_data = [
                'transaction_id' => $transaction_id,
                'product_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'total_price' => $item['total_price']
            ];
            $this->M_transaction->add_transaction_item($transaction_item_data);
        }
    
        // Redirect ke halaman sukses setelah transaksi berhasil
        redirect('checkout/success');
    }
    

    public function success() {
        // Halaman sukses atau konfirmasi
        $this->load->view('success');
    }
}
?>
