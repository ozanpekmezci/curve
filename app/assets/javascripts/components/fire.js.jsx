var Fire = React.createClass({

  render: function() {
    return(<article data-user-id={this.props.fire.user_id}>
      <div className='fire' data-id={this.props.fire.id}>

      	<p className='fire-body'>{this.props.fire.body}</p>
      	<p>Sent by:<a href={this.props.path  + this.props.fire.user_id}>{this.props.fire.user}</a>, at:{ this.props.fire.created_at }</p>

      </div>
    </article>);
  }
});
