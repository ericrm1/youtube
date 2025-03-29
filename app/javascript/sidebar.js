document.addEventListener("DOMContentLoaded", function () {
       var sidebar = document.querySelector('.sidebar');
       var botao = document.getElementById('sidebar-responsiva-id');
   
       if (!sidebar || !botao) {
           console.error("Elemento não encontrado! Verifique o HTML.");
           return;
       }
   
       botao.addEventListener('click', function (event) {
           event.preventDefault(); // Evita que o <a> tente navegar
           console.log("Botão clicado!");
           sidebar.classList.toggle('sidebar-responsiva');
       });
   });