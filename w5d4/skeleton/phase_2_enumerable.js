Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};


Array.prototype.myMap = function (callback) {

  let results = [];

  this.myEach(function(el){
    results.push(callback(el));
  });

  return results;

};


Array.prototype.myReduce = function (callback,acc) {

  var i  = 0;

  if (acc === undefined) {
    acc = this[0];
    i++;
  }

  for (i ; i < this.length ; i++){
    acc = callback(this[i], acc);
  }

  return acc;
};
