var Comment = React.createClass({

  render: function() {

    return (<article data-user-id={this.props.comment.user_id}>
    <div class="comment" data-id={this.props.comment.id}>


    	<p class="comment-comment">{this.props.comment.comment}</p>
    	<p class="comment-price">{this.props.comment.price}<i class='fa fa-eur'></i></p>
      <Permit policy='CommentPolicy' action='update' record={this.props.comment}>
        <a href={"/posts/" + this.props.post.id + "/comments/"+this.props.comment.id+ "/edit"}>Edit</a>
       </Permit>
       <Permit policy='CommentPolicy' action='destroy' record={this.props.comment}>
           <a href='#' onClick={this.handleDestroy}>Delete</a>
         </Permit>
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
    {/*
      TODO: add username and avatar
    */}
      <p>Sent by:<a href={this.props.path  + '/' + this.props.comment.user_id}>{this.props.comment.user_id}</a>, at:{ this.props.comment.created_at}</p>
      {/*
        TODO: enable edit

      	<div class="comment_form-edit" data-id="<%= comment.id %>">
      		<div class="editform" style="display:none">
      		</div>
    	</div>
      */}
    </div>
    </article>
);
  }
});
