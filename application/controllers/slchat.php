<?php
class slChat extends CI_Controller {
    public function index() {
        $this->load->model('M_slchat');
        $data['contacts'] = $this->M_slchat->getContacts();

        $penjual = $this->session->userdata('seller_name'); // Pastikan 'seller_name' ada di session
        $contact = $this->input->get('contact'); // Pastikan 'contact' berasal dari input GET
        if ($penjual && $contact) { // Validasi kedua nilai
            $data['selectedContact'] = $contact;
            $data['messages'] = $this->M_slchat->getMessages($contact, $penjual);
        } else {
            $data['selectedContact'] = null;
            $data['messages'] = [];
        }
        $this->load->view('V_slchat', $data);
    }

    public function sendMessage() {
        $datetime = new DateTime('now', new DateTimeZone('Asia/Jakarta'));
        $datetime->format('Y-m-d H:i:s');
        
        $this->load->model('M_slchat');
        
        $kirim = $this->session->userdata('seller_name');
        $terima = $this->input->post('receiver');
        $pesan = $this->input->post('message');
        
        // Validasi input
        if (!empty($kirim) && !empty($terima) && !empty($pesan)) {
            // Pastikan sender hanya menyimpan seller_name
            
            $data = [
                'sender' => $kirim,
                'receiver' => $terima,
                'message' => $pesan,
                'chat_time' => $datetime->format('Y-m-d H:i:s'),
            ];
            $this->M_slchat->sendMessage($data);
            redirect('slchat?contact=' . urlencode($data['receiver']));
        } else {
            $this->session->set_flashdata('error', 'Semua kolom harus diisi.');
            redirect('slchat?contact=' . urlencode($terima));
        }
    }
}
