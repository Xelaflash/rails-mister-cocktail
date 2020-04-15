import 'bootstrap';
import 'jquery';

import '../components/alert';
import '../components/scroll_anim';
import { previewImageOnFileSelect } from '../components/photo_preview';

$(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 4000);
});

previewImageOnFileSelect();
