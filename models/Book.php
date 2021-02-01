<?php


namespace app\models;


use yii\db\ActiveRecord;
use yii\helpers\Url;
use function foo\func;

class Book extends ActiveRecord
{
    public static function tableName()
    {
        return "book";
    }
    public function rules()
    {
        return [
            ['isbn','unique'],
            [['title','longDescription','status','shortDescription'],'string'],
            [['thumbnailUrl'], 'filter', 'filter' => function($imgUrl){
                if (strlen($imgUrl) == 0) return 'no-image.jpg';

                $imgUrlParse = parse_url($imgUrl);
                $urlImg = explode('/',$imgUrlParse['path']);
                $imgName = $urlImg[count($urlImg)-1];
                $serverPath = \Yii::getAlias('@app').\Yii::getAlias('@uploads').'/'.$imgName;
                if (file_exists($serverPath) ) return $imgName;
                try{
                    $file  = file_get_contents($imgUrl);
                } catch (\Exception $e) {
                    //если доступ заблокирован, то сохраним ссылку на картнику
                    echo $e->getMessage();
                    return 'no-image.jpg';
                }
                file_put_contents($serverPath, $file);
                return $imgName;
            }],
            ['pageCount','integer'],
            ['publishedDate','filter','filter'=>function($val){
                $date = new \DateTime($val['$date']);
                return $date->format('c');

            }],
            [['authors'],'filter', 'filter' => function($value){
                $str = implode(',', $value);
                return $str;
            }],
            [['categories'],'filter', 'filter' => function($value){
                if (empty($value)) {
                    $str = 'New';
                }else{
                    $str = implode(',', $value);
                }
                return $str;
            }]
        ];
    }

    public function upload($path)
    {
        $file = file_get_contents($path);
        print_r($file);
        /*        if ($this->validate()) {
                    $this->imageFile->saveAs('upload/' . $this->imageFile->baseName . '.' . $this->imageFile->extension);
                    return true;
                } else {
                    return false;
                }*/
    }

}