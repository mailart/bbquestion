<?php
require '../core/main.php';
require './mailsender.php';
if (!defined('BASEPATH'))
    die("No direct script access");

/*
http://localhost:8080/bbcomment/thread?pid=12
 	curl -i -H "Accept: application/json" -X PUT -d {\"uid\":1234,\"name\":\"mailart\",\"text\":\"someonehaveidea?\",\"keyword\":\"test\",\"pid\":12} https://54.69.181.122/bbqa/controllers/thread.php
  */	
class thread extends Controller {

   	private $data;
    
    function __construct($parms=array()) {

        parent::__construct( $parms );

        switch($_SERVER['REQUEST_METHOD']){
			case 'GET':
				$this->args = $_GET;
				break;
			case 'POST':
				$this->args = $_POST;
				break;
			case 'DELETE':
				$content = file_get_contents("php://input");
				$this->args = json_decode($content,true);
				break;
			case 'PUT':
			//curl -i -H "Accept: application/json" -X PUT -d {\"auth\":{\"passwordCredentials\":{\"username\":\"admin\",\"password\":\"secret\"},\"tenantName\":\"customer-A\"}} http://127.0.0.1/phd-web/adddevice 
				$content = file_get_contents("php://input");
				$this->args = json_decode($content,true);
				//die($content );
				//parse_str(file_get_contents("php://input"),$this->args);
				break;
		}

        //$ini_array = parse_ini_file(BASEPATH."core/databases.ini",true) or die("model could not find databases.ini file");

		//foreach ($ini_array as $key=>$value){
		//	var_dump($key);var_dump($value);
			//$this->{$key} = $this->load->load_db($key);
		//}
		$reqType = $_SERVER['REQUEST_METHOD'];
		$this->data = $this->load->model('threadModel'); 	

		if ($reqType == 'GET'){

			$ret = $this->data->get($this->args["pid"]);
			if ($ret == 2){
				$this->header_status(400);
				header('Access-Control-Allow-Origin: *');  
				die("failed");
			}
			else{
				header('Access-Control-Allow-Origin: *');  
	      		die($ret);
	 
			}
		}
		else{


        	$ret = $this->data->put($this->args["uid"],
      			$this->args["name"],$this->args["mail"],$this->args["text"],
      			$this->args["keyword"],$this->args["pid"]
      			);

			if ($ret == 0){
				//$pname = $this->args["pname"];
				//$pmail = $this->args["mail2"];
				//$course = $this->args["course"];
				//$template =   "Dear $pname:\r\n\r\nIn course $course, your student ".$this->args["name"]." asked question that \"".$this->args["text"]."\" according to \"".$this->args["keyword"]."\" in the module.";
				//$template .= "\r\n\r\nPlease visit https://learn.humber.ca for more details.";
				header('Access-Control-Allow-Origin: *'); 
    			$this->header_status(200);
    			//sendMail($pmail,$template);
    			die("ok");
    		}
	    	else{
	    		header('Access-Control-Allow-Origin: *');  
	          $this->header_status(400);
	          die("error");
	    	}  
		}
       
    	
		
	}
	
	
}

new thread();