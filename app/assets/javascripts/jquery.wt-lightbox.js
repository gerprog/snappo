/**
 * jQuery Lightbox
 * Copyright (c) 2012 Allan Ma (http://codecanyon.net/user/webtako)
 * Version: 1.25 (2/27/2012)
 */
;(function($) {
	var OVERLAY_OPACITY = .75;
	var DEFAULT_DURATION = 600;
	var ANIMATE_SPEED = 300;
	var DEFAULT_DELAY = 4000;
	var DEFAULT_WIDTH = 720;
	var DEFAULT_HEIGHT = 460;
	var MIN_SIZE = 75;
	var INITIAL_SIZE = 250;
	var UPDATE_TEXT = "update_text";
	var START_TIMER = "start_timer";
	var IE6_INIT = 	  "ie6_init";
	var IE6_CLEANUP = "ie6_cleanup";
	var OPEN = "lightbox_open";
	var CLOSE = "lightbox_close";
	var IMG_RE = /[^\s]+\.(jpg|gif|png|bmp)/i;
	var SWF_RE = /[^\s]+\.(swf)/i;
	var ERROR_MSG = "Error Loading Content";
	var CONTENT =  "<div id='overlay'></div>\
					<div class='lightbox-wrapper'>\
						<div class='close-btn'></div>\
						<div id='lightbox'>\
							<div class='preloader'></div>\
							<div class='inner-box'>\
								<div class='content'></div>\
								<div class='timer'></div>\
								<div class='desc'><div class='inner-text'></div></div>\
							</div>\
							<div class='outside-desc'><div class='inner-text'></div></div>\
							<div class='cpanel'>\
								<div class='inner-cp'>\
									<div class='prev-btn'></div>\
									<div class='play-btn'></div>\
									<div class='next-btn'></div>\
									<div class='info'></div>\
								</div>\
							</div>\
						</div>\
					</div>";
					
	var defaults = { 
		rotate:true,
		delay:DEFAULT_DELAY,
		duration:DEFAULT_DURATION,
		display_dbuttons:true,
		display_number:true,
		display_timer:true,
		display_caption:true,
		caption_position:"outside",		
		cont_nav:true,
		auto_fit:true,
		easing:"",		
		type:"GET"
	};
		
	var $overlay;
	var $wrapper;
	var $lightbox;
	var $inTextPanel;
	var $outTextPanel;
	var $preloader;
	var $cpanel;
	var $playButton;
	var $closeButton;
	var $infoPanel;
	var $innerBox;
	var $contentBox;
	var $prevButton;
	var $nextButton;
	var $timer;
	var $item;
	var $currObj;
	var $currGroup;
	
	var currIndex;
	var numItems;
	var contNav;
	var rotate;
	var margin;
	var timerId;
	var displayCPanel;
	var displayText;
	var insideText;
	var noText;
	
	$(document).ready(function() {
		timerId = null;
		$("body").append(CONTENT);
		
		$overlay = 	$("#overlay");
		$wrapper =  $(".lightbox-wrapper");
		$lightbox =	$wrapper.find(">#lightbox");
		$preloader = $lightbox.find(">.preloader");
		$innerBox =  $lightbox.find(">.inner-box");
		$contentBox = $innerBox.find(">.content");
		$timer =	  $innerBox.find(">.timer").data("pct", 1);
		$inTextPanel = $innerBox.find(">.desc");
		$outTextPanel = $lightbox.find(">.outside-desc");
		$cpanel = $lightbox.find(">.cpanel");
		$prevButton = $cpanel.find(".prev-btn");
		$nextButton = $cpanel.find(".next-btn");
		$playButton = $cpanel.find(".play-btn");
		$infoPanel =  $cpanel.find(".info");
		$closeButton = $wrapper.find(".close-btn");
		
		$overlay.click(closeLightbox);
		$closeButton.click(closeLightbox);
		$playButton.click(togglePlay);
		$prevButton.click(goPrev);
		$nextButton.click(goNext);
		
		margin = $wrapper.outerWidth() - $wrapper.width();
		
		initMisc();
	});
	
	//init group
	$.fn.wtLightBox = function(params) {
		var $obj = $(this);
		var opts = $.extend(true, {}, defaults, params);
		$obj.data({rotate:opts.rotate,
				   delay:getPosNumber(opts.delay, DEFAULT_DELAY), 
				   duration:getPosNumber(opts.duration, DEFAULT_DURATION),
				   displayDButtons:opts.display_dbuttons, 
				   displayNum:opts.display_number, 
				   displayTimer:opts.display_timer, 
				   displayText:opts.display_caption,
				   textPos:opts.caption_position.toLowerCase(), 
				   contNav:opts.cont_nav,
				   autoFit:opts.auto_fit, 
				   easing:opts.easing,
				   type:opts.type.toUpperCase()})
			.each(function(n) {
					var $group;
					var index;
					var rel = $(this).attr("rel");
					if (typeof rel == "undefined" || rel == "") {
						$group = $(this);
						index = 0;
					}
					else {
						$group = $obj.filter("[rel=" + rel + "]");
						index = $group.index($(this));
					}
					
					if (typeof $(this).attr("href") == "undefined") {
						$(this).attr("href", "");
					}
		
					var vars = getUrlVars($(this).attr("href"));
					var contentType = getContentType($(this), vars["boxtype"]);
					$(this).data({vars:vars, contentType:contentType}).bind("click", {index:index, group:$group}, openLightbox);
			});
		return this;
	}
	
	//open lightbox
	function openLightbox(e) {
		rotate = false;
		$currObj = $(this);
		$currGroup = e.data.group;
		currIndex = e.data.index;
		
		numItems = $currGroup.size();
		contNav = $currGroup.data("contNav");
		displayText = $currGroup.data("displayText");
		insideText = $currGroup.data("textPos") == "inside" ? true : false;
		var rotateOn;
		var displayTimer;
		var displayDButtons;
		var displayNum;
		
		if (numItems > 1) {
			rotateOn = $currGroup.data("rotate");
			displayTimer = $currGroup.data("displayTimer");
			displayDButtons = $currGroup.data("displayDButtons");
			displayNum = $currGroup.data("displayNum");
			displayCPanel = rotateOn || displayDButtons || displayNum;
		}
		else {
			displayCPanel = rotateOn = displayTimer = displayDButtons = displayNum = false;
		}
		
		if (rotateOn) {			
			$lightbox.bind(START_TIMER, startTimer);
			$playButton.toggleClass("pause", rotate).show();
		}
		else {
			$lightbox.unbind(START_TIMER);
			$playButton.hide();
		}	
		
		if (displayTimer) {
			$timer.css("visibility", "visible");
		}
		else {
			$timer.css("visibility", "hidden");
		}
		
		if (displayDButtons) {
			$prevButton.show();
			$nextButton.show();
		}
		else {
			$prevButton.hide();
			$nextButton.hide();
		}
		
		if (displayNum) {
			$infoPanel.show();
		}
		else {
			$infoPanel.hide();
		}
		
		if (displayText) {
			$lightbox.unbind(UPDATE_TEXT);
			if (insideText) {
				$lightbox.bind(UPDATE_TEXT, updateInText);
				$inTextPanel.show();
				$outTextPanel.hide();
			}
			else {
				$lightbox.bind(UPDATE_TEXT, updateOutText);
				$outTextPanel.show();
				$inTextPanel.hide();
			}
		}
		else {
			$lightbox.unbind(UPDATE_TEXT);
			$inTextPanel.hide();
			$outTextPanel.hide();
		}
		
		$lightbox.data("visible", true).trigger(IE6_INIT);
		$(document).unbind("keyup", keyClose).bind("keyup", keyClose);
		$overlay.stop(true,true).css("opacity", OVERLAY_OPACITY).show();
		$wrapper.css({width:INITIAL_SIZE, height:INITIAL_SIZE}).css({marginLeft:-$wrapper.outerWidth()/2, marginTop:-$wrapper.outerHeight()/2}).show();   
		loadContent(currIndex);
		$(document).trigger(OPEN);
		
		return false;
	}
	
	//close lightbox 
	function closeLightbox() {
		resetTimer();
		$lightbox.data("visible", false).trigger(IE6_CLEANUP);
		$(document).unbind("keyup", keyClose).unbind("keyup", keyCtrl);
		disableCtrl();
		$inTextPanel.stop(true).hide();
		$outTextPanel.hide();
		$wrapper.stop(true).hide();
		$overlay.stop(true).fadeOut("fast");
		$(document).trigger(CLOSE);
		
		return false;
	}
	
	//load content
	function loadContent(i) {
		$item = $currGroup.eq(i);
		disableCtrl();
		if (insideText) {
			$inTextPanel.stop(true).hide();
		}
		else {
			$lightbox.trigger(UPDATE_TEXT);
		}
		getContent($item);
	}
	
	//get content
	function getContent($item) {
		var contentType = $item.data("contentType");
		var url = $item.attr("href");
		if (contentType == "image") {
			$preloader.show();
			var $img = $("<img/>");
			$contentBox.css({opacity:0, visibility:"hidden", width:"auto", height:"auto"}).empty().append($img);
			$img.load(function() {
					displayImage($(this));
				})
				.error(function() {
					displayError();
				})
				.attr("src", url);
				
			if ($img[0].complete || $img[0].readyState == "complete") {
				$img.unbind("load");
				displayImage($img);
			}
			return;
		}
		
		var vars = $item.data("vars");
		var width = vars["boxwidth"];
		var height = vars["boxheight"];
		width = (typeof width == "undefined" || isNaN(width)) ? DEFAULT_WIDTH : Math.max(parseInt(width), MIN_SIZE);
		height = (typeof height == "undefined" || isNaN(height)) ? DEFAULT_HEIGHT : Math.max(parseInt(height), MIN_SIZE);
		
		var newUrl = url;
		var index = url.indexOf("?");
		if (index >= 0) {
			newUrl = url.substring(0, index);
		}		
			
		if ($item.data("autoFit")) {
			var dim = getContentDim(width, height);
			width = dim.width;
			height = dim.height;
		}
		
		if (contentType == "inline") {
			var $inline = $(newUrl);
			if ($inline.size() > 0) {
				$contentBox.css({opacity:0, visibility:"hidden", width:width, height:height}).html($inline.html());
				displayContent(width, height);
			}
			else {
				displayError();
			}
		}
		else if (contentType == "flash") {
			var content =  "<object type='application/x-shockwave-flash' data='" + url + "' width=" + width + " height=" + height + ">\
								<param name='movie' value='" + url + "'/>\
								<param name='allowFullScreen' value='true'/>\
								<param name='quality' value='high'/>\
								<param name='wmode' value='transparent'/>\
								<a href='http://www.adobe.com/go/getflash'><img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player'/></a>\
							</object>";
			$contentBox.css({opacity:0, visibility:"hidden", width:"auto", height:"auto"}).html(content);
			displayContent(width, height);
		}
		else if (contentType == "ajax") {
			$preloader.show();
			$contentBox.css({opacity:0, visibility:"hidden", width:width, height:height}).empty();
			var type = $currGroup.data("type");
			var varData = (index >= 0) ? url.substring(index + 1) : "";
			$.ajax({url:newUrl, type:type, data:varData,
					success:function(data) {
						$contentBox.html(data);
						displayContent(width, height);
					},
					error:function() {
						displayError();
					}
			});
		}
		else {
			$preloader.show();
			var $iframe = $("<iframe frameborder='0' hspace='0' scrolling='auto' width='" + width + "' height='" + height + "'></iframe>");
			$contentBox.css({opacity:0, visibility:"hidden", width:width, height:height}).empty().append($iframe);
			$iframe.load(function() { displayContent(width, height); }).attr("src", newUrl);
		}
	}
	
	//display error message
	function displayError() {
		$contentBox.css({opacity:0, visibility:"hidden", width:"auto", height:"auto"}).html("<div class='error-box'>" + ERROR_MSG + "</div>");
		var $errorBox = $contentBox.find(">.error-box");
		displayContent($errorBox.width(), $errorBox.height());
	}
	
	//display image
	function displayImage($img) {		
		if ($currGroup.data("autoFit")) {
			resizeImg($img);
		}
		displayContent($img.width(), $img.height());
	}
	
	//display content
	function displayContent(contentWidth, contentHeight) {
		$preloader.hide();
		if ($lightbox.data("visible")) {
			var padding = $innerBox.outerWidth() - $innerBox.width();
			var width  = contentWidth + padding;
			var height = contentHeight + padding;
			if (displayCPanel) {
				height += $cpanel.outerHeight();
			}
			if (displayText && !insideText && !noText) {
				$outTextPanel.width(width);
				height += $outTextPanel.outerHeight();
			}
			var newDuration = getDuration(width, height); 
			var marginLeft =  -(width + margin)/2;
			var marginTop = -(height + margin)/2;
			$wrapper.stop(true).animate({marginLeft:marginLeft, marginTop:marginTop, width:width, height:height}, newDuration, $currGroup.data("easing"), 
				function() {
					$innerBox.css({width:contentWidth, height:contentHeight});
					$infoPanel.html((currIndex + 1) + " / " + numItems);
					if (displayText) {
						if (!insideText && !noText) {
							$outTextPanel.show();
						}
						else {
							$lightbox.trigger(UPDATE_TEXT);
						}
					}
					enableCtrl();
					$contentBox.css("visibility", "visible").animate({opacity:1}, "normal", 
						function() { 
							if (jQuery.browser.msie) { 
								this.style.removeAttribute('filter'); 
							}
							$lightbox.trigger(START_TIMER); 
						});
				}
			);
		}
	}
	
	//display in text panel
	function updateInText() {
		var text = $item.attr("title");
		if (typeof text == "undefined" || text == "") {
			text = $item.data("text");
		}
		
		if (text && text != "") {
			$inTextPanel.find(">.inner-text").html(text);
			$inTextPanel.stop().css("top", $innerBox.height()).show().animate({top:$innerBox.height() - $inTextPanel.height()}, "normal");
		}				
	}
	
	//display out text panel
	function updateOutText() {
		noText = true;
		$outTextPanel.hide();
		var text = $item.attr("title");
		if (typeof text == "undefined" || text == "") {
			text = $item.data("text");
		}
		
		if (text && text != "") {
			noText = false;
			$outTextPanel.find(">.inner-text").html(text);
		}
	}
	
	//resize image
	function resizeImg($img) {
		var ratio;
		var padding = $innerBox.outerWidth() - $innerBox.width();
		var maxWidth  = $(window).width() - margin - padding;
		var maxHeight = $(window).height() - margin - padding;
		if (displayCPanel) {
			maxHeight -= $cpanel.outerHeight();
		}
		if ($img.width() > maxWidth) {
			ratio = $img.height()/$img.width();
			$img.css({width:maxWidth, height:(ratio * maxWidth)});
		}
		if ($img.height() > maxHeight) {
			ratio = $img.width()/$img.height();
			$img.css({width:(ratio * maxHeight), height:maxHeight});
		}
	}
	
	//enable control panel
	function enableCtrl() {
		$(document).unbind("keyup", keyCtrl).bind("keyup", keyCtrl);
		if (displayCPanel) {
			if (!contNav) {
				$prevButton.toggleClass("off", currIndex == 0);
				$nextButton.toggleClass("off", currIndex == numItems - 1);
			}
			$cpanel.find(">.inner-cp").width($innerBox.width());
			$cpanel.show();
		}	
	}

	//disable control panel
	function disableCtrl() {
		$(document).unbind("keyup", keyCtrl);
		$cpanel.hide();
	}
	
	//play/pause
	function togglePlay() {
		rotate = !rotate;
		if (rotate) {
			$playButton.addClass("pause");
			$lightbox.trigger(START_TIMER);
		}
		else {
			$playButton.removeClass("pause");
			pauseTimer();
		}
		return false;
	}

	//previous
	function goPrev() {
		resetTimer();
		if (currIndex > 0) {
			currIndex--;
		}
		else if (contNav) {
			currIndex = numItems - 1;
		}
		else {
			return;
		}				
		loadContent(currIndex);
		return false;
	}
	
	//next
	function goNext() {
		resetTimer();
		if (currIndex < numItems - 1) {
			currIndex++;
		}
		else if (contNav) {
			currIndex = 0;
		}
		else {
			return;
		}				
		loadContent(currIndex);
		return false;
	}

	//rotate next
	function rotateNext() {
		resetTimer();
		currIndex = (currIndex < numItems - 1) ? currIndex + 1 : 0;
		loadContent(currIndex);
	}
	
	//key press
	function keyCtrl(e) {
		switch(e.keyCode) {
			case 37:
				goPrev();
				break;
			case 39:
				goNext();
				break;
			case 32:
				togglePlay();
				break;
		}
	}
	
	//key press close
	function keyClose(e) {
		if (e.keyCode == 27) {
			closeLightbox();
		}
	}
	
	//get duration
	function getDuration(width, height) {
		var wDiff = Math.abs($wrapper.width() - width);
		var hDiff = Math.abs($wrapper.height() - height);
		return Math.max($currGroup.data("duration"), wDiff, hDiff);
	}
	
	//get url variables
	function getUrlVars(url){
		var vars = [];
		var index = url.indexOf("?");
		if (index >= 0) {
			var arr = url.substring(index + 1).split("&");
			for(var i = 0; i < arr.length; i++) {
				var pair = arr[i].split("=");
				vars[pair[0]] = pair[1];
				vars.push(pair[0]);
			}
		}
		return vars;
  	}
	
	//get type of content
	function getContentType($item, contentType) {
		//get assigned content
		if (typeof contentType != "undefined") {
			contentType = contentType.toLowerCase();
			if (contentType == "image" || contentType == "flash" || contentType == "inline" || contentType == "iframe" || contentType == "ajax") {
				return contentType;
			}
		}
		
		//determine from url
		var url = $item.attr("href");
		if (url.match(IMG_RE)) {
			return "image";
		}
		if (url.match(SWF_RE)) {
			return "flash";
		}
		if (url.indexOf("#") == 0) {
			return "inline";
		}
		
		return "iframe";
	}
	
	//get box dimension
	function getContentDim(width, height) {
		var ratio;
		var padding = $innerBox.outerWidth() - $innerBox.width();
		var maxWidth  = $(window).width() - margin - padding;
		var maxHeight = $(window).height() - margin - padding;
		if (displayCPanel) {
			maxHeight -= $cpanel.outerHeight();
		}
		var dim = {width:width, height:height};
		if (dim.width > maxWidth) {
			ratio = height/width;
			dim.width = maxWidth;
			dim.height = ratio * maxWidth;
		}
		if (dim.height > maxHeight) {
			ratio = width/height;
			dim.width = ratio * maxHeight;
			dim.height = maxHeight;
		}
		dim.width = Math.max(dim.width, MIN_SIZE);
		dim.height = Math.max(dim.height, MIN_SIZE);
		return dim;
	}
	
	function initMisc() {
		if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 6) {
			var winWidth, winHeight;
			$overlay.css({position:"absolute", width:$(document).width(), height:$(document).height()});
			$wrapper.css("position", "absolute");
			$(window).bind("resize", 
						   function() {  
								if(winHeight != document.documentElement.clientHeight || winWidth != document.documentElement.clientWidth) {
									$overlay.css({width:$(document).width(), height:$(document).height()});
								}
								winWidth =  document.documentElement.clientWidth;
								winHeight = document.documentElement.clientHeight; 
							});  
			$lightbox.bind(IE6_INIT, function() { $("body").find("select").addClass("hide-selects"); })
					 .bind(IE6_CLEANUP, function() { $("body").find("select").removeClass("hide-selects"); });
		}
		else if (window.Touch) {
			$overlay.css({width:$(document).width(), height:$(document).height()});
			$(window).bind("resize", function() { $overlay.css({width:$(document).width(), height:$(document).height()}); });  
		}
	}
	
	//start timer
	function startTimer() {
		if (rotate && timerId == null) {
			var newDelay = Math.round($timer.data("pct") * $currGroup.data("delay"));
			$timer.animate({width:$innerBox.width()+1}, newDelay, "linear");
			timerId = setTimeout(rotateNext, newDelay);
		}
	}
	
	//reset timer
	function resetTimer() {
		clearTimeout(timerId);
		timerId = null;
		$timer.stop(true).width(0).data("pct", 1);
	}
	
	//pause timer
	function pauseTimer() {
		clearTimeout(timerId);
		timerId = null;
		var pct = 1 - ($timer.width()/($innerBox.width()+1));
		$timer.stop(true).data("pct", pct);
	}
	
	//get positive number
	function getPosNumber(val, defaultVal) {
		if (!isNaN(val) && val > 0) {
			return val;
		}
		return defaultVal;
	}
})(jQuery);