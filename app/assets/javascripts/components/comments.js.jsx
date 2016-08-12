var Comments = React.createClass({
  propTypes: {
    path: React.PropTypes.string
  },
  getInitialState: function() {
     let post = JSON.parse(this.props.post);
     return { post: post };
   },

   getDefaultProps: function() {
     return { comments: [] };
   },

   render: function() {
     if (this.state.post.comments){
       <section id="comments" data-channel="comments" data-post-id={this.props.post.id}>

       {this.state.post.comments.map(function(comment) {
        return <Comment key={comment.id} comment={comment} path={path} />
     })}

     </section>
   }
    },
    componentDidMount: function() {
      this.setupSubscription();
    },

    updatePost: function(comment) {

      let post = JSON.parse(comment);
      this.setState({ post: post }, function (){
        console.log(this.state.post);
      });
    },

    setupSubscription: function() {

      App.comments = App.cable.subscriptions.create("CommentsChannel", {
        post_id: this.state.post.id,

        connected: function () {
          setTimeout(() => this.perform('follow', { post_id: this.post_id }), 1000);
        },
        userIsCurrentUser: function() {
            {/*
              TODO: add userIsCurrentUser feature
              userIsCurrentUser: (user_id)
              user_id is $('meta[name=current-user]').attr('id')
              */}
        },
        received: function (data) {
          {/*
            TODO: add existing amount functionality
            unless @userIsCurrentUser(data.user_id)
              newSupply = $("[data-behavior='id-div-newSupply']")
              newSupplyAmount = $("[data-behavior='new-supply-amount']")
              existingSupplyAmount = parseInt(newSupplyAmount.text())
              newSupplyAmount.text(existingSupplyAmount+1)
              newSupply.show()
            */}
          this.updatePost(data.comment);
        },

        updatePost: this.updatePost.bind(this)

      });
    }
});
