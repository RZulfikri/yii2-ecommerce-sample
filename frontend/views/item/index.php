<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\widgets\LinkPager;
/* @var $this yii\web\View */
/* @var $searchModel frontend\models\itemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = yii::$app->name;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-index">
    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
        <?php
            foreach ($categoryList as $category) {
                echo "<a href='?categ=$category->id' class='btn btn-default col-lg-12 col-md-12 col-sm-12 col-xs-12'>$category->name</a>";
            }
        ?>
    </div>
    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php
            foreach ($itemList as $item) {
                echo $this->render('_item', ['item' => $item]);
            }
        ?>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <?php
                echo LinkPager::widget([
                    'pagination' => $pages,
                ])
            ?>
        </div>
    </div>
</div>
