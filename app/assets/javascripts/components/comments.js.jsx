var Comments = React.createClass({
  propTypes: {
    path: React.PropTypes.string
  },
  getInitialState: function() {
     let post = JSON.parse(this.props.post);
     return { post: post,user_id:this.props.current_user_id, showSupplyAmount: false,supplyAmount:0 };
   },


   getDefaultProps: function() {
     return { comments: [] };
   },

   render: function() {
     let path = this.props.path;
     return({ this.state.showSupplyAmount ? <div onClick={this.handleClick}> {this.state.supplyAmount} new supply </div> : null }

    <section id="comments" data-channel="comments" data-post-id={this.props.post.id}>
     {this.state.post.comments.map(function(comment,index) {

     return   {(index< this.state.post.comments.length-this.state.showSupplyAmount)?<Comment key={comment.id} comment={comment} path={path}  />: nul}
   })}
   </section>);

    },
    componentDidMount: function() {
      this.setupSubscription();
    },

    updatePost: function(comment) {
        console.log("updatepost");
      let post = JSON.parse(comment);
      this.setState({ post: post });
    },
    handleReceived: function() {
       this.setState({ showSupplyAmount: true,supplyAmount: (this.state.supplyAmount + 1)  });
   },
   handleClick: function() {
      this.setState({ showSupplyAmount: false,supplyAmount: this.getInitialState().supplyAmount });

  },


    setupSubscription: function() {

      App.comments = App.cable.subscriptions.create("CommentsChannel", {
        post_id: this.state.post.id,
        user_id: this.state.user_id,
        showSupplyAmount: this.state.showSupplyAmount,
        supplyAmount: this.state.supplyAmount,
        connected: function () {
          setTimeout(() => this.perform('follow', { post_id: this.post_id }), 1000);
        },
        userIsCurrentUser: function(user_id) {

          return(user_id==this.user_id);

        },
        received: function (data) {
          /* TODO: received updatepost calismiyor, sanirim firedaki eski problemin aynisi*/
         if(!this.userIsCurrentUser(data.user_id)){
          this.handleReceived();











          }else{

/*
            TODO: add existing amount functionality
            unless @userIsCurrentUser(data.user_id)
              newSupply = $("[data-behavior='id-div-newSupply']")
              newSupplyAmount = $("[data-behavior='new-supply-amount']")
              existingSupplyAmount = parseInt(newSupplyAmount.text())
              newSupplyAmount.text(existingSupplyAmount+1)
              newSupply.show()
            */
        }
          this.updatePost(data.comment);
        },

        updatePost: this.updatePost.bind(this)
        handleReceived: this.handleReceived.bind()

      });
    }
});
