<?php

class Barang_Masuk_Model extends CI_Model{
	

	public $limit;
	public $offset;
	public $sort;
	public $order;
	
	function __construct(){

		parent::__construct();

	}

	function get(){			

		$sql = 	"SELECT * FROM tbl_barang_masuk ".			    
				"ORDER BY $this->sort $this->order ".
				"LIMIT $this->offset,$this->limit";

		$rs = $this->db->query($sql);				
		return $rs;	
	}

	function delete($id){

		$this->db->query("DELETE FROM tbl_barang_masuk WHERE id=$id");
		
	}

	// function get(){

	// 	$rs = $this->db->query("SELECT * FROM tbl_barang_masuk");
	// 	return $rs;
	// }

	function insert($data){
		$this->db->trans_start();
		$this->db->insert('tbl_barang_masuk',$data);		
		$insert_id = $this->db->insert_id();
		$this->db->trans_complete();
		return $insert_id;
	}

	function get_num(){
		$rs = $this->db->query("SELECT * FROM tbl_barang_masuk");
		return $rs->num_rows();
	}


}