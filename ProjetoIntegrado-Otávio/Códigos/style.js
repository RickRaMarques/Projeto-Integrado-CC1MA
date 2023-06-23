const textarea = document.getElementById('duvida');
const button = document.getElementById('enviar');

textarea.addEventListener('input', function() {
  if (textarea.value.trim() === '') {
    button.disabled = true;
    button.classList.remove('clicavel');
  } else {
    button.disabled = false;
    button.classList.add('clicavel');
  }
});
