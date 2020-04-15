import 'bootstrap';
import 'jquery';

import '../components/alert';
import '../components/scroll_anim';

$(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 4000);
});
