<?php
  $this->registerCss('
  image {
    width: 100%;
  }')
?>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
  <div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container-fluid">
      <?php
        if (isset($item->photo)) {
          echo "<img src=" . Yii::getAlias('@image') . "/uploads" . "/"  .$item->photo . " alt='$item->name' class='image' />";
        } else {
          echo "<img src=" . Yii::getAlias('@image') . "/assets/images/no-image.jpg" . " alt='$item->name' class='image' />";
        }
      ?>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><?= $item->name ?></div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><?= $item->price ?></div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><?= $item->category->name ?></div>
    <?php
      if (strpos(Yii::$app->request->pathInfo, 'item') !== false) {
        ?>
          <a href='beli?id=<?=$item->id?>' class="btn btn-primary">BELI</a>
        <?php
      } else {
        ?>
          <a href='item/beli?id=<?=$item->id?>' class="btn btn-primary">BELI</a>
        <?php
      }
    ?>
  </div>
</div>