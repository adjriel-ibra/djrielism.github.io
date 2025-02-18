<?php
class M_transaction extends CI_Model {

    // Fungsi untuk membuat transaksi baru di tabel transactions
    public function create_transaction($data) {
        // Insert data transaksi ke dalam tabel transactions
        $this->db->insert('transactions', $data);
        return $this->db->insert_id(); // Mengembalikan ID transaksi yang baru saja dibuat
    }

    public function get_transactions_by_seller($seller_name) {
        $this->db->where('seller_name', $seller_name);
        return $this->db->get('Transactions')->result();
    }   

    public function update_transaction_status($transaction_id, $status){
        $data = [
            'status' => $status, 
            'updated_at' => date('Y-m-d H:i:s') 
        ];
        
        $this->db->where('transaction_id', $transaction_id); 
        return $this->db->update('Transactions', $data); // Menjalankan update
    }
    
    public function add_transaction_item($data) {
        // Insert item transaksi ke dalam tabel transaction_items
        $this->db->insert('transaction_items', $data);
    }
}
?>
