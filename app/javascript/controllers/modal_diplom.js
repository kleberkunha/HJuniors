document.addEventListener("click",function (e){
    if(e.target.classList.contains("gallery-item")){
          const src = e.target.getAttribute("src");
          document.querySelector(".modal-img").src = src;
          const myModal = new bootstrap.Modal(document.getElementById('gallery-modal'));
          myModal.show();
    }
})


/* function edit_drop(){
      alert("teste");
      document.querySelector(".bio-graph-info").style.display = "none";
} */

function myFunction() {
      document.querySelector(".bio-graph-info").style.display = "none";
}
