<?php

class Produk_model extends CI_model{


	public $limit;
	public $offset;
	public $sort;
	public $order;

	function __contruct(){

		parent::__contruct();

	}

	function get_where($key,$value){

		$rs = $this->db->select('*')
                	   ->from('tbl_produk')
                	   ->where($key,$value)
                	   ->order_by($this->sort,$this->order)
                       ->get('', $this->limit, $this->offset);	

        return $rs;
	}


	function get_for_table($aktif=NULL){

		$sql = 	"SELECT a.kode , 
				       a.nama,
				       a.slug,
				       a.jenis,
				       CASE 
						 	WHEN a.jenis = 'komputer' THEN  (SELECT title FROM tbl_komputer WHERE id = a.id_jenis)
						 	WHEN a.jenis = 'peripheral' THEN  (SELECT title FROM tbl_peripheral WHERE id = a.id_jenis)
						 	WHEN a.jenis = 'software' THEN  (SELECT title FROM tbl_software WHERE id = a.id_jenis)
						 END as nama_jenis,	
				       a.harga,a.harga_lama,a.promo,a.gambar,a.aktif 
				FROM tbl_produk a  ";

		if(isset($aktif)){

			$sql .= "WHERE a.aktif = ? ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql,array($aktif));		

		}else{
			$sql .=	"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql);				
		}	

		return $rs;
	}

	function get($aktif = NULL){			

		$sql = 	"SELECT a.*,IFNULL(FLOOR(AVG(b.rating)),0) as average_rating ".
				"FROM tbl_produk a ".
				"LEFT JOIN tbl_review b ".
				"ON a.kode = b.kode_produk ";

		if(isset($aktif)){

			$sql .= "WHERE a.aktif = ? ";					
			$sql .=	"GROUP BY a.kode ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql,array($aktif));		

		}else{
			$sql .=	"GROUP BY a.kode ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql);				
		}	

		return $rs;	
	}


	function get_random($slug,$aktif=NULL){
		$sql = 	"SELECT a.*,IFNULL(FLOOR(AVG(b.rating)),0) as average_rating ".
				"FROM tbl_produk a ".
				"LEFT JOIN tbl_review b ".
				"ON a.kode = b.kode_produk ";

		if(isset($aktif)){

			$sql .= "WHERE a.aktif = ? AND a.slug <> ? ";					
			$sql .=	"GROUP BY a.kode ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql,array($aktif,$slug));		

		}else{
			$sql .= "WHERE a.slug <> ? ";	
			$sql .=	"GROUP BY a.kode ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql,array($slug));				
		}	

		return $rs;	


	}

	/*kurang status_stok*/
	function get_details($slug,$aktif=NULL){
		
		$sql   = 
		       "SELECT  a.kode as kode_produk, 
				        a.harga_lama, 
					 	a.harga,
						a.slug, 
						a.promo, 
						a.gambar, 
						a.nama as nama_produk,						
						a.deskripsi,
						a.jenis,
						a.berat,
						a.id_jenis,
				        CASE 
						 	WHEN a.jenis = 'komputer' THEN  (SELECT title FROM tbl_komputer WHERE id = a.id_jenis)
						 	WHEN a.jenis = 'peripheral' THEN  (SELECT title FROM tbl_peripheral WHERE id = a.id_jenis)
						 	WHEN a.jenis = 'software' THEN  (SELECT title FROM tbl_software WHERE id = a.id_jenis)
						END as nama_jenis, 
						IFNULL(b.average_rating,0) AS average_rating 
				FROM tbl_produk a 
				LEFT JOIN ( 
						  SELECT kode_produk, FLOOR(AVG(rating)) AS average_rating 
						  FROM tbl_review 
						  GROUP BY kode_produk 
				         ) b ON a.kode = b.kode_produk 
				WHERE a.slug LIKE '%".$this->db->escape_like_str($slug)."' ";				 

		if(isset($aktif)){
			
			$sql .=  "AND a.aktif = ? ";
			$sql .=	 "GROUP BY a.kode";

			$rs = $this->db->query($sql,array($aktif));			 

		}else{

			$sql .=	 "GROUP BY a.kode";
			$rs = $this->db->query($sql);							

		}
		
		return $rs;		 

	}
	

	function get_based_on($based_what,$slug,$aktif=NULL){

		$sl = $this->db->escape_like_str($slug);
		$sql = "SELECT a.*,IFNULL(c.average_rating,0) as average_rating 
			   FROM tbl_produk a 
			   LEFT JOIN tbl_$based_what b ON a.id_jenis = b.id AND a.jenis = '$based_what'
			   LEFT JOIN (SELECT kode_produk,FLOOR(AVG(rating)) as average_rating  
			   			FROM tbl_review 
			   			GROUP BY kode_produk) c 
			   ON a.kode = c.kode_produk 
			   WHERE b.slug LIKE '%$sl' ";

		if(isset($aktif)){
			
			$sql .= "AND a.aktif = ? ";
			$sql .= "GROUP BY a.kode ".
			   		"ORDER BY $this->sort $this->order ".
			   		"LIMIT $this->offset,$this->limit";

			$rs = $this->db->query($sql,array($aktif));		
					
		}else{

			$sql .= "GROUP BY a.kode ".
			   		"ORDER BY $this->sort $this->order ".
			   		"LIMIT $this->offset,$this->limit";

			$rs = $this->db->query($sql);				   		
		}
		
		return $rs;
	}

	function get_based_range($min_range,$max_range,$aktif=NULL){
		$sql = "SELECT a.*,IFNULL(c.average_rating,0) as average_rating ".
			   "FROM tbl_produk a ".			   
			   "LEFT JOIN (SELECT kode_produk,FLOOR(AVG(rating)) as average_rating  ".
			   "			FROM tbl_review ".
			   "			GROUP BY kode_produk) c ".
			   "ON a.kode = c.kode_produk ".
			   "WHERE a.harga BETWEEN $min_range AND $max_range ";

		if(isset($aktif)){
			
			$sql .= "AND a.aktif = ? ";
			$sql .= "GROUP BY a.kode ".
			   		"ORDER BY $this->sort $this->order ".
			   		"LIMIT $this->offset,$this->limit";

			$rs = $this->db->query($sql,array($aktif));		
					
		}else{

			$sql .= "GROUP BY a.kode ".
			   		"ORDER BY $this->sort $this->order ".
			   		"LIMIT $this->offset,$this->limit";

			$rs = $this->db->query($sql,array());				   		
		}
		
		return $rs;

	}

	function num_page_get_based_on($based_what,$slug,$aktif=NULL){		

		$sql = "SELECT * ".
			   "FROM tbl_produk a ".
			   "LEFT JOIN tbl_".$based_what ." b ".
			   "ON a.id_jenis = b.id ".
			   "WHERE b.slug LIKE '%".$this->db->escape_like_str($slug)."' ";
			   

		if(isset($aktif)){
			
			$sql .= "AND a.aktif = ? ";
			$sql .= "GROUP BY a.kode ";
			$rs = $this->db->query($sql,array($aktif));		
					
		}else{

			$sql .= "GROUP BY a.kode ";
			$rs = $this->db->query($sql);				   		
		}

		return $rs->num_rows();		
	}

	function num_page_get_range($min_range,$max_range,$aktif=NULL){
		$sql = "SELECT * ".
			   "FROM tbl_produk a ".
			   "WHERE a.harga BETWEEN $min_range AND $max_range ";   

		if(isset($aktif)){
			
			$sql .= "AND a.aktif = ? ";			
			$rs = $this->db->query($sql,array($aktif));		
					
		}else{

			$rs = $this->db->query($sql,array());				   		
		}

		return $rs->num_rows();		
	}

	function delete($kode){	

		//TODO delete on tbl_barang_masuk_details,tbl_produk_viewed,tbl_review,tbl_trans
		//		
		//
		// $this->db->delete('tbl_produk',array('sl' => $kode));


	}

	function insert($data){

		$this->db->insert('tbl_produk',$data);

	}

	function update($kode,$data){

		$this->db->where('kode',$kode);
		$this->db->update('tbl_produk',$data);
	}

	//terbaru adalah tgl_update +- 3 bulan dari sekarang
	function get_terbaru($aktif=NULL){

		$sql = 	"SELECT a.*,IFNULL(FLOOR(AVG(b.rating)),0) as average_rating ".
				"FROM tbl_produk a ".
				"LEFT JOIN tbl_review b ".
				"ON a.kode = b.kode_produk ";

		if(isset($aktif)){

			$sql .= "WHERE a.aktif = ? AND a.tgl_update BETWEEN DATE_ADD(NOW(),INTERVAL - 3 MONTH) AND NOW() ";					
			$sql .=	"GROUP BY a.kode ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql,array($aktif));		

		}else{			
			$sql .= "WHERE a.tgl_update BETWEEN DATE_ADD(NOW(),INTERVAL - 3 MONTH) AND NOW() ";					
			$sql .=	"GROUP BY a.kode ".
					"ORDER BY $this->sort $this->order ".
					"LIMIT $this->offset,$this->limit";
			$rs = $this->db->query($sql);				
		}	

		return $rs;	

	}

	function num_page_terbaru($aktif=NULL){
		$sql = 	"SELECT * ".
				"FROM tbl_produk a ".
				"LEFT JOIN tbl_review b ".
				"ON a.kode = b.kode_produk ";

		if(isset($aktif)){

			$sql .= "WHERE a.aktif = ? AND a.tgl_update BETWEEN DATE_ADD(NOW(),INTERVAL - 3 MONTH) AND NOW() ";					
			$sql .=	"GROUP BY a.kode ";
					
			$rs = $this->db->query($sql,array($aktif));		

		}else{			
			$sql .= "WHERE a.tgl_update BETWEEN DATE_ADD(NOW(),INTERVAL - 3 MONTH) AND NOW() ";					
			$sql .=	"GROUP BY a.kode ";

			$rs = $this->db->query($sql);				
		}	

		return $rs->num_rows();	

	}


	function num_page($aktif=NULL){
    	    
		$sql = "SELECT * FROM tbl_produk ";

		if(isset($aktif)){
			$sql .= "WHERE aktif = ? ";
			$rs = $this->db->query($sql,array($aktif));	
		}else{
			$rs = $this->db->query($sql);	
		}

        return $rs->num_rows();
    }

	function num_page_where($key,$value,$aktif=NULL){

		$sql = "SELECT * FROM tbl_produk WHERE ? = ? ";

		if(isset($aktif)){

			$sql .= "AND aktif = ? ";
			$rs = $this->db->query($sql,array( $key, $value, $aktif ));		

		}else{

			$rs = $this->db->query($sql,array($key,$value));		

		}

        return $rs->num_rows();

    }

    function get_id($slug){

		$rs = $this->db->query("SELECT kode FROM tbl_produk WHERE slug ='$slug'");
		return $rs->row()->kode;
	}

}