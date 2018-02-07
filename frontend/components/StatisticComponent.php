<?php
  namespace app\components;
  use yii\base\component;
  use Yii;
  use app\models\Statistic;

  class StatisticComponent extends Component {
    const EVENT_OPEN_ITEM = 'open-item';

    public function addStatistic () {
      $statistic = new Statistic();
      $statistic->user_ip = yii::$app->request->userIP;
      $statistic->user_host = yii::$app->request->userHost;
      $statistic->path_info = yii::$app->request->pathInfo;
      $statistic->query_string = yii::$app->request->queryString;

      $statistic->save();
    }
  }
?>