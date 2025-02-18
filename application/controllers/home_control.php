<?php
class home_control extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_produk');
        $this->load->helper('text');
        $this->load->helper('url');
        $this->load->library('session');
    } 
    public function index(){
        $data['products'] = $this->M_produk->getProduk();
        $this->load->view('template/header');
        $this->load->view('V_home',$data);
        $this->load->view('template/tampil_produk',$data);
        $this->load->view('template/footer');
        $this->load->view('template/bubble_chat');
    }
    public function kategori($kategori) {
        $this->load->view('template/header');
        $data['products'] = $this->M_produk->get_produk_by_kategori($kategori); 
        $data['category'] = $kategori; 
        $this->load->view('tampil_produk_kategori',$data);
        $this->load->view('template/tampil_produk', $data); 
        $this->load->view('template/footer');
        $this->load->view('template/bubble_chat');
    }   
    public function detail($product_id) {
        $product = $this->M_produk->getProdukById($product_id);
        $seller_name = $this->M_produk->get_seller_name_by_id($product['seller_name']);
        $names = $this->M_produk->get_products_by_seller($seller_name);
        $store = $this->M_produk->get_store_name_by_name($seller_name);
        $data = [
            'products' => $product,
            'seller_name' => $seller_name,
            'names' => $names,
            'store' => $store
        ];
        $this->load->view('template/header');
        $this->load->view('V_product_detail', $data);
        $this->load->view('template/footer');
        $this->load->view('template/bubble_chat');
}

    public function search(){
        $query = $this->input->get('query', true); 
        $this->load->view('template/header');
        if ($query) {
            $data['products'] = $this->M_produk->searchProduk($query); 
            $data['query'] = $query; 
        } else {
            $data['products'] = [];
            $data['query'] = '';
        }
        $this->load->view('template/tampil_produk', $data); 
        $this->load->view('template/footer');
        $this->load->view('template/bubble_chat');
    }

}
?>