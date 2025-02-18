<?php
class M_checkout extends CI_Model {
    
    // Fungsi untuk mendapatkan data produk berdasarkan seller untuk checkout
    public function get_products_by_seller($buyer_name, $seller_name) {
        $this->db->select('products.product_id, products.product_name, products.product_price, cart_items.quantity');
        $this->db->from('cart_items');
        $this->db->join('carts', 'carts.cart_id = cart_items.cart_id');
        $this->db->join('products', 'products.product_id = cart_items.product_id');
        $this->db->where('carts.buyer_name', $buyer_name);
        $this->db->where('products.seller_name', $seller_name);  // Ubah store_name ke seller_name
        return $this->db->get()->result();
    }

    public function get_product_id_by_seller($buyer_name, $seller_name) {
        // Tentukan tabel mana yang memiliki product_id untuk menghindari ambiguitas
        $this->db->select('cart_items.product_id');
        $this->db->join('products', 'products.product_id = cart_items.product_id');
        $this->db->join('carts', 'carts.cart_id = cart_items.cart_id');
        $this->db->from('cart_items');
        $this->db->where('carts.buyer_name', $buyer_name);
        $this->db->where('products.seller_name', $seller_name);
        
        $query = $this->db->get();
        
        // Mengembalikan hanya satu product_id atau null jika tidak ditemukan
        $result = $query->row();  // Mengambil satu baris
        
        // Jika ada hasil, kembalikan product_id, jika tidak, kembalikan null
        return $result ? $result->product_id : null;
    }

    public function get_transactions_by_buyer($buyer_name) {
        $this->db->where('buyer_name', $buyer_name);
        $this->db->order_by('created_at', 'DESC');
        return $this->db->get('transactions')->result();
    }
    public function create_transaction($data) {
        // Memasukkan data transaksi langsung ke tabel transactions
        $this->db->insert('transactions', $data);
    
        // Mengembalikan ID transaksi yang baru disisipkan
        return $this->db->insert_id();
    }

    public function add_transaction($buyer_name, $seller_name, $total_price) {
        // Cek apakah seller ada di tabel sellers
        $this->db->where('seller_name', $seller_name);
        $query = $this->db->get('sellers');

        if ($query->num_rows() == 0) {
            // Jika seller belum ada, tambahkan seller terlebih dahulu
            $seller_data = [
                'seller_name' => $seller_name,
                // Isi data seller lainnya jika diperlukan, seperti store_name, store_address, dll
            ];
            $this->db->insert('sellers', $seller_data);
        }

        // Setelah memastikan seller ada, masukkan data transaksi ke tabel transactions
        $transaction_data = [
            'buyer_name' => $buyer_name,
            'seller_name' => $seller_name,
            'total_price' => $total_price,
            'status' => 'pending',  // status default
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ];

        $this->db->insert('transactions', $transaction_data);
        return $this->db->insert_id();  // Mengembalikan ID transaksi yang baru ditambahkan
    }
    // Fungsi untuk menambahkan item ke transaksi
    public function add_items_to_transaction($transaction_id, $items) {
        $data = [];
        foreach ($items as $item) {
            $data[] = [
                'transaction_id' => $transaction_id,
                'product_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'total_price' => $item['total_price']
            ];
        }
        // Menambahkan data transaksi item ke tabel transaction_items
        $this->db->insert_batch('transaction_items', $data);
    }
}
?>
<!-- sampai models -->