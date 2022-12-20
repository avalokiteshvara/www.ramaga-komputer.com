<?php

class Barang_Masuk_Details_Model extends CI_Model{
	

	public $limit;
	public $offset;
	public $sort;
	public $order;
	
	function __construct(){

		parent::__construct();

	}

	function delete_by_idbarangmasuk($id_barang_masuk){
		$this->db->query(
			"DELETE FROM tbl_barang_masuk_details ".
			"WHERE id_barang_masuk=$id_barang_masuk");		
	}

	function get_by_idbarangmasuk($id_barang_masuk){
		$rs = $this->db->query(	"SELECT b.kode,a.id,b.nama,b.gambar,a.jumlah ".
							   	"FROM tbl_barang_masuk_details a ".
								"LEFT JOIN tbl_produk b ".
								"ON trim(a.kode_produk) = trim(b.kode) ".
								"WHERE a.id_barang_masuk = $id_barang_masuk ");
		return $rs;
	}

	function delete($id){

		$this->db->query("DELETE FROM tbl_barang_masuk_details WHERE id=$id");

	}

	function insert($id_barang_masuk,$kode_produk,$jumlah){		
		// $this->db->insert('tbl_barang_masuk_details',$data);		
		$this->db->query(
			"INSERT INTO tbl_barang_masuk_details(id_barang_masuk,kode_produk,jumlah) ".
			"VALUES($id_barang_masuk,'$kode_produk',$jumlah)");
	}





}