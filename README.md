# techecommerce
### *Mas que Tecnologia*
#### ***techecommerce es una empresa que busca darle al cliente lo mejor en tecnologia, no solo es para el consumidor final, si no para las grandes empresas que buscan que sus empleados tengan las mejores herramientas.***

### Algunos de los productos que se pueden encontrar son :
- Pc
- Notebooks
- Celulares
- Tv
- Fundas

### *El público objetivo ronda entre los 15 años y los 70 años*

### Las tipógrafías a utilizar serán [Montserrat](https://fonts.google.com/share?selection.family=Montserrat:wght@600|PT+Serif|Spectral:wght@200)

### Paleta de colores:
![Paleta](https://i.postimg.cc/sxNhL24t/Adobe-Color-Ecommerce.jpg)


 ### FIGMA
 [FIGMA](https://www.figma.com/file/UWeiTz94pFARK5emQJ9JVo/icaro-ecommerce?type=design&node-id=0-1&mode=design&t=rFCNn5yARxk1Jq2p-0)


### Para lectura Jordi
Para poder insertar un producto:
El objeto a insertar:
{
    "nombre": string,
    "descripcion": string,
    "fprecio": float,
    "nmarca": int,
    "nusuariocreador": 1 (int)
}

Sobre la marca y el nusuariocreador la idea es que mañana en algun formulario de creacion de producto que haya,
exista un select en el cual podes elegir la marca. en este momento es del 1 al 4. (marcas que estan en la bd)

por el nusuariocreador cuando se aprenda un poco mas sobre quien esta conectado, podria usar el usuario habilitado 
para poder crear el producto. En este momento es un dato que si no se envia te lo va a rechazar la bd ya que es obligatorio.
No realize middleware para el mismo.
por lo pronto para el nusuariocreador se debe enviar 1 (usuario administrador de la tabla administrador)

para editProduct/:id: 
{
    "nombre": string,
    "descripcion": string,
    "fprecio": float,
    "nmarca": int
}

no prestes atencion a la carpeta public. Fui avanzando o 'Jugando' con algunas cosas como para ir practicando..
Seguramente cosas para corregir