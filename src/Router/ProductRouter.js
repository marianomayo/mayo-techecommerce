const { Router } = require('express');

const ProductController = require('../Controller/ProductController');

const { validarErrores } = require("../Middlewares");
const { idRequired } = require('../Middlewares/ParamsMiddleware');
const { validateName, validateDescription, validatePrice, validateBrand } = require('../Middlewares/ProducMiddleware');

const ProductRouter = Router();

ProductRouter.get("/getAll", ProductController.getAll);

ProductRouter.post("/addProduct", [validateName, validateDescription, validatePrice, validateBrand, validarErrores], ProductController.addProduct);

ProductRouter.put("/editProduct/:id", [idRequired, validateName, validateDescription, validarErrores], ProductController.editProduct);

ProductRouter.get("/getProductById/:id", [idRequired, validarErrores], ProductController.getProductById);


module.exports = ProductRouter;
