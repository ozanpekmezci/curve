var CommentsContainer = React.createClass({
  getInitialState: function() {
         return { showForm: false };
     },
     onClick: function() {
         this.setState({ showForm: true });
     },


  render: function() {
    return (
  <div>
    <input type="submit" value="Supply" className='btn btn-success' onClick={this.onClick} />
                { this.state.showForm ?   <CommentForm
                        post={this.props.post}
                      /> : null }

        <Comments
          post={this.props.postview}
          path={this.props.path}
        />
  </div>
);
  }
});