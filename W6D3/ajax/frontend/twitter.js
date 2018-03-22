const followToggle = require('./follow_toggle.js');
const usersSearch = require('./users_search.js');
const APIUtil = require('./api_util.js');

$(() => {
  const $el = $(".follow-toggle");
  const $el2 = $("nav.users-search");

  $el.each((idx,el) =>{
    new followToggle(el);
  });

  $el2.each((idx, el) => {
    new usersSearch(el);
  });


  console.log("hello");
});
