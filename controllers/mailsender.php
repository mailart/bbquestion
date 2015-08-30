<?php
/**
* Simple example script using PHPMailer with exceptions enabled
* @package phpmailer
* @version $Id$
*/

        

require_once './pmsend/class.phpmailer.php';

function sendMail($addr,$content) {
              //  $mail = new PHPMailer(true); //New instance, with exceptions enabled

		
        $mail=new PHPMailer(true);

      //  $body             = file_get_contents('contents.html');
      //  $body             = preg_replace('/\\\\/','', $body); //Strip backslashes
       
        try {
            $mail->IsSMTP();                           // tell the class to use SMTP
            $mail->Username="lichuan.wen1189@gmail.com";
            $mail->Password= "all4oneQ";
            $mail->SMTPAuth =true; 
            $mail->Host= ("smtp.gmail.com");
            $mail->Port= (587);
            $mail->SMTPSecure= ("tls");
			
			
            $mail->SetFrom("lichuan.wen1189@gmail.com");
			$mail->AddAddress($addr);
		
            $mail->AltBody = $content; // optional - MsgHTML will create an alternate automatically
            
            $mail->MsgHTML(str_replace("\r\n","<br>",$content));

	
            //$mail->Body    = $content; // optional, comment out and test
				
			$mail->Subject  = "Course Question";
				
			$mail->SMTPDebug  = 1; 

            $mail->Send();
           // die ('Message has been sent.');
			

                
        } catch (phpmailerException $e) {
                die ($e->errorMessage());
        }
      
       //     fclose($handle);

}

 
?>