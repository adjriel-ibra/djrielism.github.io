<?php
class M_produk extends CI_model{
    public function getProduk(){
        return $this->db->get('products')->result_array();
    }

    public function get_produk_by_kategori($kategori) {
        $this->db->where('product_category', $kategori);
        return $this->db->get('products')->result_array(); 
    } 

    public function getProdukById($product_id) {
        $this->db->where('product_id', $product_id);
        return $this->db->get('products')->row_array(); 
    }

    public function searchProduk($keyword){
        $this->db->like('product_name', $keyword); 
        return $this->db->get('products')->result_array();
    }

    public function get_products_by_seller($seller_name) {
        $this->db->from('products'); 
        $this->db->where('seller_name', $seller_name); 
        $query = $this->db->get(); 
        return $query->result_array(); 
    }

    public function get_seller_name_by_id($seller_name){
        $this->db->select('seller_name');
        $this->db->from('sellers');
        $this->db->where('seller_name', $seller_name);
        $query = $this->db->get();
        return $query->row('seller_name');
    }

    public function get_store_name_by_name($seller_name){
        $this->db->select('store_name');
        $this->db->from('sellers');
        $this->db->where('seller_name', $seller_name);
        $query = $this->db->get();
        return $query->row('store_name');
    }

    public function update_produk($product_id, $data){
        $this->db->where('product_id', $product_id);
        $this->db->update('products', $data);
    }

    public function delete_produk($product_id){
        $this->db->where('product_id', $product_id);
        $this->db->delete('products');
    }

    public function tambah_produk($data){
        $this->db->insert('products', $data);
    }

}

?>