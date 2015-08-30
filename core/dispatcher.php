<?php if(!defined('BASEPATH')) die("direct script access is not permitted");



/**
* 
* dispatches requests to the appropriate controller 
 */
class Dispatcher {
    public $segments = array();
	public $args = array();
	function __construct(){
		$data = parse_url($_SERVER['REQUEST_URI']);      
		$this->segments = explode('/',$data['path']);
		//grab the requested URL

		//restful api processing
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
		//var_dump($this->args );

	     
		//the first segment (segment[0]) is our application folder and segment[1] is the requested controller
		if(isset($this->segments[2])) 
		{

            $path="/controllers/".$this->segments[2].".php";
			include ($path);
			//var_dump($path);
			if(class_exists($this->segments[2])){
				new $this->segments[2]($this->args);
			}
			else
				echo "Not a valid page";
			//TODO: add some error handling if the class doesn't exist, i.e. 404 error or go to index
		}
	}

}