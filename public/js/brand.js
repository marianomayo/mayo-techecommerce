document.addEventListener('DOMContentLoaded', () => {


    const getBrands = () => {
        fetch('/brand/getBrands')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ha ocurrido un problema en el servidor');
                }
                return response.json();
            })
            .then(brands => showBrands(brands.brand))
            .catch(error => console.error(error));
    }
    
    const showBrands = (vObjBrands) => {
        
        const container = document.querySelector('#contenedor-marca'); 

        vObjBrands.forEach(brand => {
           
            const article = document.createElement('article');
            const figure = document.createElement('figure');
            const img = document.createElement('img');
            const p = document.createElement('p');
    
           
            img.src = brand.vpath;
            img.alt = 'producto';
            p.textContent = brand.vdescripcion;
            p.className = "texto-marca";
    
            figure.appendChild(img);
            article.appendChild(figure);
            article.appendChild(p);
            container.appendChild(article);
        });
      
       
    }

    getBrands();
})