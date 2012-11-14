/**
 * @author: ideawu
 * @link: http://www.ideawu.net/prj/jquery-lazy-bind/
 */

(function($){
    $.fn.lazybind = function(event, fn, timeout, abort){
        var timer = null;
        if(abort != undefined){
	        $(this).bind(abort, function(){
	            if(timer != null){
	                clearTimeout(timer);
	            }
	        });
        }        
        $(this).bind(event, function(e){
            var ev = e;
            var targetFunction = jQuery.proxy(fn, $(this));
            timer = setTimeout(function(){
            	targetFunction(ev);
            }, timeout);
        });
    };
})(jQuery);


