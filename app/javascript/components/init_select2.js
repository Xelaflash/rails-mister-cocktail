import select2 from 'select2';

const improveDropdown = () => {
  $(document).ready(function() {
    $('.ingredients_select').select2();
  });
};

export { improveDropdown };
