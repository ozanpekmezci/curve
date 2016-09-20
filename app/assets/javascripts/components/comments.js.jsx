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
    deleteRecord: function(comment) {
    var index = this.state.post.comments.indexOf(comment);
    var comments = React.addons.update(this.state.post.comments,
                                      { $splice: [[index, 1]] });
    let post = this.state.post;
    post.comments = comments
    this.setState({ post: post,showSupplyAmount:false,supplyAmount:0 });
  },
  updateRecord: function(comment, data) {
  console.log("update");
console.log(comment);
console.log(data);
    var index = this.state.post.comments.indexOf(comment);
  var comments = React.addons.update(this.state.post.comments,
                                    { $splice: [[index, 1, data]] });
  let post = this.state.post;
  post.comments = comments
  console.log("post"+post.comments.length);
this.setState({ post: post,showSupplyAmount:false,supplyAmount:0 });
console.log("setstate");
  },


   render: function() {
    let length=this.state.post.comments.length;
    let supplyAmount= this.state.supplyAmount;
    let path=this.props.path;
    let post = this.state.post;
    console.log(this.state.post.comments);

     return(
    <div>{ this.state.showSupplyAmount ? <div onClick={this.handleClick}> {this.state.supplyAmount} new supply </div> : null }

    <section id="comments" data-channel="comments" data-post-id={post.id}>
     {this.state.post.comments.map(function(comment,index) {
      console.log("comment"+index);
      console.log(comment);

     return  ( <div>{index<length-supplyAmount?<Comment key={comment.id} comment={comment} path={path} post={post}  handleDeleteRecord={this.deleteRecord}
        handleEditRecord={this.updateRecord}/>: null}</div>);
   }.bind(this))}
   </section>
</div>);

    },
    componentDidMount: function() {
      this.setupSubscription();
    },

    updatePost: function(comment) {
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
         if(!this.userIsCurrentUser(data.user_id)){
          this.handleReceived();











          }else{


        }
          this.updatePost(data.comment);
        },

        updatePost: this.updatePost.bind(this),
        handleReceived: this.handleReceived.bind()

      });
    }
});
