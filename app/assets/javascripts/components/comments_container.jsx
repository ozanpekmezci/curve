var CommentsContainer = React.createClass({
  getInitialState: function() {
         return { showForm: false };
     },
     onClick: function() {
         this.setState({ showForm: !this.state.showForm });
     },


  render: function() {
    return (
  <div>
    <input type="submit" value="Supply" className='btn btn-success' onClick={this.onClick} />
                { this.state.showForm ?   <CommentForm
                        post={this.props.post}
                        current_user_id={this.props.current_user_id}
                      /> : null }

        <Comments
          post={this.props.postview}
          path={this.props.path}
          current_user_id={this.props.current_user_id}
        />
  </div>
);
  }
});
