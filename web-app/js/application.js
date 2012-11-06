if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
	
	$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {

		   // retry not set or less than 2 : retry not requested
		   if( !originalOptions.retryMax || !originalOptions.retryMax >=2 ) return;
		   // no timeout was setup
		   if( !originalOptions.timeout >0 ) return;

		   if( originalOptions.retryCount ) {
		      // increment retry count each time
		      originalOptions.retryCount++;
		   }else{
		      // init the retry count if not set
		      originalOptions.retryCount = 1;
		      // copy original error callback on first time
		      originalOptions._error = originalOptions.error;
		   };

		   // overwrite error handler for current request
		   options.error = function( _jqXHR, _textStatus, _errorThrown ){
		      // retry max was exhausted or it is not a timeout error
		      if( originalOptions.retryCount >= originalOptions.retryMax || _textStatus!='timeout' ){
		         // call original error handler if any
		         if( originalOptions._error ) originalOptions._error( _jqXHR, _textStatus, _errorThrown );
		         return;
		      };
		      // Call AJAX again with original options
		      $.ajax( originalOptions);
		   };
	});
	
}

