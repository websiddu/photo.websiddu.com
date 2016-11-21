(function () {

  var _arrangeGrid = function () {
    $('.photo-set').each(function (index, set) {
      var images = $(set).find('picture');
      var photoSetWidth = $(this).width();
      var ratios = [];
      images.each(function (index, obj) {
        ratios.push($(obj).data('ratio'));
      })
      var minRatio = Math.min.apply(Math, ratios);
      var j = 0;

      images.each(function (index, obj) {
        j += ratios[index] / minRatio
      });

      images.each(function (index, img) {
        var c = photoSetWidth / j;
        if ($(document).width() > 765) {
          $(this).find("img").height(Math.ceil(c / minRatio)).width(Math.ceil(c / minRatio) * ratios[index]);
          $(this).css({ 'flex-basis': (Math.ceil(c / minRatio) * ratios[index]) + 'px' });
        } else {
          $(this).find("img").height('auto').width('100%');
        }
      });
    });
  }

  var _unvial = function () {
    $("img").unveil(300, function() {
      $(this).load(function() {
        this.style.opacity = 1;
      });
    });
  }

  var _resize = function () {
    $(window).on('resize', _arrangeGrid);
  }

  _resize();
  _arrangeGrid();
  _unvial();

})();
