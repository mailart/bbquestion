<?php

require '../core/main.php';
require './mailsender.php';
/*
/*
	SET PASSWORD FOR root@localhost=PASSWORD(' monmotdepasse ');
Ensuite il n’est pas inutile de réattribuer les droits de super utilisateur via la commande suivante :
mysql> GRANT ALL PRIVILEGES ON *.* TO root@localhost  IDENTIFIED BY ' monmotdepasse ' WITH GRANT OPTION;




http://localhost:8080/bbcomment/reply?tid=12
curl -i -H "Accept: application/json" -X PUT -d {\"uid\":1234,\"name\":\"mailart\",\"context\":\"someonehaveidea?\",\"tid\":12} http://54.69.181.122/bbqa/controllers/reply.php
*/
if (!defined('BASEPATH'))
    die("No direct script access");

/**
 *	Controller file for the "Admin Form View" which functions upon Login
 */	
class reply extends Controller {

   
    
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
        
       
          
       $reqType = $_SERVER['REQUEST_METHOD'];
		$this->data = $this->load->model('replyModel'); 	
		$this->threads = $this->load->model('threadModel'); 

		if ($reqType == 'GET'){

			$ret = $this->data->get($this->args["tid"]);
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
			var_dump($this->args);

        	$ret = $this->data->put($this->args["uid"],
      			$this->args["name"],
      			$this->args["context"],$this->args["tid"]
      			);

			if ($ret == 0){
				//$threadInfo = json_decode($this->threads->get(null, $this->args["tid"]),true);
				//$isProfessor = $this->args["isProfessor"];
				//$isAuthor = $this->args["isAuthor"];
				//$professor = $this->args["pname"];
				//$professormail = $this->args["mail2"];
				//$course = $this->args["course"];
				//$replyname = $this->args["name"];
				//$authorname = $threadInfo["name"];
				//$authoraddress = $threadInfo["email"];

				header('Access-Control-Allow-Origin: *');  
    			$this->header_status(200);
    

    			//if (!$isProfessor){
	    		//	$template = "Dear $professor:\r\n\r\nIn course $course, you received an answer from ".$this->args["replyname"].". Please log into your blackboard and check it out.";
				//	$template .= "\r\n\r\nPlease visit https://learn.humber.ca for more details.";
	    		//	sendMail($professormail,$template);
    			//}

    			//if (!$isAuthor){
	    		//	$template = "Dear $authorname:\r\n\r\nIn course $course, you received an answer from ".$this->args["replyname"].". Please log into your blackboard and check it out.";
				//	$template .= "\r\n\r\nPlease visit https://learn.humber.ca for more details.";
	    		//	sendMail($authoraddress,$template);
    			//}

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

new reply();