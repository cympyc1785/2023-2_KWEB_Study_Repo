const factorial = (n) => {
    let result = 1;

    for (let i = 2; i <= n; i++){
        result *= i;
    }

    return result;
}

const permutation = (n, r) => {
    return factorial(n) / factorial(n - r);
}

const combination = (n, r) => {
    return permutation(n, r) / factorial(r);
}

const multiPermutation = (n, r) => {
    return n ** r;
}

const multiCombination = (n, r) => {
    return combination(n + r - 1, r);
}

module.exports={
    factorial,
    permutation,
    combination,
    multiPermutation,
    multiCombination,
}