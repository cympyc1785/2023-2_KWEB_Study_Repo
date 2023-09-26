const printPower1 = (x, y) => {
    const msg = 'Value of ' + x + ' to the power ' + y + ' is ' + x ** y + '.';
    console.log(msg);
    };
printPower1(3, 4);
    
const printPower2 = (x, y) => {
    const msg = `Value of ${x} to the power ${y} is ${x ** y}.`;
    console.log(msg);
    };
printPower2(3, 4);

const arr = [1, 2, 3, 4];
const [a1, a2, a3, a4] = arr;
const [b1, , b3] = arr;
const [, , , c4, c5, c6 = 10] = arr;

const obj = { x: 1, y: 2, z: 3 };
const { x, z, u, v = 10 } = obj;
const { y: y1 } = obj;