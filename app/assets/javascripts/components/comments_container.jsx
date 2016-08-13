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
                        current_user={this.props.current_user}
                      /> : null }

        <Comments
          post={this.props.postview}
          path={this.props.path}
        />
  </div>
);
  }
});
