
Array.prototype.uniq = function() {
  let array = [];
  for (let i = 0; i < this.length; i++) {
    if (array.includes(this[i]) === false) {
      array.push(this[i]);
    }
  }


  return array;
};

Array.prototype.twoSum = function () {

    let results  = [];

    for(let i = 0; i < this.length; i++){
      for(let j = 0; j < this.length ; j++){
        if(j <= i){
          continue;
        } else if(this[i] + this[j] === 0){
          results.push([i,j]);
        }
      }
    }

    return results;

};


Array.prototype.transpose = function () {
  let results = [];

  for(let i = 0; i < this.length; i++){
    results.push([]);
  }

  for(let i = 0; i < this.length; i++){
    for(let j = 0; j < this.length; j++){
      results[j].push(this[i][j]);
    }
  }
  return results;
};
