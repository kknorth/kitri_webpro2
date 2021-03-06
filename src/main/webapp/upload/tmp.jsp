<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />

<style type='text/css'>
#playlist,audio{ width:400px; padding:0px; }
.active a{ color:#5DB0E6;text-decoration:none; }
span a{ color:#eeeedd;background:#333;padding:5px;display:block; cursor:pointer }
span a:hover{ text-decoration:none; }
</style>

<script type='text/javascript' src='http://code.jquery.com/jquery-1.7.js'></script>

<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
var audio;
var playlist;
var tracks;
var current;
init();

function init(){
    current = 0;
    audio = $('audio');
    playlist = $('#playlist');
    tracks = playlist.find('span a');
    len = tracks.length - 0;   
    audio[0].volume = 1.0;
    playlist.find('a').click(function(e){
        e.preventDefault();
        link = $(this);
        current = link.parent().index();
        run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
        current++;
        if(current == len){
            current = 0;
            link = playlist.find('a')[0];
        }else{
            link = playlist.find('a')[current];    
        }
        run($(link),audio[0]);
    });

}
function run(link, player){
        player.src = link.attr('href');
        par = link.parent();
        par.addClass('active').siblings().removeClass('active');
        audio[0].load();
        audio[0].play();	
}
});//]]>  
</script>

</head>
<body>

<audio id="audio" preload="auto" tabindex="0" controls="" autoplay="">
<source type="audio/mp3" src="1번곡주소.mp3">
지원하지 않는 브라우저 입니다.
</audio>

<div id="playlist">
<span class="active"><a href="1번곡주소.mp3">1번곡</a></span>
<span><a href="2번곡주소.mp3">2번곡</a></span>
<span><a href="3번곡주소.mp3">3번곡</a></span>
</div>
</body>
</html>