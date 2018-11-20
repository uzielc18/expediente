<?php
/**
 * KumbiaPHP web & app Framework.
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://wiki.kumbiaphp.com/Licencia
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@kumbiaphp.com so we can send you a copy immediately.
 *
 * @copyright  Copyright (c) 2005 - 2018 KumbiaPHP Team (http://www.kumbiaphp.com)
 * @license    http://wiki.kumbiaphp.com/Licencia     New BSD License
 */

/**
 * Helper para crear Formularios de un modelo automáticamente.
 *
 * @category   Helpers
 */
class ModelFilter
{
    /**
     * Genera un form de un modelo (objeto) automáticamente.
     *
     * @param object $model
     * @param string $action
     */
    public static function create($model, $action = '')
    {
        $model_name = Util::smallcase(get_class($model));
        if (!$action) {
            $action = ltrim(Router::get('route'), '/');
        }

        echo '<form action="', PUBLIC_PATH.$action, '" method="post" id="', $model_name, '" class="form-horizontal">' , PHP_EOL;
        $pk = $model->primary_key[0];
        $fields = array_diff($model->fields, $model->_at, $model->_in, $model->primary_key);

        foreach ($fields as $field) {
            $tipo = trim(preg_replace('/(\(.*\))/', '', $model->_data_type[$field])); //TODO: recoger tamaño y otros valores
            $alias = $model->get_alias($field);
            $formId = $model_name.'_'.$field;
            $formName = $model_name.'['.$field.']';
            echo '<div class="form-group">';
            if (in_array($field, $model->not_null)) {
                echo "<label for=\"$formId\" class=\"required col-sm-2 control-label\">$alias *</label>" , PHP_EOL;
            } else {
                echo "<label for=\"$formId\" class=\" col-sm-2 control-label\">$alias</label>" , PHP_EOL;
            }
            echo '<div class="col-sm-8">';
            switch ($tipo) {
                case 'tinyint': case 'smallint': case 'mediumint':
                case 'integer': case 'int': case 'bigint':
                case 'float': case 'double': case 'precision':
                case 'real': case 'decimal': case 'numeric':
                case 'year': case 'day': case 'int unsigned': // Números

                    if (strripos($field, '_id', -3)) {
                        echo Form::dbSelect($model_name.'.'.$field, null, null, 'Seleccione', 'class="form-control"', $model->$field);
                        break;
                    } 

                    // no break
                case 'date': // Usar el js de datetime
                    echo "<input id=\"$formId\" type=\"date\" name=\"$formName\" value=\"{$model->$field}\" class=\"form-control\">" , PHP_EOL;
                    break;

                case 'datetime': case 'timestamp':
                    echo "<input id=\"$formId\" type=\"datetime\" name=\"$formName\" value=\"{$model->$field}\" class=\"form-control\">" , PHP_EOL;
                    break;


                default: //text,tinytext,varchar, char,etc se comprobara su tamaño
            }
            echo "</div>", PHP_EOL;
            echo "</div>", PHP_EOL;
        }
        echo '<input type="submit" value="Filtrar" />' , PHP_EOL;
        echo '</form>' , PHP_EOL;
    }
}
