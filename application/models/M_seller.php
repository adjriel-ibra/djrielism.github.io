<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_seller extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public function update_quantity($cart_item_id, $quantity, $total_price) {
        $this->db->where('cart_item_id', $cart_item_id);
        $this->db->update('cart_items', [
            'quantity' => $quantity,
            'total_price' => $total_price
        ]);
    }
    public function get_seller_by_name($seller_name) {
        $this->db->from('sellers'); // Tentukan nama tabel
        $this->db->where('seller_name', $seller_name); // Menyaring data berdasarkan nama seller
        $query = $this->db->get(); // Eksekusi query
        return $query->row(); // Mengembalikan hasil dalam bentuk objek atau null jika tidak ditemukan
    }

    public function update_seller($seller_name, $data) {
        $this->db->where('seller_name', $seller_name);
        $this->db->update('sellers', $data);
    }
    public function get_cart_items_by_cart_id($cart_id) {
        $this->db->select('cart_items.cart_item_id, products.product_name, products.product_price, cart_items.quantity, cart_items.total_price, products.seller_name');
        $this->db->from('cart_items');
        $this->db->join('products', 'products.product_id = cart_items.product_id');
        $this->db->where('cart_items.cart_id', $cart_id);
        return $this->db->get()->result_array();
    }

    public function get_cart_item_by_id($cart_item_id) {
        return $this->db->get_where('cart_items', ['cart_item_id' => $cart_item_id])->row();
    }
    public function update_cart_total($cart_id, $total_price) {
        $this->db->where('cart_id', $cart_id);
        $this->db->update('carts', [
            'total_price' => $total_price
        ]);
    }
    public function check_login($seller_name, $password)
    {
        $this->db->where('seller_name', $seller_name);
        $this->db->where('password', $password); 
        $query = $this->db->get('sellers'); 

        if ($query->num_rows() == 1) {
            return $query->row(); // Mengembalikan objek row bukan array
        }
        return false; 
    }
    public function get_seller_data($seller_name) {
        $this->db->select('seller_name, store_address, bank_num, bank_type');
        $this->db->from('sellers');
        $this->db->where('seller_name', $seller_name);
        $query = $this->db->get();

        return $query->row_array(); // Mengembalikan satu baris data
    }
}
