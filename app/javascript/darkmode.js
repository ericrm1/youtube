let darkmode = localStorage.getItem('darkmode');
const themeSwitch = document.getElementById('theme-switch');
const darkIcon = "dark-mode.svg";
const lightIcon = "light-mode.svg";

// Função para ativar o modo escuro
const enableDarkmode = () => {
    document.body.classList.add('darkmode');
    localStorage.setItem('darkmode', 'active');
    themeSwitch.querySelector("img").src = lightIcon; // Troca para o ícone de modo claro
}

// Função para desativar o modo escuro
const disableDarkmode = () => {
    document.body.classList.remove('darkmode');
    localStorage.setItem('darkmode', 'inactive');
    themeSwitch.querySelector("img").src = darkIcon; // Troca para o ícone de modo escuro
}

// Verifica o estado ao carregar a página e aplica o modo adequado
if(darkmode === "active") {
    enableDarkmode();
} else {
    disableDarkmode();
}

// Adiciona evento ao botão para alternar o modo
themeSwitch.addEventListener("click", () => {
    darkmode = localStorage.getItem('darkmode');
    if(darkmode !== "active") {
        enableDarkmode();
    } else {
        disableDarkmode();
    }
});

console.log('darkmode')