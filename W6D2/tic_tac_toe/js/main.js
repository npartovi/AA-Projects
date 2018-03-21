const View = require('./ttt-view.js'); // require appropriate file
const Game = require('./../node_solution/game.js') ;// require appropriate file

$( () => {
  const game = new Game();
  const $ttt = $('.ttt');
  new View(game, $ttt);
});
