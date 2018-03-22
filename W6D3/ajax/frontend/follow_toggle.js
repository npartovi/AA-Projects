class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick = this.handleClick.bind(this);
    this.handleClick();
  }


  render(){
    if(this.followState){
      this.$el.text("Unfollow!");
    }else {
      this.$el.text("Follow!");
    }

  }

  handleClick(){
    this.$el.on("click", (event) =>{
      event.preventDefault();

      console.log(this.userId);

      if(!this.followState){
        $.ajax({
          type: "DELETE",
          url: `/users/${this.userId}/follow`,
          dataType: 'json',
          success:() => {
            this.followState = true;
            this.render();

          },
          error() {
            console.log("this is an error");
          }
        });

      }else {
        $.ajax({
          type: "POST",
          url: `/users/${this.userId}/follow`,
          dataType: 'json',
          success: () => {
            this.followState = false;
            this.render();
          },
          error() {
            console.log("this is an error");
          }
        });

      }



    });



  }


}


module.exports = FollowToggle;
