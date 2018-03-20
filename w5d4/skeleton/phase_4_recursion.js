

function range(start, end) {

  if (end <= start) {
    return [];
  }

  let subs = range(start,end -1);

  subs.push(end - 1);
  return subs;
}


function sumRec (arr){
  if (arr.length === 0){
    return 0;
  }

  let firstValue = arr.shift();
  return firstValue + sumRec(arr);

}

function exponent(base, exp){
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp - 1);
}


function fibonacci(n){
  if (n === 1) {
    return [1];
  } else if ( n === 2) {
    return [1, 1];
  }
  let fibs = fibonacci(n -1);


  let fibsSum = fibs[fibs.length - 1] + fibs[fibs.length - 2];


  fibs.push(fibsSum);
  return fibs;

}

function deepDup(arr) {
  let results = [];

  for (let i = 0; i < arr.length; i++) {
    if (arr[i].isArray) {
      results.push(deepDup(arr[i]));
    } else {
      results.push(arr[i]);
    }
  }

  return results;
}
