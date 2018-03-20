function sum(num1) {
  let nums = Array.from(arguments);
  let total = nums.reduce(function(a, b) {
    return a+ b;
  });
  return total;
}

sum(1, 2, 3, 4);


function sum2(num1, ...numbers){
  let total = numbers.reduce(function(a, b) {
    return a+ b;
  });
  return total;
}

sum2(1, 2, 3, 4);


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBind = function () {
  let args = Array.from(arguments);
  let _that = this;
  let ctx = args[0];
  let otherArgs = args.slice(1);

  return function() {
    let additionalInfo = Array.from(arguments);
    let combined = otherArgs.concat(additionalInfo);
    return _that.apply(ctx, combined);
  };
};

Function.prototype.myBind = function (ctx, ...args) {
  let _that = this;

  return function(...otherArgs) {
    let combined = args.concat(otherArgs);
    return _that.apply(ctx, combined);
  };
};

function curriedSum(numArgs) {
  let allNums = [];

  return function _curriedSum(number){
    allNums.push(number);
    if(allNums.length === numArgs) {
      let total = allNums.reduce(function(a,b) {
        return a + b;
      },0);
      return total;
    }else {
      return _curriedSum;
    }
  };
}

curriedSum(3);



Function.prototype.curry = function(numArgs) {

  let allArguments = [];
  let that = this;

  return function _curry(args) {
    allArguments.push(args);
    if(allArguments.length === numArgs) {
        return that.apply(null, allArguments);
    }else {
      return _curry;
    }
  };
};

Function.prototype.curry2 = function(numArgs) {

  let allArguments = [];

  const _curry = (args) => {
    allArguments.push(args);
    if(allArguments.length === numArgs) {
        return this.call(null, ...allArguments);
    }else {
      return _curry;
    }
  };
  return _curry;
};
