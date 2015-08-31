/*
 * 
 * Description: Blackboard qa
 * Version: 1.0
 * Last update: 4 6 2015
 * Author: Lichuan wen
 * */

document.write("<script language='javascript' src='./dep/tinymce.min.js'></script>");

var rootHost = "https://www.humber.ca/bb91help/lichuan/bbquestion/";
var template =   "In course $course, \r\n\r\nYour student $studentname asked a question according to <font style=\"color:red\">\"$keyword\"</font> in the module $module.\r\n\r\nPlease log into blackboard and open <a href=\"$url\" target=\"_blank\">here</a> to review\r\n\r\nThanks"
var template2 =  "Dear $studentname,\r\n\r\nIn course $course, $pname has answered your question about <font style=\"color:red\">\"$keyword\"</font> in the module $module.\r\n\r\nPlease log into blackboard and click <a href=\"$url\" target=\"_blank\">here</a> to read\r\n\r\nThanks";
var template3 =   "In course $course, \r\n\r\n$name posted a new reply on the question according to <font style=\"color:red\">\"$keyword\"</font> in the module $module.\r\n\r\nPlease log into blackboard and click <a href=\"$url\" target=\"_blank\">here</a> to review\r\n\r\nThanks";

var framework = '<a class="text-right btn bbqa btn-primary btn-block"><i class="fa fa-question"></i>Ask a Question</a>'+
                '<div class="askDlg">'+
                    '<span class="keyword" ></span>'+
                    '<textarea id="qkeyword"></textarea>'+
    
                    '<div class="btn btn-primary-trn pull-left askbut closequestion">'+
                         '<i class="fa "></i>'+
                        'Cancel'+
                    '</div>'+
           
                    '<div class="btn btn-primary pull-right askbut questionsubmit">Ask'+
                        '<i class="fa"></i>'+
                    '</div>'+

                    '<div style="clear:both" ></div>'+
                '</div>'+
                '<div class="topics"> '+
                    '<div class="threads">'+
                    '</div>'+
                '</div>';

var thread = '<div class="titem">'+
                '<div>'+
                    '<div class="ttitle" data-threadid="%tid%" data-keyword="%keyword%">'+
                        '<i class="fa fa-caret-down"></i>'+
                        '<span class="ttopic">Question about %keyword%</span>'+
                        '<span class="tdate">%date%</span>'+
                        '<div style="clear:both" ></div>'+
                    '</div>'+
                    '<div class="thread">'+
                        '<hr>'+
                        '<div class="theader">'+
                            '<span class="thread_author">%author%</span>'+
                        '</div>'+
                        '<div class="tcontent">'+
                            '<div class="tbody">'+
                              
                                '<span class="tkeyword" >%keyword%</span>'+
                                '<p>%content%</p>'+
                           
                            '</div>'+
                            '<div class="treplies">'+
                            '</div>'+
                        '</div>'+
                        '<hr>'+
                        '<div class="treply">'+
                        '</div>'+
                    '</div>'+

                '</div>'+
                '<hr>'+
            '</div>';




var replyitem = '<hr><div class="theader" >'+
                    '<span>%author%</span>'+
                    '<span class="tdate">%date%</span>'+
                '</div>'+
                '<div class="tbody">'+
                  
                    
                    '<p>%content%</p>'+
               
                '</div>'+
                '<hr>';



var reply =  '<textarea class="replytext"></textarea>'+
            '<div class="btn btn-primary pull-right askbut replySubmit"  data-threadid="%tid%">Reply'+
                '<i class="fa"></i>'+
            '</div>'+
            '<div style="clear:both" ></div>';
                        

$(document).ready(function() {
    var root = $(".bbqa_container");
    var elems = $(".content").find("*");
    var isTextSelectMode = false;
    var mytext;
    var userInfo = {};
    var questions;
    $('head').append('<link rel="stylesheet" href="https://www.humber.ca/bb91help/lichuan/bbquestion/brower/css/bbqa.css">');


    root.append(framework);
    if (!window.x) {
        x = {};
    }

    

    
/*
    for (var i = 0; i < elems.length; i++){
        console.log(elems.eq(i).text());

    }
  */  



    x.Selector = {};
    x.Selector.getSelected = function() {
        var t = '';
        if (window.getSelection) {
            t = window.getSelection();
        } else if (document.getSelection) {
            t = document.getSelection();
        } else if (document.selection) {
            t = document.selection.createRange().text;
        }
        return t;
    }

    function modeChange(e){
        markKeyword("");
        if (!isTextSelectMode){
            //

            root.find(".bbqa").text("Select From Content");
        }
        else
            root.find(".bbqa").text("Ask a Question");

        isTextSelectMode = !isTextSelectMode;
        root.find(".askDlg").hide();
    }
    
    function sendToUser(user, msg, callback){
        var url = "https://learn.humber.ca/webapps/blackboard/execute/displayEmail?navItem=cp_send_email_select_students&course_id="
        url += userInfo.courseid;
        if (user === userInfo.id){
            if (callback)
                callback();
            return;
        }

        $.ajax({
            url: url,
            type: 'get',
            
            success: function (a,b,c) {
                var dom = $.parseHTML(a);
                var inputs =  $(dom).find('form[name=emailForm]').find("input");
                var textarea =  $(dom).find('form[name=emailForm]').find("textarea");
                var userlist =  $(dom).find("#USERS_AVAIL").find("option");
                var selUserId = "";
                var formData = new FormData();

                 $.each(userlist,function(){
                    var name = $(this).attr("sortstring");
                    var val = $(this).val();
                    if (name === user){
                        selUserId = val;
                    }
                });

                url = "https://learn.humber.ca/webapps/blackboard/execute/sendEmail?navItem=cp_send_email_select_students&course_id=";
                url += userInfo.courseid + "&isLightbox=false";

                $.each(inputs,function(){
                    var name = $(this).attr("name");
                    var val = $(this).val();
                    if (name === "subject")
                        val = "Your have a new reply";
                    else if (name === "multiselect_right_values")
                        val = selUserId;
                    else if (name === "USERS_SELECTED")
                        val = selUserId;

                    if (name !== "top_Cancel" &&
                        name !== "top_Submit"&&
                        name !== "prependRecipientNames" &&
                        name !== "bottom_Cancel" &&
                        name &&
                        name !== "showHelperSetting")
                        formData.append(name, val);

                    if (name === "multiselect_right_values"){
                        formData.append("USERS_SELECTED", selUserId);
                    }

                    if (name === "textbox_prefix"){
                        var name = textarea.eq(0).attr("name");
                        var val = "<p>" + msg + "</p>";
                        formData.append(name, val);
                    }
                });
                

                var xhr = $.ajax({
                    type: "POST",
                    url: url,
                    headers: { 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                        'Upgrade-Insecure-Requests': '1',
                        'Referer': url,
                     },
                    processData: false,
                    contentType: false,
                    data: formData,
                    success: function (attributes, r, o) {
                    
                    },
                    error: function (xhr, errStatus, err){
                    
                    },
                    complete:function(){
                        if (callback)
                            callback();
                    }
                });


            }});
    }

    function sendToInstructors( msg,isreply){
        var url = "https://learn.humber.ca/webapps/blackboard/execute/displayEmail?navItem=cp_send_email_all_instructors&course_id="
        url += userInfo.courseid;

        $.ajax({
            url: url,
            type: 'get',
            headers: { 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                'Upgrade-Insecure-Requests': '1',
                'Referer': url,
             },
            success: function (a,b,c) {
                var dom = $.parseHTML(a);
                var inputs =  $(dom).find('form[name=emailForm]').find("input");
                var textarea =  $(dom).find('form[name=emailForm]').find("textarea");
                var formData = new FormData();
                url = "https://learn.humber.ca/webapps/blackboard/execute/sendEmail?navItem=cp_send_email_all_instructors&course_id=";
                url += userInfo.courseid + "&isLightbox=false";

                $.each(inputs,function(){
                    var name = $(this).attr("name");
                    var val = $(this).val();
                    if (name === "subject")
                        val = isreply ? "Question Updated":"You have a new question";

                    if (name !== "top_Cancel" &&
                        name !== "top_Submit"&&
                        name !== "prependRecipientNames" &&
                        name !== "bottom_Cancel" &&
                        name !== "showHelperSetting")
                        formData.append(name, val);

                    if (name === "textbox_prefix"){
                        var name = textarea.eq(0).attr("name");
                        var val = "<p>" + msg + "</p>";
                        formData.append(name, val);
                    }
                });
                

                var xhr = $.ajax({
                    type: "POST",
                    url: url,
                    processData: false,
                    headers: { 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                        'Upgrade-Insecure-Requests': '1',
                        'Referer': url,
                     },
                    contentType: false,
                    data: formData,
                    success: function (attributes, r, o) {
                    
                    },
                    error: function (xhr, errStatus, err){
                    
                    },
                    complete:function(){
                        
                    }
                });


            }});
    }

    function markKeyword( keyword){
        if (keyword > ""){
            markKeyword("");
            for (var i = 0; i < elems.length; i++){
                var html = elems.eq(i).html();
                var index = html.indexOf(keyword);
                if ( index >= 0 )
                { 
                    html = html.substring(0,index) + "<span class=\"thighlight\">" + html.substring(index,index+keyword.length) + "<input type=\"hidden\" /></span>" + html.substring(index + keyword.length);
                    elems.eq(i).html(html);
                }
            }
        }
        else{//remove
            var findtags = $(".thighlight");
            for (var i = 0; i < findtags.length; i++){
               var parent = findtags.eq(i).parent();
               var html = parent.html();
               while(html.indexOf("<span class=\"thighlight\">")!=-1)
                html = html.replace("<span class=\"thighlight\">","");
             while(html.indexOf("<input type=\"hidden\" /></span>")!=-1)
                html = html.replace("<input type=\"hidden\" /></span>","");
               parent.html(html);
            }

        }

    }

    $(".content").click(function(e){
       
        markKeyword("");
    });

    $(".closequestion").click(function(e){
       
        modeChange(e);
    });

    $(".questionsubmit").click(function(e){
        
        var pid = userInfo.moduleid;
        var content = tinyMCE.activeEditor.getContent({format : 'raw'});
        var cid = userInfo.courseid;
        var data = {"uid":parseInt(cid.replace(/_/g,"")),"name":userInfo.id,"mail":userInfo.email,"text":content,"keyword":mytext,
            "pid":pid};
        tinyMCE.activeEditor.setContent("");
        if (content == "<p><br data-mce-bogus=\"1\"></p>"){
            alert("Please enter your question.");
        }
        
        $.ajax({
            url: rootHost + "controllers/thread.php",
            type: 'post',
            dataType: 'json',
            
            complete: function (data) {
                if (data.responseText.indexOf("ok") !== -1){
                    var t = template;
                    var tid = data.responseText.replace("ok","");
                    t = t.replace("$course",userInfo.courseName);
                    t = t.replace("$keyword",mytext);
                    t = t.replace("$module",userInfo.moduleName);
                    t = t.replace("$url",userInfo.url + "&qid=" + tid);
                    t = t.replace("$studentname",userInfo.id);
                    userInfo.qid = tid;
                    modeChange(e);  
                    loadQuestions();
                    sendToInstructors(t);
                }
            },
            data: data
        });
         
        
    });


   

    $(".bbqa").click(function(e){
        modeChange(e)
    });

    $(document).ready(function() {
        $(document).bind("mouseup", function(e) {
            if (e.button === 0){
                var selectedText = x.Selector.getSelected().toString();
                if (e.target.className.indexOf("bbqa") !== -1)
                    return;
                if (selectedText.indexOf("\n") != -1){
                    alert("Highlighted content can't cross paragraphs.");
                    return;
                }
                if (isTextSelectMode && selectedText.length){
                    mytext = selectedText;
                    //var height = $(".modal-dialog").height();
                    //$('#questionDlg').modal({show:true});
                    //$(".modal-dialog").css({"top":($(window).height() - 500)/2});
                   // tinyMCE.activeEditor.setContent("");
                    root.find(".keyword").text(mytext);
                    root.find(".askDlg").show();
                    root.find(".bbqa").text("Ask a Question about");
                
                    //tinymce.activeEditor.setContent("<span class=\"keyword\" >" + mytext + "</span><br><br>");
          
                   // BootstrapDialog.show({
                    //    message: mytext
                    //});
                }
            }
        });
    });

    function filter(str){
        str = str.replace(/[\n]/g, '');
        str = str.replace(/[\r]/g, '');
        str = str.replace(/ /g, '');
        return str;
    }

    function initUserInfo(){
        userInfo = {"id":"wnlc0002","uname":"lichuan","email":"lichuan.wen1189@gmail.com"};
        $.ajax({
            url: "https://learn.humber.ca/webapps/blackboard/execute/editUser?context=self_modify",
            type: 'get',
            success: function (a,b,c) {
                var ol = a.substring(a.indexOf("stepcontent1")+1);
                var id;
                var name;
                var email;
                var dom;
                var values;
                var courseName = $(".comboLink",window.parent.document).text();
                var moduleName = $("#pageTitleText",window.parent.document).text();
                var rooturl= window.parent.document.URL;
                var mid = rooturl;
                var qid = "";
                var parenturl = rooturl;
                if (rooturl.indexOf("qid=") !== -1){
                    qid = rooturl.substring(rooturl.indexOf("qid=")+4);
                    parenturl = rooturl.substring(0,rooturl.indexOf("qid="));
                }
                rooturl = rooturl.substring(rooturl.indexOf("course_id=") + 10);
                rooturl = rooturl.substring(0,rooturl.indexOf("&"));

                mid = mid.substring(mid.indexOf("content_id=") + 12);
                mid = mid.replace("_","");
                mid = mid.substring(0,mid.indexOf("&"));

                ol = ol.substring(ol.indexOf("<ol>"));
                ol = ol.substring(0,ol.indexOf("</ol>") + 5);
                dom = $.parseHTML(ol);
                values = $(dom).find(".field");
                id = filter(values.eq(2).text()) + ", " + filter(values.eq(0).text());
                email = filter(values.eq(4).text());
                ol = a.substring(a.indexOf("stepcontent2")+1);
                ol = ol.substring(ol.indexOf("<ol>"));
                ol = ol.substring(0,ol.indexOf("</ol>") + 5);
                dom = $.parseHTML(ol);
                values = $(dom).find(".field");
                name = filter(values.eq(0).text());
                userInfo = {"id":id,"uname":name,"email":email,"courseid":rooturl,"moduleid":parseInt(mid),"courseName":courseName,"moduleName":moduleName,"url":parenturl,"qid":qid};
                loadQuestions(); 
            }});
    };

  
    function renderQuestion(){
        if (questions){
            for (var i = 0; i < questions.data.length; i++){
                var question = questions.data[i];
                var template = thread;
                var replyPanel = reply;
                var threadItem;
                var replyItem;
                var professid = $("body").data("professorid");

                replyPanel = replyPanel.replace('%tid%',question.id);
                    
                template = template.replace('%keyword%',question.keyword);
                template = template.replace('%keyword%',question.keyword);
                template = template.replace('%keyword%',question.keyword);
                template = template.replace('%date%',question.qdate);
                template = template.replace('%author%',question.name);
                template = template.replace('%content%',question.context);
                template = template.replace('%content%',question.context);
                template = template.replace('%tid%',question.id);
                threadItem = $.parseHTML(template);
                replyItem = $.parseHTML(replyPanel);

              //  if (professid === userInfo.id || userInfo.id === question.name){
                    $(threadItem).find(".treply").append(replyItem);
              //  }
                

                $('.threads').prepend(threadItem);  
                
               // alert("asdfasdf");
            }
            if (userInfo.qid > "")
                expandQuestion(userInfo.qid);
        }
    }

    function expandQuestion(qid){
        var item = $(".ttitle[data-threadid=\"" +qid +"\"");
        var keyword = item.parent().find(".ttitle").data("keyword");
        

        if (item.attr('class').indexOf("topened") !== -1){
            item.parent().find(".thread").hide();
            item.removeClass("topened");
        }
        else{
        //    $(".thread").hide();    
            markKeyword(keyword);
            item.parent().find(".thread").show();
            item.addClass("topened");
            loadReply(qid,item.parent());

        }

    }

    function loadQuestions(){
        var pid = userInfo.moduleid;
        $.ajax({
            url: rootHost + "controllers/thread.php?pid=" + pid,
            type: 'get',
            success: function (a,b,c) {
               

                questions = JSON.parse(a);
                renderQuestion();

                $(".replySubmit").click(function(e){
                    var root = $(e.target).parent().parent().parent();
                    var content = tinyMCE.activeEditor.getContent({format : 'raw'});
                    var id = $(e.target).data("threadid");
                    var mail = $("body").data("professormail");
                    var professorname = $("body").data("professorid");
                    var course = userInfo.courseName;
                    var isProfessor = (professorname === userInfo.id);
                    var author = root.find(".thread_author").text();
                    var keyword = root.find(".tkeyword").text();
                    var isAuthor = (author === userInfo.id);
                    var cid = userInfo.courseid;
                    var data = {"uid":parseInt(cid.replace(/_/g,"")),"name":userInfo.id,"context":content,"tid":id,/*"mail2":mail,"isProfessor":isProfessor,"isAuthor":isAuthor,"pname":professorname,"course":course*/};

                   if (content == "<p><br data-mce-bogus=\"1\"></p>"){
                        alert("Please enter your question.");
                    }

                     $.ajax({
                        url: rootHost + "controllers/reply.php",
                        type: 'post',
                        dataType: 'json',
                        complete: function (data) {
                            if (data.responseText.indexOf("ok") !== -1){
                                var t = template2;
                                t = t.replace("$course",userInfo.courseName);
                                t = t.replace("$keyword",keyword);
                                t = t.replace("$module",userInfo.moduleName);
                                t = t.replace("$url",userInfo.url + "&qid=" + id);
                                t = t.replace("$studentname",author);
                                t = t.replace("$pname",userInfo.id);


                                tinyMCE.activeEditor.setContent("");
                                loadReply(id,root);
                                sendToUser(author,t,function(){
                                    t = template3;
                                    t = t.replace("$course",userInfo.courseName);
                                    t = t.replace("$keyword",keyword);
                                    t = t.replace("$module",userInfo.moduleName);
                                    t = t.replace("$url",userInfo.url + "&qid=" + id);
                                    t = t.replace("$studentname",author);
                                    t = t.replace("$name",userInfo.id);
                                    sendToInstructors(t,true);
                                });
                            }
                        },
                        data: data
                    });
                });

                $(".ttitle").click(function(e){

                    var item = $(e.target);
                    var tid = item.data("threadid");
                    

                    if (e.target.className.indexOf('ttitle') === -1)
                        return;


                    e.preventDefault();
                    expandQuestion(tid);
                });

                $(".ttopic").click(function(e){
                    var item = $(e.target).parent();
                    var tid = item.data("threadid");
                    
                    if (e.target.className.indexOf('ttopic') === -1)
                        return;

                   
                    e.preventDefault();

                    expandQuestion(tid);/*
                    if (item.attr('class').indexOf("topened") !== -1){
                        item.parent().find(".thread").hide();
                        item.removeClass("topened");
                    }
                    else{
                    //    $(".thread").hide();    
                        item.parent().find(".thread").show();
                        item.addClass("topened");
                        loadReply(tid,item.parent());

                    }*/
                });

                tinymce.init({selector:'textarea',
                    theme: "modern",
                    height : 100,
                    menubar : false,
                    content_css : "../../assets/css/bbqa.css",
                    plugins: [
                         "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                         "save table contextmenu directionality emoticons template paste textcolor"
                   ]

                });
               // alert("asdfasdf");
            }
        });

    }

    function loadReply(tid,threadRoot){
        var replies = threadRoot.find(".treplies");
        
        $.ajax({
            url: rootHost + "controllers/reply.php?tid=" + tid,
            type: 'get',
            success: function (a,b,c) {
                if (a !== 'error'){
                    var objs = JSON.parse(a);
                    
                    replies.html("");
                   

                    for (var i = 0; i < objs.data.length; i++){
                        var rets = objs.data[i];
                        var template = replyitem;

                        template = template.replace('%author%',rets.name);
                        template = template.replace('%date%',rets.rdate);
                        template = template.replace('%content%',rets.context);
                        threadRoot.find('.treplies').append(template);
                 
                    }

                    //renderQuestion();
                   // alert("asdfasdf");
                }
            }
        });

    }
    initUserInfo();
    
    tinymce.init({selector:'textarea',
        theme: "modern",
        height : 100,
        menubar : false,
        plugins: [
             "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
             "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
             "save table contextmenu directionality emoticons template paste textcolor"
       ]

    });
});