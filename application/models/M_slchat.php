<?php
class M_slchat extends CI_Model {
    public function getContacts() {
        return $this->db->select('buyer_name as name')->get('buyers')->result_array();
    }

    public function getMessages($receiver, $sender) {
        $pengirim = $this->session->userdata('seller_name');
        $this->db->where("(sender = '$pengirim' AND receiver = '$receiver') OR (sender = '$receiver' AND receiver = '$pengirim')");
        $this->db->order_by('chat_time', 'ASC');
        return $this->db->get('chat')->result_array();
    }

    public function sendMessage($data) {
        if (!empty($data['sender']) && !empty($data['receiver']) && !empty($data['message'])) {
            // Akses seller_name dari objek stdClass yang ada di dalam sender
            $pengirim = $this->session->userdata('seller_name');
    
            $penerima = $data['receiver'];
            $pesan = $data['message'];
            $waktu = $data['chat_time'];
    
            return $this->db->insert('chat', [
                'sender' => $pengirim,
                'receiver' => $penerima,
                'message' => $pesan,
                'chat_time' => $waktu,
            ]);
        } else {
            return false;
        }
    }
    
    
}
