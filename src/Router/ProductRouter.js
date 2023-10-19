const { Router } = require('express');

const ProductController = require('../Controller/ProductController');

const ProductRouter = Router();

ProductRouter.get("/getAll", ProductController.getAll);

ProductRouter.post("/addProduct", ProductController.addProduct);

ProductRouter.post("/addProduct", ProductController.editProduct);

ProductRouter.get("/addProduct", ProductController.getProductById);


module.exports = ProductRouter;
