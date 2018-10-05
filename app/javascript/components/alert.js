import swal from 'sweetalert';

const swalButton = document.querySelector('.delete-item');

function bindSweetAlertButtonDemo(e) {
   const form = this;
  e.preventDefault();
  swal({
    title: "Are you sure?",
    text: "Once deleted, you will not be able to drink it anymore!",
    icon: "warning",
    buttons: true,
    dangerMode: true,
    closeOnClickOutside: false,
  }).then(function(isConfirm) {
    if (isConfirm) {
      swal({
        title: 'canceled!',
        text: 'cocktail is deleted!',
        icon: 'success'
      }).then(function() {
        form.submit();
      });
    } else {
      swal("Cancelled", "Your cocktail is safe :)", "error");
    }
  });
};

if (swalButton) {
  swalButton.addEventListener('click', bindSweetAlertButtonDemo);
}
