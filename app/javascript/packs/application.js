import 'bootstrap';

import '../components/alert';
import '../components/scroll_anim';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { improveDropdown } from '../components/init_select2';
import { initStarRating } from '../components/init_star_rating';

$(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 4000);
});

previewImageOnFileSelect();
improveDropdown();
initStarRating();
