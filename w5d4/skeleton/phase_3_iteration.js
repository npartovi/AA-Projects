Array.prototype.bubbleSort = function () {

  let notSorted = true;

  while(notSorted){
    notSorted = false;

    for(let i = 0; i < this.length-1; i++){
      if(this[i] > this[i + 1]){
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        notSorted = true;
      }
    }
  }

  return this;

};


String.prototype.substrings = function () {

  let results = [];

  for(let i = 0; i < this.length; i++){
    for(let j = 0; j < this.length; j++){
      if(j < i) {
        continue;
      }
      results.push(this.slice(i, j+ 1));
    }
  }

  return results;

};
