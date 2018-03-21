!function(t){var r={};function e(n){if(r[n])return r[n].exports;var s=r[n]={i:n,l:!1,exports:{}};return t[n].call(s.exports,s,s.exports,e),s.l=!0,s.exports}e.m=t,e.c=r,e.d=function(t,r,n){e.o(t,r)||Object.defineProperty(t,r,{configurable:!1,enumerable:!0,get:n})},e.r=function(t){Object.defineProperty(t,"__esModule",{value:!0})},e.n=function(t){var r=t&&t.__esModule?function(){return t.default}:function(){return t};return e.d(r,"a",r),r},e.o=function(t,r){return Object.prototype.hasOwnProperty.call(t,r)},e.p="",e(e.s=0)}([function(t,r,e){const n=e(4),s=e(3);$(()=>{const t=new s,r=$(".ttt");new n(t,r)})},function(t,r){t.exports=function(t){this.msg=t}},function(t,r,e){const n=e(1);class s{constructor(){this.grid=s.makeGrid()}isEmptyPos(t){if(!s.isValidPos(t))throw new n("Is not valid position!");return null===this.grid[t[0]][t[1]]}isOver(){if(null!=this.winner())return!0;for(let t=0;t<3;t++)for(let r=0;r<3;r++)if(this.isEmptyPos([t,r]))return!1;return!0}placeMark(t,r){if(!this.isEmptyPos(t))throw new n("Is not an empty position!");this.grid[t[0]][t[1]]=r}print(){const t=[];for(let r=0;r<3;r++){const e=[];for(let t=0;t<3;t++)e.push(this.grid[r][t]?this.grid[r][t]:" ");t.push(`${e.join("|")}\n`)}console.log(t.join("-----\n"))}winner(){const t=[[[0,0],[0,1],[0,2]],[[1,0],[1,1],[1,2]],[[2,0],[2,1],[2,2]],[[0,0],[1,0],[2,0]],[[0,1],[1,1],[2,1]],[[0,2],[1,2],[2,2]],[[0,0],[1,1],[2,2]],[[2,0],[1,1],[0,2]]];for(let r=0;r<t.length;r++){const e=this.winnerHelper(t[r]);if(null!=e)return e}return null}winnerHelper(t){for(let r=0;r<s.marks.length;r++){const e=s.marks[r];let n=!0;for(let r=0;r<3;r++){const s=t[r];this.grid[s[0]][s[1]]!=e&&(n=!1)}if(n)return e}return null}static isValidPos(t){return 0<=t[0]&&t[0]<3&&0<=t[1]&&t[1]<3}static makeGrid(){const t=[];for(let r=0;r<3;r++){t.push([]);for(let e=0;e<3;e++)t[r].push(null)}return t}}s.marks=["x","o"],t.exports=s},function(t,r,e){const n=e(2),s=e(1);t.exports=class{constructor(){this.board=new n,this.currentPlayer=n.marks[0]}isOver(){return this.board.isOver()}playMove(t){this.board.placeMark(t,this.currentPlayer),this.swapTurn()}promptMove(t,r){this.board.print(),console.log(`Current Turn: ${this.currentPlayer}`),t.question("Enter rowIdx: ",e=>{const n=parseInt(e);t.question("Enter colIdx: ",t=>{const e=parseInt(t);r([n,e])})})}run(t,r){this.promptMove(t,e=>{try{this.playMove(e)}catch(t){if(!(t instanceof s))throw t;console.log(t.msg)}this.isOver()?(this.board.print(),this.winner()?console.log(`${this.winner()} has won!`):console.log("NO ONE WINS!"),r()):this.run(t,r)})}swapTurn(){this.currentPlayer===n.marks[0]?this.currentPlayer=n.marks[1]:this.currentPlayer=n.marks[0]}winner(){return this.board.winner()}}},function(t,r){t.exports=class{constructor(t,r){this.game=t,this.el=r,this.setupBoard(),this.bindEvents()}bindEvents(){$("li").on("click",t=>{const r=$(t.currentTarget),e=r.attr("data-pos"),n=[Number(e[0]),Number(e[e.length-1])];try{this.game.playMove(n),this.makeMove(r)}catch(t){return void alert("This "+t.msg.toLowerCase())}this.game.isOver()&&alert("over")})}makeMove(t){t.css("background-color","red"),t.text(this.game.currentPlayer)}setupBoard(){const t=$("<ul>");for(let r=0;r<3;r++)for(let e=0;e<3;e++){let n=$("<li>").addClass("square").attr("data-pos",[r,e]);t.append(n)}this.el.append(t),t.addClass("ticTacToe_list group")}}}]);