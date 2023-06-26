<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<title>Lunch Wheel</title>
<style>
   input{
      display: none;
   }
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="jquery.tinysort.min.js"></script>
<!--[if IE]><script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jit/2.0.2/Extras/excanvas.min.js"></script><![endif]-->
<script type="text/javascript">
// Helpers
   shuffle = function(o) {
      for ( var j, x, i = o.length; i; j = parseInt(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x)
         ;
      return o;
   };

   String.prototype.hashCode = function(){
      // See http://www.cse.yorku.ca/~oz/hash.html      
      var hash = 5381;
      for (i = 0; i < this.length; i++) {
         char = this.charCodeAt(i);
         hash = ((hash<<5)+hash) + char;
         hash = hash & hash; // Convert to 32bit integer
      }
      return hash;
   }

   Number.prototype.mod = function(n) {
      return ((this%n)+n)%n;
   }
</script>
<script type="text/javascript">
venues = {
      "116208"  : "벽돌폰",
      "66271"   : "샤오미폰",
      "5518"    : "지금은 망한 LG폰 베가",
      "392360"  : "갤럭시",
      "2210952" : "아이폰",
      "207306"  : "택시 무료 이용권",
      "41457"   : "랜트카 1일 무료 이용권",
      "101161"  : "애견 카페 커피 1잔 무료권",
      "257424"  : "애견 사료 1kg",
      "512060"  : "애견 장난감",
      //"66244"   : "California Tortilla",
      //"352867"  : "Pho 75 - Rosslyn",
      //"22493"   : "Ragtime",
      //"268052"  : "Subway",
      //"5665"    : "Summers Restaurant & Sports Bar",
      //"129724"  : "Cosi",
      //"42599"   : "Ray's Hell Burger"
   };

   $(function() {

      var venueContainer = $('#venues ul');
      $.each(venues, function(key, item) {
         venueContainer.append(
              $(document.createElement("li"))
              .append(
                   $(document.createElement("input")).attr({
                         id:    'venue-' + key
                        ,name:  item
                        ,value: item
                        ,type:  'checkbox'
                        ,checked:true
                   })
                   .change( function() {
                   //   var cbox = $(this)[0];
                      //var segments = wheel.segments;
                   //   var i = segments.indexOf(cbox.value);

                      //if (cbox.checked && i == -1) {
                      //   segments.push(cbox.value);

                      //} else if ( !cbox.checked && i != -1 ) {
                   //      segments.splice(i, 1);
                   //   }

                      //segments.sort();
                      //wheel.update();
                   } )

              )//.append(
                //   $(document.createElement('label')).attr({
                 //      'for':  'venue-' + key
                 //  })
                 //  .text( item )
             // )
          )
      });

      $('#venues ul>li').tsort("input", {attr: "value"});
   });
</script>
<script type="text/javascript">
// WHEEL!
   var wheel = {

      timerHandle : 0,
      timerDelay : 33,

      angleCurrent : 0,
      angleDelta : 0,

      size : 290,

      canvasContext : null,

      colors : [ '#ffff00', '#ffc700', '#ff9100', '#ff6301', '#ff0000', '#c6037e',
                 '#713697', '#444ea1', '#2772b2', '#0297ba', '#008e5b', '#8ac819' ],

      //segments : [ 'Andrew', 'Bob', 'Fred', 'John', 'China', 'Steve', 'Jim', 'Sally', 'Andrew', 'Bob', 'Fred', 'John', 'China', 'Steve', 'Jim'],
      segments : [],

      seg_colors : [], // Cache of segments to colors
      
      maxSpeed : Math.PI / 16,

      upTime : 1000, // How long to spin up for (in ms)
      downTime : 17000, // How long to slow down for (in ms)

      spinStart : 0,

      frames : 0,

      centerX : 300,
      centerY : 300,

      spin : function() {

         // Start the wheel only if it's not already spinning
         if (wheel.timerHandle == 0) {
            wheel.spinStart = new Date().getTime();
            wheel.maxSpeed = Math.PI / (16 + Math.random()); // Randomly vary how hard the spin is
            wheel.frames = 0;
            wheel.sound.play();

            wheel.timerHandle = setInterval(wheel.onTimerTick, wheel.timerDelay);
         }
      },

      onTimerTick : function() {

         wheel.frames++;

         wheel.draw();

         var duration = (new Date().getTime() - wheel.spinStart);
         var progress = 0;
         var finished = false;

         if (duration < wheel.upTime) {
            progress = duration / wheel.upTime;
            wheel.angleDelta = wheel.maxSpeed
                  * Math.sin(progress * Math.PI / 2);
         } else {
            progress = duration / wheel.downTime;
            wheel.angleDelta = wheel.maxSpeed
                  * Math.sin(progress * Math.PI / 2 + Math.PI / 2);
            if (progress >= 1)
               finished = true;
         }

         wheel.angleCurrent += wheel.angleDelta;
         while (wheel.angleCurrent >= Math.PI * 2)
            // Keep the angle in a reasonable range
            wheel.angleCurrent -= Math.PI * 2;

         if (finished) {
            clearInterval(wheel.timerHandle);
            wheel.timerHandle = 0;
            wheel.angleDelta = 0;

            $("#counter").html((wheel.frames / duration * 1000) + " FPS");
         }

         /*
         // Display RPM
         var rpm = (wheel.angleDelta * (1000 / wheel.timerDelay) * 60) / (Math.PI * 2);
         $("#counter").html( Math.round(rpm) + " RPM" );
          */
      },

      init : function(optionList) {
         try {
            wheel.initWheel();
            wheel.initAudio();
            wheel.initCanvas();
            wheel.draw();

            $.extend(wheel, optionList);

         } catch (exceptionData) {
            alert('Wheel is not loaded ' + exceptionData);
         }

      },

      initAudio : function() {
         var sound = document.createElement('audio');
         sound.setAttribute('src', 'wheel.mp3');
         wheel.sound = sound;
      },

      initCanvas : function() {
         var canvas = $('#wheel #canvas').get(0);

         if ($.browser.msie) {
            canvas = document.createElement('canvas');
            $(canvas).attr('width', 1000).attr('height', 600).attr('id', 'canvas').appendTo('.wheel');
            canvas = G_vmlCanvasManager.initElement(canvas);
         }
         canvas.addEventListener("click", wheel.spin, false);
         wheel.canvasContext = canvas.getContext("2d");
      },

      initWheel : function() {
         shuffle(wheel.colors);

      },

      // Called when segments have changed
      update : function() {
         // Ensure we start mid way on a item
         //var r = Math.floor(Math.random() * wheel.segments.length);
         var r = 0;
         wheel.angleCurrent = ((r + 0.5) / wheel.segments.length) * Math.PI * 2;

         var segments = wheel.segments;
         var len      = segments.length;
         var colors   = wheel.colors;
         var colorLen = colors.length;

         // Generate a color cache (so we have consistant coloring)
         var seg_color = new Array();
         for (var i = 0; i < len; i++)
            seg_color.push( colors [ segments[i].hashCode().mod(colorLen) ] );

         wheel.seg_color = seg_color;

         wheel.draw();
      },

      draw : function() {
         wheel.clear();
         wheel.drawWheel();
         wheel.drawNeedle();
      },

      clear : function() {
         var ctx = wheel.canvasContext;
         ctx.clearRect(0, 0, 1000, 800);
      },

      drawNeedle : function() {
         var ctx = wheel.canvasContext;
         var centerX = wheel.centerX;
         var centerY = wheel.centerY;
         var size = wheel.size;

         ctx.lineWidth = 1;
         ctx.strokeStyle = '#000000';
         ctx.fileStyle = '#ffffff';

         ctx.beginPath();

         ctx.moveTo(centerX + size - 40, centerY);
         ctx.lineTo(centerX + size + 20, centerY - 10);
         ctx.lineTo(centerX + size + 20, centerY + 10);
         ctx.closePath();

         ctx.stroke();
         ctx.fill();

         // Which segment is being pointed to?
         var i = wheel.segments.length - Math.floor((wheel.angleCurrent / (Math.PI * 2))   * wheel.segments.length) - 1;

         // Now draw the winning name
         ctx.textAlign = "left";
         ctx.textBaseline = "middle";
         ctx.fillStyle = '#000000';
         ctx.font = "2em Arial";
         ctx.fillText(wheel.segments[i], centerX + size + 25, centerY);
         
      },

      drawSegment : function(key, lastAngle, angle) {
         var ctx = wheel.canvasContext;
         var centerX = wheel.centerX;
         var centerY = wheel.centerY;
         var size = wheel.size;

         var segments = wheel.segments;
         var len = wheel.segments.length;
         var colors = wheel.seg_color;

         var value = segments[key];
         
         ctx.save();
         ctx.beginPath();

         // Start in the centre
         ctx.moveTo(centerX, centerY);
         ctx.arc(centerX, centerY, size, lastAngle, angle, false); // Draw a arc around the edge
         ctx.lineTo(centerX, centerY); // Now draw a line back to the centre

         // Clip anything that follows to this area
         //ctx.clip(); // It would be best to clip, but we can double performance without it
         ctx.closePath();

         ctx.fillStyle = colors[key];
         ctx.fill();
         ctx.stroke();

         // Now draw the text
         ctx.save(); // The save ensures this works on Android devices
         ctx.translate(centerX, centerY);
         ctx.rotate((lastAngle + angle) / 2);

         ctx.fillStyle = '#000000';
         ctx.fillText(value.substr(0, 20), size / 2 + 20, 0);
         ctx.restore();

         ctx.restore();

      },

      drawWheel : function() {
         var ctx = wheel.canvasContext;

         var angleCurrent = wheel.angleCurrent;
         var lastAngle    = angleCurrent;

         var segments  = wheel.segments;
         var len       = wheel.segments.length;
         var colors    = wheel.colors;
         var colorsLen = wheel.colors.length;

         var centerX = wheel.centerX;
         var centerY = wheel.centerY;
         var size    = wheel.size;

         var PI2 = Math.PI * 2;

         ctx.lineWidth    = 1;
         ctx.strokeStyle  = '#000000';
         ctx.textBaseline = "middle";
         ctx.textAlign    = "center";
         ctx.font         = "1.4em Arial";

         for (var i = 1; i <= len; i++) {
            var angle = PI2 * (i / len) + angleCurrent;
            wheel.drawSegment(i - 1, lastAngle, angle);
            lastAngle = angle;
         }
         // Draw a center circle
         ctx.beginPath();
         ctx.arc(centerX, centerY, 20, 0, PI2, false);
         ctx.closePath();

         ctx.fillStyle   = '#ffffff';
         ctx.strokeStyle = '#000000';
         ctx.fill();
         ctx.stroke();

         // Draw outer circle
         ctx.beginPath();
         ctx.arc(centerX, centerY, size, 0, PI2, false);
         ctx.closePath();

         ctx.lineWidth   = 10;
         ctx.strokeStyle = '#000000';
         ctx.stroke();
         
      },
   }

   window.onload = function() {
      wheel.init();

      var segments = new Array();
      $.each($('#venues input:checked'), function(key, cbox) {
         segments.push( cbox.value );
         
      });

      wheel.segments = segments;
      wheel.update();

      // Hide the address bar (for mobile devices)!
      setTimeout(function() {
         window.scrollTo(0, 1);
      }, 0);
   }
</script>
</head>
<body>
<div id="venues" style="float:left">
   <ul>
      <!--
      <li>
         <input id="venue-257424" name="Afghan Kabob House" value="Afghan Kabob House" type="checkbox" checked="checked">
         <label for="venue-257424">Afghan Kabob House</label>
      </li>
      <li>
         <input id="venue-66244" name="California Tortilla" value="California Tortilla" type="checkbox" checked="checked">
         <label for="venue-66244">California Tortilla</label>
      </li>
      <li>
         <input id="venue-207306" name="Corner Bakery Courthouse" value="Corner Bakery Courthouse" type="checkbox" checked="checked">
         <label for="venue-207306">Corner Bakery Courthouse</label>
      </li>
      <li>
         <input id="venue-129724" name="Cosi" value="Cosi" type="checkbox" checked="checked">
         <label for="venue-129724">Cosi</label>
      </li>
      <li>
         <input id="venue-41457" name="Delhi Dhaba" value="Delhi Dhaba" type="checkbox" checked="checked">
         <label for="venue-41457">Delhi Dhaba</label>
      </li>
      <li>
         <input id="venue-392360" name="Five Guys" value="Five Guys" type="checkbox" checked="checked">
         <label for="venue-392360">Five Guys</label>
      </li>
       
      <li>
         <input id="venue-5518" name="Ireland's Four Courts" value="Ireland's Four Courts" type="checkbox" checked="checked">
         <label for="venue-5518">Ireland's Four Courts</label>
      </li>
      <li>
         <input id="venue-116208" name="Jerry's Subs and Pizza" value="Jerry's Subs and Pizza" type="checkbox" checked="checked">
         <label for="venue-116208">Jerry's Subs and Pizza</label>
      </li>
      <li>
         <input id="venue-352867" name="Pho 75 - Rosslyn" value="Pho 75 - Rosslyn" type="checkbox" checked="checked">
         <label for="venue-352867">Pho 75 - Rosslyn</label>
      </li>
      <li>
         <input id="venue-22493" name="Ragtime" value="Ragtime" type="checkbox" checked="checked">
         <label for="venue-22493">Ragtime</label>
      </li>
      <li>
         <input id="venue-42599" name="Ray's Hell Burger" value="Ray's Hell Burger" type="checkbox" checked="checked">
         <label for="venue-42599">Ray's Hell Burger</label>
      </li>
      <li>
         <input id="venue-66271" name="Starbucks" value="Starbucks" type="checkbox" checked="checked">
         <label for="venue-66271">Starbucks</label>
      </li>
      <li>
         <input id="venue-268052" name="Subway" value="Subway" type="checkbox" checked="checked">
         <label for="venue-268052">Subway</label>
      </li>
      <li>
         <input id="venue-5665" name="Summers Restaurant &amp; Sports Bar" value="Summers Restaurant &amp; Sports Bar" type="checkbox" checked="checked">
         <label for="venue-5665">Summers Restaurant &amp; Sports Bar</label>
      </li>
      <li>
         <input id="venue-512060" name="The Perfect Pita" value="The Perfect Pita" type="checkbox" checked="checked">
         <label for="venue-512060">The Perfect Pita</label>
      </li>
      <li>
         <input id="venue-101161" name="TNR Cafe" value="TNR Cafe" type="checkbox" checked="checked">
         <label for="venue-101161">TNR Cafe</label>
      </li>
      <li>
         <input id="venue-2210952" name="Uptown Cafe" value="Uptown Cafe" type="checkbox" checked="checked">
         <label for="venue-2210952">Uptown Cafe</label>
      </li>
      -->
   </ul>
</div>
<div id="wheel">
<canvas height="600" id="canvas" width="1000"></canvas>
</div>
<div id="stats">
<!--<div id="counter">30.278136368970777 FPS</div>-->
</div>


</body></html>