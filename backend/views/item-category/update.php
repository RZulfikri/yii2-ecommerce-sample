<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemCategory */

$this->title = 'Update Item Category: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Item Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id, 'parent_category' => $model->parent_category]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="item-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
