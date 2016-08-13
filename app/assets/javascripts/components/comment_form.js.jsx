var CommentForm = React.createClass({
  getInitialState: function() {
    return { comment: '', price: 0, user_id:this.props.current_user_id}
  },

  handleChange: function(e) {
    var name = e.target.name;
    var obj = {};
    obj[name] = e.target.value;
    this.setState(obj);
  },

  valid: function() {
    return (this.state.comment&&this.state.price);
  },

  handleSubmit: function(e) {
    let path = "/posts/"+this.props.post.id+"/comments.js";
    e.preventDefault();
    $.ajax({
       url: path,
       dataType: 'json',
       type: 'POST',
       data: { comment: this.state },
       success: function(data) {
         this.setState({comment: getInitialState().comment, price: getInitialState().price});
       }.bind(this),
       error: function(xhr, status, err) {
         console.log(""+status+""+err.toString());
         console.warn(xhr.responseText);
       }.bind(this)
     });
  },

  render: function() {
    return (
      <form className='form-inline' id={"post_form_" + this.props.post.id} onSubmit={this.handleSubmit}>
        <div className='form-group'>
          <input type='text' className='form-control'
                 placeholder='Your supply' name='comment'
                 value={this.state.comment} onChange={this.handleChange}>
          </input>
          <input type='number' className='form-control'
                 placeholder='Your price' name='price'
                 value={this.state.price} onChange={this.handleChange}>
          </input>
        </div>
        <div className='form-group'>
          <input type='submit' className='btn btn-primary'
                 disabled={!this.valid()}>
          </input>
        </div>
      </form>
);
  }
});
