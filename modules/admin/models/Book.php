<?php
namespace app\modules\admin\models;

class Book extends \app\models\Book
{
/*    public static function tableName()
    {
        return 'book';
    }*/
    public $imageFile;
    public function rules()
    {
        return [
            ['isbn','unique'],
            [['title','longDescription','status','shortDescription'],'string'],
//            [['thumbnailUrl'], 'filter', 'filter' =>[$this,'thumbnailUrl']],
            [['imageFile'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg'],
            [['id','pageCount'],'integer'],
            ['publishedDate','filter','filter'=>[$this,'publishedDate']],
            [['authors','categories'],'string',],
//            [['categories'],'filter', 'filter' => [$this,'categories']]
        ];
    }

    public function publishedDate($val){
        $date = new \DateTime();
        return $date->format('c');
    }


/*    public function upload()
    {
        if ($this->validate()) {
            $this->imageFile->saveAs($this->imageFile->baseName . '.' . $this->imageFile->extension);
            return true;
        } else {
            return false;
        }
    }*/
    public function upload()
    {
/*        var_dump($this);
        die('test');*/
        if ($this->validate()) {
//
/*            var_dump($this);
            die();*/
            $fileName = $this->imageFile->baseName . '.' . $this->imageFile->extension;
            $this->imageFile->saveAs('@webroot/uploads/' . $fileName);
//            $this->imageFile->saveAs($fileName);
            echo __DIR__;
            $this->thumbnailUrl = $fileName;
            $this->imageFile = null;
//            $this->save();
            return $fileName;
        } else {
            return false;
        }
    }

/*
 *
 *
 *
 *     public function categories($value){
        if (empty($value)) {
            $str = 'New';
        }else{
            $str = implode(',', $value);
        }
        return $str;
    }


    public function thumbnailUrl($imgUrl)
    {
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
    }*/
}