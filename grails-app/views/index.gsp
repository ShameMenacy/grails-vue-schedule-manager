<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:javascript src="spring-websocket"/>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Infomation</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-user-circle fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">${userCount}</div>
                        <div>Total User!</div>
                    </div>
                </div>
            </div>
            <a href="/sm/user">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-green">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-eercast fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">${taskCount}</div>
                        <div>Total Tasks!</div>
                    </div>
                </div>
            </div>
            <a href="/sm/task">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-yellow">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-bandcamp fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">${projectCount}</div>
                        <div>Total Project!</div>
                    </div>
                </div>
            </div>
            <a href="/sm/project">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-support fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">${resourceCount}</div>
                        <div>Total Resource!</div>
                    </div>
                </div>
            </div>
            <a href="/sm/resource">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <ul class="timeline">
                    <li>
                        <div class="timeline-badge"><i class="fa fa-check"></i>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                <p>
                                    <small class="text-muted"><i class="fa fa-clock-o"></i> 11 hours ago via Twitter
                                    </small>
                                </p>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero laboriosam dolor
                                    perspiciatis omnis exercitationem. Beatae, officia pariatur? Est cum veniam
                                    excepturi. Maiores praesentium, porro voluptas suscipit facere rem dicta,
                                    debitis.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem dolorem quibusdam,
                                    tenetur commodi provident cumque magni voluptatem libero, quis rerum. Fugiat esse
                                    debitis optio, tempore. Animi officiis alias, officia repellendus.</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium maiores odit qui
                                    est tempora eos, nostrum provident explicabo dignissimos debitis vel! Adipisci eius
                                    voluptates, ad aut recusandae minus eaque facere.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-badge danger"><i class="fa fa-bomb"></i>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus numquam facilis
                                    enim eaque, tenetur nam id qui vel velit similique nihil iure molestias aliquam,
                                    voluptatem totam quaerat, magni commodi quisquam.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates est quaerat
                                    asperiores sapiente, eligendi, nihil. Itaque quos, alias sapiente rerum quas odit!
                                    Aperiam officiis quidem delectus libero, omnis ut debitis!</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-badge info"><i class="fa fa-save"></i>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis minus modi quam ipsum
                                    alias at est molestiae excepturi delectus nesciunt, quibusdam debitis amet, beatae
                                    consequuntur impedit nulla qui! Laborum, atque.</p>
                                <hr>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-sm dropdown-toggle"
                                            data-toggle="dropdown">
                                        <i class="fa fa-gear"></i> <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi fuga odio quibusdam.
                                    Iure expedita, incidunt unde quis nam! Quod, quisquam. Officia quam qui adipisci
                                    quas consequuntur nostrum sequi. Consequuntur, commodi.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-badge success"><i class="fa fa-graduation-cap"></i>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Lorem ipsum dolor</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat
                                    tempore officia voluptas debitis consectetur culpa amet, accusamus dolorum fugiat,
                                    animi dicta aperiam, enim incidunt quisquam maxime neque eaque.</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-8 -->
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bell fa-fw"></i> Notifications Panel
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                    </a>
                </div>
                <!-- /.list-group -->
                <a href="#" class="btn btn-default btn-block">View All Alerts</a>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
        <div class="chat-panel panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> Chat
                <div class="btn-group pull-right">
                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-chevron-down"></i>
                    </button>
                    <ul class="dropdown-menu slidedown">
                        <li>
                            <a href="#" onclick="makeChatAvailable();return false;">
                                <i class="fa fa-check-circle fa-fw"></i> Available
                            </a>
                        </li>
                        <li>
                            <a href="#" onclick="makeChatClean();return false;">
                                <i class="fa fa-times fa-fw"></i> Clean
                            </a>
                        </li>
                        <li>
                            <a href="#" onclick="makeChatMute();return false;">
                                <i class="fa fa-clock-o fa-fw"></i> Mute
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" onclick="makeChatSignOut();return false;">
                                <i class="fa fa-sign-out fa-fw"></i> Sign Out
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body" id="chat-panel">
                <ul class="chat" id="chat-body">
                </ul>
            </div>
            <!-- /.panel-body -->
            <div class="panel-footer" id="chat">
                <div class="input-group">
                    <g:field id="message" name="message" type="text" class="form-control input-sm"
                             placeholder="Type your message here..."
                             onkeydown="if (event.keyCode == 13) sendMessage()"/>
                    <span class="input-group-btn">
                    <g:field type="button" name="btn-chat" id="btn-chat" class="btn btn-warning btn-sm" value="Send"
                             onclick="sendMessage()"/>
                    </span>
                </div>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script type="text/javascript">
    $(document).ready(function(){
        $('#btn-chat').attr('disabled',true);
        $('#message').keyup(function(){
            if($(this).val().length !=0)
                $('#btn-chat').attr('disabled', false);
            else
                $('#btn-chat').attr('disabled',true);
        })
    });

    var socket = new SockJS("${createLink(uri: '/stomp')}");
    var client = Stomp.over(socket);

    function sendMessage() {
        if($('#message').val().length != 0) {
            var messMap = new Map();
            messMap.set('messageId', $('#userId').val());
            messMap.set('messSender', $('#userName').val());
            messMap.set('messContent', $('#message').val());
            client.send("/app/chat", {}, JSON.stringify([...messMap]));
            refreshChat();
        }
    }

    client.connect({}, function() {
        client.subscribe("/topic/chat", function(message) {
            var receiptMess = new Map(JSON.parse(message.body));
            appendMessage(receiptMess);
            loadFinalMess();
        });
    });

    function appendMessage(message) {
        var align =  ($('#userId').val() == message.get('messageId') ? "right" : "left");
        var avatar =  ($('#userId').val() == message.get('messageId') ? "http://placehold.it/50/55C1E7/fff" : "http://placehold.it/50/FA6F57/fff");
        $('#chat-body').append("<li class='" + align + " clearfix'><span class='chat-img pull-" + align + "'> <img src='" + avatar + "' alt='User Avatar' class='img-circle'/> </span> <div class='chat-body clearfix'> <div class='header'> <small class=' text-muted'> <i class='fa fa-clock-o fa-fw'></i> " + new Date().toLocaleString() + " </small> <strong class='pull-" + align + " primary-font'>" + message.get('messSender') + "</strong> </div> <p> " + message.get('messContent') + " </p> </div></li>");
        $('#chat-body').scrollTop = 0;
    }

    function refreshChat() {
        document.getElementById('btn-chat').disabled  = false;
        var mess = document.getElementById("message");
        mess.readOnly = false;
        mess.value = '';
        mess.focus();
        loadFinalMess();
    }

    function loadFinalMess() {
        $('#chat-panel').animate({
        scrollTop: $('#chat-panel')[0].scrollHeight}, 500);
    }

    function makeChatAvailable() {
        $("#chat-panel").show();
        $("#chat").show();
        loadFinalMess();
        refreshChat();
    }

    function makeChatClean() {
        document.getElementById('chat-body').innerHTML = "";
        refreshChat();
    }

    function makeChatMute() {
        document.getElementById('message').readOnly = true;
        document.getElementById('btn-chat').disabled = true;
        loadFinalMess();
    }

    function makeChatSignOut() {
        $("#chat-panel").hide();
        $("#chat").hide();
    }
</script>
</body>
</html>
