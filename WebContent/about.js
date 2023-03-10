
(function($){
    function injector(t, splitter, klass, after) {
      var text = t.text()
      , a = text.split(splitter)
      , inject = '';
      if (a.length) {
        $(a).each(function(i, item) {
          inject += '<div class="'+klass+(i+1)+'" aria-hidden="true">'+item+'</div>'+after;
        });
        t.attr('aria-label',text)
        .empty()
        .append(inject)
      }
    }
  
    var methods = {
      init : function() {
  
        return this.each(function() {
          injector($(this), '', 'char', '');
        });
      },
  
      words : function() {
  
        return this.each(function() {
          injector($(this), ' ', 'word', ' ');
        });
      },
  
      lines : function() {
  
        return this.each(function() {
          var r = "eefec303079ad17405c889e092e105b0";
          injector($(this).children("br").replaceWith(r).end(), r, 'line', '');
        });
      }
    };
  
    $.fn.lettering = function( method ) {
      if ( method && methods[method] ) {
        return methods[ method ].apply( this, [].slice.call( arguments, 1 ));
      } else if ( method === 'letters' || ! method ) {
        return methods.init.apply( this, [].slice.call( arguments, 0 ) ); // always pass an array
      }
      $.error( 'Method ' +  method + ' does not exist on jQuery.lettering' );
      return this;
    };
  
  })(jQuery);
  
  (function ($) {
    "use strict";
  
    function isInEffect (effect) {
      return /In/.test(effect) || $.inArray(effect, $.fn.curvy.defaults.inEffects) >= 0;
    };
  
  
    function stringToBoolean(str) {
      if (str !== "true" && str !== "false") return str;
      return (str === "true");
    };
  
  
    function getData (node) {
      var attrs = node.attributes || []
        , data = {};
  
      if (!attrs.length) return data;
  
      $.each(attrs, function (i, attr) {
        var nodeName = attr.nodeName.replace(/delayscale/, 'delayScale');
        if (/^data-in-*/.test(nodeName)) {
          data.in = data.in || {};
          data.in[nodeName.replace(/data-in-/, '')] = stringToBoolean(attr.nodeValue);
        } else if (/^data-*/.test(nodeName)) {
          data[nodeName.replace(/data-/, '')] = stringToBoolean(attr.nodeValue);
        }
      })
  
      return data;
    }
  
    function shuffle (o) {
        for (var j, x, i = o.length; i; j = parseInt(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
        return o;
    }
  
    function animate ($t, effect, cb) {
      $t.addClass(effect)
        .css('visibility', 'visible')
        .show();
    }
  
    function animateTokens ($tokens, options, cb) {
      var that = this
        , count = $tokens.length;
  
      if (!count) {
        cb && cb();
        return;
      }
  
      if (options.shuffle) $tokens = shuffle($tokens);
      if (options.reverse) $tokens = $tokens.toArray().reverse();
  
      $.each($tokens, function (i, t) {
        var $token = $(t);
  
        function complete () {
          if (isInEffect(options.effect)) {
            $token.css('visibility', 'visible');
          }  
          count -= 1;
          if (!count && cb) cb();
        }
  
        var delay = options.sync ? options.delay : options.delay * i * options.delayScale;
  
        $token.text() ?
          setTimeout(function () { animate($token, options.effect, complete) }, delay) :
          complete();
      });
    };
  
    var curvy = function (element, options) {
      var base = this
        , $element = $(element);
  
      base.init = function () {
        base.$texts = $element.find(options.selector);
  
        if (!base.$texts.length) {
          base.$texts = $('<ul class="texts"><li>' + $element.html() + '</li></ul>');
          $element.html(base.$texts);
        }
  
        base.$texts.hide();
  
        base.$current = $('<span>')
          .html(base.$texts.find(':first-child').html())
          .prependTo($element);
  
        if (isInEffect(options.in.effect)) {
          base.$current.css('visibility', 'hidden');
        } 
  
        base.setOptions(options);
  
        base.timeoutRun = null;
  
        setTimeout(function () {
          base.options.autoStart && base.start();
        }, base.options.initialDelay)
      };
  
      base.setOptions = function (options) {
        base.options = options;
      };
  
      base.triggerEvent = function (name) {
        var e = $.Event(name + '.tlt');
        $element.trigger(e, base);
        return e;
      };
  
      base.in = function (index, cb) {
        index = index || 0;
  
        var $elem = base.$texts.find(':nth-child(' + ((index||0) + 1) + ')')
          , options = $.extend(true, {}, base.options, $elem.length ? getData($elem[0]) : {})
          , $tokens;
  
        $elem.addClass('current');
  
        base.triggerEvent('inAnimationBegin');
  
        base.$current
          .html($elem.html())
          .lettering('words');
  
         if (base.options.type == "char") {
          base.$current.find('[class^="word"]')
              .css({
                'display': 'inline-block',
                '-webkit-transform': 'translate3d(0,0,0)',
                '-moz-transform': 'translate3d(0,0,0)',
                '-o-transform': 'translate3d(0,0,0)',
                'transform': 'translate3d(0,0,0)'
              })
              .each(function () { $(this).lettering() });
        }
  
        $tokens = base.$current
          .find('[class^="' + base.options.type + '"]')
          .css('display', 'inline-block');
  
        if (isInEffect(options.in.effect)) {
          $tokens.css('visibility', 'hidden');
        }  
  
        base.currentIndex = index;
  
        animateTokens($tokens, options.in, function () {
          base.triggerEvent('inAnimationEnd');
          if (options.in.callback) options.in.callback();
          if (cb) cb(base);
        });
      };
  
      base.start = function (index) {
        setTimeout(function () {
          base.triggerEvent('start');
  
        (function run (index) {
          base.in(index, function () {
            var length = base.$texts.children().length;
  
            index += 1;
  
            if (!base.options.loop && index >= length) {
              if (base.options.callback) base.options.callback();
              base.triggerEvent('end');
            } else {
              index = index % length;
  
              base.timeoutRun = setTimeout(function () {
                base.out(function () {
                  run(index)
                });
              }, base.options.minDisplayTime);
            }
          });
        }(index || 0));
        }, base.options.initialDelay);
      };
  
      base.stop = function () {
        if (base.timeoutRun) {
          clearInterval(base.timeoutRun);
          base.timeoutRun = null;
        }
      };
  
      base.init();
    }
  
    $.fn.curvy = function (settings, args) {
      return this.each(function () {
        var $this = $(this)
          , data = $this.data('curvy')
          , options = $.extend(true, {}, $.fn.curvy.defaults, getData(this), typeof settings == 'object' && settings);
  
        if (!data) {
          $this.data('curvy', (data = new curvy(this, options)));
        } else if (typeof settings == 'string') {
          data[settings].apply(data, [].concat(args));
        } else {
          data.setOptions.call(data, options);
        }
      })
    };
  
    $.fn.curvy.defaults = {
      selector: '.texts',
      loop: false,
      minDisplayTime: 100,
      initialDelay: 0,
      in: {
        delayScale: 1,
        delay: 0,
        sync: false,
        reverse: false,
        shuffle: false,
        callback: function () {}
      },
      autoStart: true,
      inEffects: [],
      callback: function () {},
      type: 'char'
    };
  }(jQuery));
  