<?php



if (!defined('BASEPATH'))
    die("No direct script access");

//NOTE: sc.events.pmpID = pmp_app.ID -> pmp_app.pmpID (actual pmpID)
/**
 * Model for forms that does CRUD for candidate forms
 * Linked to FormPanel contoroller
 */
class threadModel extends Model {

    private $dbh;

    function __construct() {

        parent::__construct();
        $this->dbh = $this->bbDb;
    }

    public function put($uid,$name,$mail,$text,$keyword,$pid){

      if($uid == null || $name == null || $text == null 
      	|| $keyword == null 
      	|| $pid == null  ){
          return 2;
      }
      
        $sql = "INSERT INTO highlight (uid, name,email, context,keyword,pageid,qdate) VALUES ($uid,'$name','$mail','$text','$keyword','$pid','".date("Y-m-d H:i:s")."')";

     	$sth = $this->dbh->prepare($sql);
      $ret = $sth->execute();
      if (!$ret) {
      	//var_dump($this->dbh->errorInfo ());
        die("exec error");
      }
      else
      {
        $id = $this->dbh->lastInsertId();
        echo($id);
      }
      return 0;//success
    }


    public function get($pid, $tid){
 		$output = array();

      if($pid == null && $tid == null){
          return 2;
      }
      
      $sql = "select * from highlight where ";
      $where = "";

      if ($pid){
        $where = " pageid = '$pid' and";
      }

      if ($tid != null){
        $where = " id = $tid and";
      }
  
      $where = substr($where,0,strlen($where)-4);


      $sql.=$where;

      $sth = $this->dbh->prepare($sql);
      $sth->execute();
      $reslut = $sth->fetchAll();
      $output['total'] = sizeof($reslut);
      $output['data'] = array();
      foreach($reslut as $rec)//foreach loop  
      {  
        $json_array['id']=$rec['id'];  
        $json_array['uid']=$rec['uid'];  
        $json_array['name']=$rec['name'];  
        $json_array['email']=$rec['email'];  
        $json_array['context']=$rec['context'];  
        $json_array['qdate']=$rec['qdate'];  
        $json_array['pageid']=$rec['pageid'];  
        $json_array['keyword']=$rec['keyword'];  

  
      //here pushing the values in to an array  
        array_push($output['data'] ,$json_array);  
      }


      if ($reslut != false)
          return json_encode($output);
      else
          return "error";
    }
}