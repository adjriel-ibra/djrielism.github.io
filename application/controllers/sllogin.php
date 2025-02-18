<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sllogin extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_seller');
        $this->load->model('M_transaction');
        
    }

    public function index()
    {
        $this->load->view('sllogin');
        $this->load->view('template/bubble_slchat');
    }
    public function authenticate()
    {
        $seller_name = $this->input->post('seller_name');
        $password = $this->input->post('password');

        $seller = $this->M_seller->check_login($seller_name, $password);

        if ($seller) {
            $this->session->set_userdata('seller_name', $seller->seller_name);
            redirect('sllogin/dashboard'); 
        } else {
            $this->session->set_flashdata('error', 'Seller Name atau Password salah.');
            redirect('sllogin');
        }
    }
    
    public function update() {
        $seller_name = $this->session->userdata('seller_name');
        $data = array(
            'email' => $this->input->post('email'),
            'password' => $this->input->post('password'),
            'store_name' => $this->input->post('store_name'),
            'store_address' => $this->input->post('store_address')
        );
        $this->M_seller->update_seller($seller_name, $data);
        $this->session->set_flashdata('success', 'Profil berhasil diperbarui!');
        redirect('sllogin/tampil');
    }
    
    public function tampil() {
        if ($this->session->userdata('seller_name')) {
            $seller_name = $this->session->userdata('seller_name'); 
            $data['seller'] = $this->M_seller->get_seller_by_name($seller_name);
            $data['transactions'] = $this->M_transaction->get_transactions_by_seller($seller_name);

            $this->load->view('template/slheader');
            $this->load->view('sltampil', $data);
            $this->load->view('template/footer');
        } else {
            redirect('sllogin'); 
        }
    }

    public function update_transaction_status() {
        $transaction_id = $this->input->post('transaction_id');
        $status = $this->input->post('status');
        $this->M_transaction->update_transaction_status($transaction_id, $status);
        $this->session->set_flashdata('success', 'Status transaksi berhasil diperbarui.');
        redirect('sllogin/tampil');
    }

    public function dashboard(){
        $this->load->view('template/slheader');
        $data['seller_name'] = $this->session->userdata('seller_name');
        $this->load->view('template/bubble_slchat');
        $this->load->model('M_produk');
        $seller_name = $this->session->userdata('seller_name'); 
        if (!$seller_name) {
            redirect('sllogin');
        }
        $products = $this->M_produk->get_products_by_seller($seller_name);
        $data['products'] = $products; 
        $data['seller_name'] = $seller_name; 
        $this->load->view('sldashboard', $data);
        $this->load->view('template/footer');
    }
    
    public function edit_produk($product_id){
        $this->load->model('M_produk');
        
        $seller_name = $this->session->userdata('seller_name');
        if (!$seller_name) {
            redirect('sllogin');
        }
        
        $product = $this->M_produk->getProdukById($product_id);
        if ($product['seller_name'] !== $seller_name) {
            show_error('Anda tidak diizinkan untuk mengedit produk ini.');
        }
        
        if ($this->input->post()) {
            $update_data = array(
                'product_name' => $this->input->post('product_name'),
                'product_desc' => $this->input->post('product_desc'),
                'product_stock' => $this->input->post('product_stock'),
            );
            
            $this->M_produk->update_produk($product_id, $update_data);
            $this->session->set_flashdata('success', 'Produk berhasil diperbarui.');
            redirect('sllogin/dashboard');
        }
        
        $data['product'] = $product;
        $this->load->view('edit_produk', $data);
        $this->load->view('template/footer');
    }

    public function hapus_produk($product_id){
        $this->load->model('M_produk');
        $seller_name = $this->session->userdata('seller_name');
        if (!$seller_name) {
            redirect('sllogin');
        }
        
        $product = $this->M_produk->getProdukById($product_id);
        if ($product['seller_name'] !== $seller_name) {
            show_error('Anda tidak diizinkan untuk menghapus produk ini.');
        }
        
        $this->M_produk->delete_produk($product_id);
        $this->session->set_flashdata('success', 'Produk berhasil dihapus.');
        redirect('sllogin/dashboard');
    }
    
    public function tambah_produk(){
        $this->load->view('template/slheader');
        $this->load->model('M_produk');
        $seller_name = $this->session->userdata('seller_name');
        if (!$seller_name) {
            redirect('sllogin');
        }
        
        if ($this->input->post()) {
            $config['upload_path'] = './uploads/'; 
            $config['allowed_types'] = 'jpg|jpeg|png|gif'; 
            
            $this->load->library('upload', $config);
            
            if ($this->upload->do_upload('product_img')) {
                $upload_data = $this->upload->data();
                $image_path = 'uploads/' . $upload_data['file_name'];
                $new_product = array(
                    'product_name' => $this->input->post('product_name'),
                    'product_desc' => $this->input->post('product_desc'),
                    'product_price' => $this->input->post('product_price'),
                    'product_img' => $image_path,
                    'product_category' => $this->input->post('product_category'),
                    'seller_name' => $seller_name,
                );
                
                $this->M_produk->tambah_produk($new_product);
                $this->session->set_flashdata('success', 'Produk berhasil ditambahkan.');
                redirect('sllogin/dashboard');
            } else {
                $data['error'] = $this->upload->display_errors();
                $this->load->view('tambah_produk', $data);
            }
        } else {
            $this->load->view('tambah_produk');
        }
        $this->load->view('template/footer');
    }

    public function logout()
    {
        $this->session->unset_userdata('seller_name');
        redirect('sllogin');
    }
}
