class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {

    $( "li" ).on( "click", el => {
        const $li = $(el.currentTarget);

        // this.makeMove($li);

        const pos = $li.attr("data-pos");
        const arr = [Number(pos[0]), Number(pos[pos.length-1])];

        try {
          this.game.playMove(arr);
          this.makeMove($li);
        } catch (e) {
          alert("This " + e.msg.toLowerCase());
          return;
        }

        if(this.game.isOver()){
          alert("over");
        }
      });
  }

  makeMove($square) {
      $square.css("background-color", "red");
      $square.text(this.game.currentPlayer);


  }

  setupBoard() {
    const $ul = $('<ul>');

      for(let row = 0; row < 3; row++){
        for(let col = 0; col < 3; col++){
          let $li = $('<li>').addClass("square").attr("data-pos",[row, col]);
          $ul.append($li);
        }
      }
    this.el.append($ul);
    $ul.addClass('ticTacToe_list group');

  }
}

module.exports = View;
