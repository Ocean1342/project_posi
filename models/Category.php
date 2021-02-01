<?php


namespace app\models;



use yii\db\ActiveRecord;



class Category extends ActiveRecord
{
    public $title;
    public $isbn;
    public $pageCount;
    public $publishedDate;
    public $thumbnailUrl;
    public $shortDescription;
    public $longDescription;
    public $status;
    public $authors;
    public $categories;

    public function rules()
    {
        return [
            [['title', 'isbn'], 'safe']
        ];
    }
}
