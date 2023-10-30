const BrandModel = require('../Model/BrandModel');

const getAll = (req, res) => {    
    BrandModel.getAll().then((brand) => {
        res.status(200).send({ brand });
    }).catch((e) => res.status(404).send({
        e
    }));
}

module.exports = { getAll }