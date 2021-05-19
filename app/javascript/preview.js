document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('new_animal_image')){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `new_animal_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'new_animal[images][]')
      inputHTML.setAttribute('type', 'file')

      const fileFieldsArea = document.querySelector('.file-field')

      imageElement.appendChild(blobImage);
      fileFieldsArea.appendChild(inputHTML)
      ImageList.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('new_animal_image').addEventListener('change', function(e){
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});