<div class="span4 sidebar">
   <div class="widget">
      <h2>Review Terbaru</h2>
      <ul class="cards">
      <?php foreach ($latest_review->result() as $review) { ?>
         <li>      
            <div class="img">
               <img src="<?php echo base_url() .'assets/web/images/image-produk/'.$review->gambar; ?>" />
               <div class="label label-info">Rating <?php echo $review->rating;?></div>
            </div>

            <p class="info-text"><?php echo $review->nama_produk;?></p>
            <p class="info-text"><?php echo $review->isi;?></p>
            <div class="stats">
               <p class="time"><?php echo $review->email;?></p>
               <!-- <span>15 <i class="icon-pushpin"></i></span>
               <span>27 <i class="icon-comment"></i></span> -->
               <span><?php echo $review->update_at;?> <i class="icon-eye-open"></i></span>
               <!-- <span></span> -->
            </div>   
         </li>
      <?php } ?> 
         <li class="more">
            <a href="<?php echo base_url() . 'admin/produk/review' ?>">Show All</a>
         </li>
      </ul>
   </div>
</div>