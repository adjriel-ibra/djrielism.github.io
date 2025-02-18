<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class slProducts extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_Produk'); 
    }

    public function index()
    {
        if ($this->session->userdata('seller_name')) {
            $seller_name = $this->session->userdata('seller_name'); 
            $data['products'] = $this->M_slProduct->get_products_by_seller($seller_name);

            $this->load->view('product_list', $data); 
        } else {
            redirect('sllogin'); 
        }
    }
}
