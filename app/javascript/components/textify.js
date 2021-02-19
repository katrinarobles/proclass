const textified = (element, method, delay) => {
    const split = function (element) {
    words = $(element).text().split('');
    for (i in words) {
      words[i] = '<span>' + words[i] + '</span>';
    }
    text = words.join('');
    $(element).html(text);
  };

  const textify = function(element,method,delay) {
    split(element);
    $(element + ' span').css('opacity','0')
    $(element + ' span').css('position','relative');
    in_speed = 10;
    count = 0;
    setTimeout(function(){
      count = 0;
      $(element + ' span').each(function () {
        if(method == 'fade'){
          $(this).delay(0 + in_speed * count).animate({ opacity: '1' }, 200);
        } else if(method == 'bounce'){
          $(this).delay(0 + in_speed * count).animate({ opacity: '1','top':'-4px'}, 220,'easeOutCubic');
          $(this).delay(0 + in_speed * count/4).animate({ opacity: '1','top':'0px'}, 220);
        }
        count++;
      });
    },delay);
  };

  textify(element, method, delay)
};

export { textified };
