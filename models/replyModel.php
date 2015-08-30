<?php



if (!defined('BASEPATH'))
    die("No direct script access");


class replyModel extends Model {

    private $dbh;

    function __construct() {
        parent::__construct();
        $this->dbh = $this->bbDb;
    }

    public function put($uid,$name,$context,$tid){

//die("asfasdfasdf");
      if($uid == null || $name == null || $context == null 
        || $tid == null 
        ){
          return 2;
      }
      
      $sql = "INSERT INTO reply (uid, name,tid, context,rdate) VALUES ($uid,'$name',$tid,'$context','".date("Y-m-d H:i:s")."')";

  
      $sth = $this->dbh->prepare($sql);
        $ret = $sth->execute();
        if (!$ret) {
            die("exec error");
        }
        return 0;//success
    }


    public function get($tid){
    $output = array();

      if($tid == null ){
          return 2;
      }
      
      $sql = "select * from reply where tid = $tid";

  
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
        $json_array['tid']=$rec['tid'];  
        $json_array['context']=$rec['context'];  
        $json_array['rdate']=$rec['rdate'];  

  
      //here pushing the values in to an array  
        array_push($output['data'] ,$json_array);  
      }


      if ($reslut != false)
          return json_encode($output);
      else
          return "error";
    }

}