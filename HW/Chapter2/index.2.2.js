const fs = require('fs');
const util = require('util');
const path = require('path');

const PATH = './test';

const getDirList = util.promisify(fs.readdir);
const getFileStat = util.promisify(fs.stat);

const showDirectory = async (directory) => {
    const files = await getDirList(directory);

    files.forEach(async (file) => {
        const filePath = path.join(directory, file);
        const fileStat = await getFileStat(filePath);

        if (fileStat.isDirectory()){
            await showDirectory(filePath);
        }
        else if (path.extname(filePath) === '.js'){
            console.log(filePath);
        }
    });
}

(async () => {
    try {
        await showDirectory(PATH);
    } catch (err) {
        console.error(err);
    }
})();