<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<?php
// echo \Yii::$app->getSecurity()->generatePasswordHash('admin');
?>
<div class="login-box">
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <?php $form = ActiveForm::begin(); ?>
            <?= $form->field($model, 'username',
                ['template' => '        
                    <div class="input-group mb-3">
                      {input}
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-envelope"></span>
                        </div>
                      </div>
                    </div>
                    {error}',])
                ->textInput(['placeholder' => 'Login']) ?>


                <?= $form->field($model, 'password', [
                    'template' => '        
                        <div class="input-group mb-3">
                          {input}
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <span class="fas fa-lock"></span>
                            </div>
                          </div>
                        </div>
                        {error}',
                    //'class' =>'form-control'
                ])->passwordInput(['placeholder' => 'Password']) ?>



            <div class="row">
                <div class="col-8">
                    <div class="icheck-primary">
                        <?= $form->field($model, 'rememberMe')->checkbox([
                            'template' => "{label} {input}"
                        ]) ?>
                    </div>
                </div>
                <div class="col-4">
                    <?= Html::submitButton('Login', ['class' => 'btn btn-primary btn-block', 'name' => 'login-button']) ?>
                </div>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>