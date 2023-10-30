const ProductModel = require('../Model/ProductModel');
const ViewProductModel = require('../Model/ViewProductModel');
const BrandModel = require('../Model/BrandModel');

const getAll = (req, res) => {    
    ViewProductModel.getAll().then((product) => {
        res.status(200).send({ product });
    }).catch((e) => res.status(404).send({
        e
    }));
}

const addProduct = (req, res) => {
    const nMarca = req.body.nmarca;

    BrandModel.getBrandById(nMarca).then((pResultadoMarca) => {
        if (pResultadoMarca.length === 0) {            
            res.status(404).send({
                "message": `La marca seleccionada no existe en la Base de Datos` 
            })
        } else {
            ProductModel.addProduct(req.body).then((pResultadoProducto) => {
                res.status(200).send({ 
                    "message": `El producto fue agregado correctamente` 
                });
            }).catch((e) => res.status(404).send({
                    e
                }))
        }
    })
    
    
}

const editProduct = (req, res) => {
    
    const idParams = Number(req.params.id);
    ProductModel.editProduct(idParams, req.body).then((pResultadoProducto) => {
        res.status(200).send({ 
            "message": `El producto ${req.body.nombre} fue actualizado correctamente` 
        });
    }).catch((e) => res.status(404).send({
        e
    }))
    
}

const getProductById = (req, res) => {

    const idParams = Number(req.params.id);
    
    ViewProductModel.getProductById(idParams).then((product) => {
        res.status(200).send({ product });
    }).catch((e) => res.status(404).send({
        e
    }));
}

module.exports = {getAll, addProduct, editProduct, getProductById};