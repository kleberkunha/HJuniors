// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "controllers/carousel"
import "controllers/modal_diplom"




const button_drop_profule = document.querySelector(".button-edit");
const div_display_none_edit_user = document.querySelector(".bio-graph-info");

button_drop_profule.addEventListener("click", function(){
    div_display_none_edit_user.classList.toggle("user_hide_info");
});
