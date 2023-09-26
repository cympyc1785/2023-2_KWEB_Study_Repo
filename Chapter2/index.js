const circularShapes = require('./circular-shapes');
const { getCircumference } = require('./circular-shapes');
const path = require('path');

const r = 10;
const h = 20;

console.log('circumsference = ${circularShapes.getCircumference(r)}');
console.log('circumsference = ${getCircumference(r)}');

const myFile = "./example.js";
const dirname = path.dirname(myFile);
console.log(dirname);
const basename = path.basename(myFile);
console.log(basename);