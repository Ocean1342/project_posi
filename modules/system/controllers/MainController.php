<?php


namespace app\modules\system\controllers;


class MainController extends AppSystemController
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}