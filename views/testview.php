<?php 

?>


<!DOCTYPE html>
<html>
    <head>  <link rel="stylesheet" type="text/css" href="<?php echo BASEURL ?>/res/css/form.css" />
      
        <title>Minimum Framework</title>
    </head>
    
    <?php

    if (isset($loginErr)){?>
        
                <script>
			$(document).ready(function () { 
                            showMsgDialog(myDialog,'Error','<?php echo $loginErr?>',1);
			});
		</script>
       
    <?php }?>
    
    <body>
        Hello world!
          
    </body>
</html>