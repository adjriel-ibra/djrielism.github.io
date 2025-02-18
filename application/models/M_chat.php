<?php
class M_chat extends CI_Model {
    public function getContacts() {
        return $this->db->select('seller_name as name')->get('sellers')->result_array();
    }

    public function getMessages($receiver, $sender) {
        $this->db->where("(sender = '$sender' AND receiver = '$receiver') OR (sender = '$receiver' AND receiver = '$sender')");
        $this->db->order_by('chat_time', 'ASC');
        return $this->db->get('chat')->result_array();
    }

    public function sendMessage($data) {
        if ($this->session->userdata('buyer_name')) {
            $data['sender'] = $this->session->userdata('buyer_name'); 
            return $this->db->insert('chat', $data);
        } else {
            return false;
        }
    }
}
?>