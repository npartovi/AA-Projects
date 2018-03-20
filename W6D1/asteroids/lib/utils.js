function Util() {
}

Util.prototype.inherits = function (childClass, parentClass) {
  Util.prototype = parentClass.prototype;
  let util = new Util;
  util.prototype = parentClass.prototype;
  childClass.prototype = util.prototype;
  childClass.prototype.constructor = childClass;
};
