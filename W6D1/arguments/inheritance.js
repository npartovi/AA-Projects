Function.prototype.inherits = function(superClass){
  const surrogate = function Surrogate(){};
  surrogate.prototype = superClass.prototype;
  this.prototype = new surrogate();
  this.prototype.constructor = this;
};


 function ship(size) {
   this.size = size;
 }

ship.prototype.double = function() {
  return this.size * 2;
};

 function battleship(size, color){
   this.size = size;
   this.color = color;
 }

 battleship.inherits(ship);
 let blackbeard = new battleship(9, 'blue');
 console.log(blackbeard.double());
