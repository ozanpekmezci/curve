var Comment = React.createClass({
  getInitialState: function() {
    return { edit: false };
  },
  handleDelete: function(e) {
      $.ajax({
        method: 'DELETE',
        url: "/posts/"+this.props.post.id+"/comments/"+this.props.comment.id,
        dataType: 'JSON',
        success: function() {
          this.props.handleDeleteRecord(this.props.comment)
        }.bind(this)
      });
    },

    handleEdit: function(e) {
      e.preventDefault();
      var data = { comment: ReactDOM.findDOMNode(this.refs.comment).value,
                   price: ReactDOM.findDOMNode(this.refs.price).value,
                    }
      $.ajax({
        method: 'PUT',
        url: "/posts/" + this.props.post.id + "/comments/"+this.props.comment.id,
        dataType: 'JSON',
        data: { comment: data },
        success: function(data) {
          this.setState({ edit: false });
          this.props.handleEditRecord(this.props.comment, data);
        }.bind(this)
      });
    },
    renderedCommentEditDelete: function() {
      if (this.state.edit === true) {
        return this.commentForm();
      } else {
        return this.commentResult();
      }
    },
    commentForm: function() {
    return(
        <div>

          <input className='form-control' type='text'
                 defaultValue={this.props.comment.comment} ref='comment'>
          </input>

          <input className='form-control' type='number'
                 defaultValue={this.props.comment.price} ref='price'>
          </input>



          <Permit policy='CommentPolicy' action='update' record={this.props.comment}>
            <a className='btn btn-default' onClick={this.handleEdit}>Edit</a>
           </Permit>
           <Permit policy='CommentPolicy' action='destroy' record={this.props.comment}>
               <a className='btn btn-danger'  onClick={this.handleToggle}>Cancel</a>
             </Permit>
      </div>

    );
  },

    commentResult: function() {
      return(
        <div>
        <p className="comment-comment">{this.props.comment.comment}</p>
      	<p className="comment-price">{this.props.comment.price}<i class='fa fa-eur'></i></p>
          <p>Sent by:<a href={this.props.path  + '/' + this.props.comment.user_id}>{this.props.comment.user_id}</a>, at:{ this.props.comment.created_at}</p>
        <Permit policy='CommentPolicy' action='update' record={this.props.comment}>
            <a className='btn btn-default' onClick={this.handleToggle}>
              Edit
            </a>
        </Permit>
          <Permit policy='CommentPolicy' action='destroy' record={this.props.comment}>
            <a className='btn btn-danger' onClick={this.handleDelete}>
              Delete
            </a>
           </Permit>
          </div>

      );
    },
    handleToggle: function(e) {
      e.preventDefault();
      this.setState({ edit: !this.state.edit });
    },
  render: function() {

    return this.renderedCommentEditDelete();
    {/*
      TODO: add username and avatar and buy option
    */}
      {/*
        TODO: enable edit

        <div class="comment_form-edit" data-id="<%= comment.id %>">
          <div class="editform" style="display:none">
          </div>
      </div>
      */}
      {/*
       <div class="btn-group">
        <% if policy(comment).edit? %>
          <%= link_to 'Edit', edit_post_comment_path(comment.commentable,comment), class: 'btn btn-info', method: :get, remote: true  %>
        <%end%>
        <% if policy(comment).destroy? %>
          <%= link_to 'Delete', post_comment_path(comment.commentable,comment), data: {confirm: 'Are you sure?'}, method: :delete, class: 'btn btn-danger',remote: true, rel:"nofollow" %>
        <%end%>
        <% if policy(comment).buy? %>
          <%= link_to 'Buy',initiate_order_path(comment.id), class: "btn btn-success", "data-rip" => comment.user_id , method: :post%>
        <%end%>
    </div>
    */}






  }
});
