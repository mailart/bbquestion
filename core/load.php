<?php if(!defined('BASEPATH')) die("No direct script access");


/**
 * Class that contains the Loading feature
 */
class Load {
//public $db;
   function view( $file_name, $data = null ) 
   {
      if( is_array($data) ) {
         extract($data);
      }
     // var_dump(BASEPATH.'views/' . $file_name.'.php');

      include BASEPATH.'views/' . $file_name.'.php';
   }
  function load_db($handle)
  {
	 return Database::getDb($handle)->dbh;
  
  }

  function model($file_name)
  {
		
		if(isset($file_name))
		{
			include BASEPATH.'models/' . $file_name . '.php';

			if(class_exists($file_name))
				return new $file_name;	
		}	
  }
}

