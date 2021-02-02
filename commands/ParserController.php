<?php


namespace app\commands;
use app\models\Book;
use yii\console\Controller;
use yii\console\ExitCode;

class ParserController extends Controller
{
    protected $en = "\n";
    /*
     * Необходимо реализовать:

    Через консоль - парсинг книг, категорий из источника.
    Изображения к книгам должны быть загружены на сервер.
    При повторном парсинге элементы не должны дублироваться(если появятся новые книги, то парсер их должен добавить).
    Если у товара нет категории, добавлять товар в категорию Новинки
     *
     * */

    protected $dataUrl = 'https://gitlab.com/prog-positron/test-app-vacancy/-/raw/master/books.json';

    public function actionIndex()
    {
//        echo \Yii::getAlias('@app');
//        return;
        $data = $this->baseGenerator();
        $i = 0;
        foreach ($data as $k => $v) {
//            if ($i > 100) break;
            $book = new Book();
            $book->attributes = $v;
//            $this->saveImg($v['thumbnailUrl'],$book);
/*            if ($book->save())
                echo $i, " book loading {$this->en}";
            else
                echo $i, " book exists (isbn - ".$v['isbn']." ) {$this->en}";*/
            try{
                $book->save();
                echo $i, " book loading {$this->en}";
            } catch (\Exception $e){
                echo $i, " book exists (isbn - ".$v['isbn']." ) {$this->en}";
            }
            $i++;
        }

        return 0;

    }

    protected function baseGenerator() {
        $base = json_decode(file_get_contents($this->dataUrl), TRUE);
        echo 'count books = ', count($base), $this->en;
        for ($i=0; $i <count($base) ; $i++) {
            yield $base[$i];
        }
    }

    public function setDataUrl($url)
    {
        if ($url != '') $this->dataUrl = $url;
        else return 'url is empty';
    }

    public function actionClear()
    {
        Book::deleteAll();
    }
    //

}