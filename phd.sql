http://www.lichuanwen.com/bbcomment/controllers/thread.php?pid=12

curl -i -H "Accept: application/json" -X PUT -d {\"uid\":1234,\"name\":\"mailart\",\"text\":\"someonehaveidea?\",\"keyword\":\"test\",\"pid\":12} https://54.69.181.122/bbqa/controllers/thread.php



http://www.lichuanwen.com/bbcomment/controllers/reply.php?tid=12

curl -i -H "Accept: application/json" -X PUT -d {\"uid\":1234,\"name\":\"mailart\",\"context\":\"someonehaveidea?\",\"tid\":12} http://www.lichuanwen.com/bbcomment/controllers/reply.php
