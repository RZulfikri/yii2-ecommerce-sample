<?php

namespace frontend\controllers;

use Yii;
use app\models\Item;
use frontend\models\itemSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Statistic;
use yii\data\Pagination;
use app\models\ItemCategory;
use app\models\Order;
use app\models\OrderItem;
use app\models\Customer;

/**
 * ItemController implements the CRUD actions for Item model.
 */
class ItemController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Item models.
     * @return mixed
     */
    public function actionIndex()
    {
        $get = Yii::$app->request->get();
        if(isset($get['categ'])) {
            $itemList = Item::find()->with('category')->where(['id_category' => $get['categ']]);
        } else {
            $itemList = Item::find()->with('category');
        }
        
        $countQery = clone $itemList;
        $categoryList = ItemCategory::find()->all();
        $pages = new Pagination(['totalCount' => $countQery->count(), 'pageSize' => 3]);
        $ItemList2 = $itemList->offset($pages->offset)->limit($pages->limit)->orderBy(['name' => SORT_DESC])->all();
        /** Perintah dibawah digunakan untuk menyimpan data melalui model yagn sudah dibuat
         * 
         * $app->request digunakan untuk mengampil request yang dilakukan user.
         */
        // $statistic = new Statistic();
        // $statistic->user_ip = yii::$app->request->userIP;
        // $statistic->user_host = yii::$app->request->userHost;
        // $statistic->path_info = yii::$app->request->pathInfo;
        // $statistic->query_string = yii::$app->request->queryString;

        // $statistic->save();

        /** ini method untuk memanggul event yang tadi sudah didaftarkan pada config */
        Yii::$app->statistic->trigger(\app\components\StatisticComponent::EVENT_OPEN_ITEM);

        return $this->render('index', [
            'itemList' => $ItemList2,
            'pages' => $pages,
            'categoryList' => $categoryList,
        ]);
    }

    /**
     * Displays a single Item model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        /** Perintah dibawah digunakan untuk menyimpan data melalui model yagn sudah dibuat
         * 
         * $app->request digunakan untuk mengampil request yang dilakukan user.
         */
        // $statistic = new Statistic();
        // $statistic->user_ip = yii::$app->request->userIP;
        // $statistic->user_host = yii::$app->request->userHost;
        // $statistic->path_info = yii::$app->request->pathInfo;
        // $statistic->query_string = yii::$app->request->queryString;

        // $statistic->save();

        /** ini method untuk memanggul event yang tadi sudah didaftarkan pada config */
        Yii::$app->statistic->trigger(\app\components\StatisticComponent::EVENT_OPEN_ITEM);

        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    public function actionBeli($id) {
        
        if (Yii::$app->user->isGuest) {
            echo "<script>
                window.alert('Silahkan Login');
                window.location.href='../site/login';
            </script>";
        } else {
            $order = new Order();
            $customer = Customer::find()->where(['user_id' => Yii::$app->user->id])->one();
            $order->customer_id = $customer->id;
            if ($order->save()) {
                
                $orderItem = new OrderItem();
                $orderItem->order_id = $order->id;
                $orderItem->item_id = $id;

                if ($orderItem->save()) {
                    echo "<script>
                        window.alert('Pembelian Berhasil');
                        window.location.href='index';
                    </script>";
                } else {
                    echo "<script>
                        window.alert('Pembelian Gagal');
                        window.location.href='../site/login';
                    </script>";
                }
            } else {
                echo "<script>
                    window.alert('Pembelian Gagal');
                    window.location.href='../site/login';
                </script>";
            }
        }
    }

    /**
     * Creates a new Item model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Item();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Item model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Item model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Item model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Item the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Item::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
