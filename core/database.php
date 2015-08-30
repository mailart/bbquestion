<?php if(!defined('BASEPATH')) die("No direct script access");



/**
 * Database helper class. Database settings appear in /core/settings.ini. connect() returns a handle to a connection
 */ 
  class Database {

	//settings.ini and [Database] contains settings
	public $query = null;
	private $schema;
	private $username;
	private $password;
	private $host;
	public $dbh;
	private static $database = null;
	public function __construct($handle='database'){
		$ini_array = parse_ini_file("databases.ini",true) or die("no database.ini file found");

		if(!isset($ini_array[$handle]))
			die("no database settings defined in settings.ini");
//		foreach ($ini_array[$handle] as $key->$value)
//		{
//				$this->dbh[$key]['handle'] =

	//	}

		$this->schema = $ini_array[$handle]['schema'];
		$this->username = $ini_array[$handle]['username'];
		$this->password = $ini_array[$handle]['password'];
		$this->host = $ini_array[$handle]['host'];
		
		defined('TBL_PREFIX') or 
                   define('TBL_PREFIX',$ini_array[$handle]['prefix']);
		
	}
	
    public static function getDb($name){

            if(self::$database == null){
                self::$database = new Database($name);
                self::$database->connect();
            }
            return self::$database;
        }
        
	public function connect()
	{
		try {
		

		   $this->dbh = new PDO("mysql:host=".$this->host.";dbname=".$this->schema,

		   $this->username,$this->password);	

		} catch (PDOException $e) {
		   die("Could not connect: " . $e->getMessage());
		}
		
		if (!$this->dbh) {
			die('Could not connect: '. mysql_error());
		}
		
		return $this->dbh;
	}
	
	public function default_inserts() {
	   
	}
	
	public function create_tables() {
	
	
		
	}
}