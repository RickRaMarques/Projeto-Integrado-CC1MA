function trocarfoto() {
    const profileContainer = document.getElementById('foto');
    const imageInput = document.getElementById('arquivo');
    const profileImage = document.getElementById('fotoperfil');
    const saveButton = document.getElementById('save');

    imageInput.addEventListener('change', function () {
        const file = imageInput.files[0];
        const reader = new FileReader();

        reader.onload = function (e) {
            profileImage.src = e.target.result;
        }

        reader.readAsDataURL(file);
    });

    saveButton.addEventListener('click', function () {
        const file = imageInput.files[0];

        const formData = new FormData();
        formData.append('profileImage', file);

        fetch('/upload-profile-image', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                console.log('Imagem enviada com sucesso');
            })
            .catch(error => {
                console.error('Erro ao enviar a imagem:', error);
            });
    });
}


const input2 = document.getElementById('nome');
const textarea = document.getElementById('bio');
const editarBotao = document.getElementById('editar');
const div = document.getElementsByClassName('container')

editarBotao.addEventListener('click', function() {
  textarea.removeAttribute('readonly');
  input2.removeAttribute('readonly');
  input2.parentNode.classList.add('editable')
  textarea.parentNode.classList.add('editable')
  textarea.classList.add('editable');
  textarea.focus();
});

textarea.addEventListener('keydown', function(event) {
  if (event.key === 'Enter') {
    textarea.setAttribute('readonly', true);
    input2.focus();
  }
});

input2.addEventListener('keydown', function(event) {
  if (event.key === 'Enter') {
    input2.setAttribute('readonly', true);
  }
});
