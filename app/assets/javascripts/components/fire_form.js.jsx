var FireForm = React.createClass({
  getInitialState: function() {
    return { body: ''}
  },

  handleChange: function(e) {
    var name = e.target.name;
    var obj = {};
    obj[name] = e.target.value;
    this.setState(obj);
  },

  valid: function() {
    return (this.state.body);
  },

  handleSubmit: function(e) {
    let path = "/chats/"+this.props.chat.id+"/fires.js";
    e.preventDefault();
    console.log(this.getInitialState());
    $.ajax({
       url: path,
       dataType: 'json',
       type: 'POST',
       data: { fire: this.state },
       success: function(data) {
         this.setState({body: this.getInitialState().body});
       }.bind(this),
       error: function(xhr, status, err) {
         console.log(""+status+""+err.toString());
       }.bind(this)
     });
  },

  render: function() {
    return(
      <form className='form-inline' id={"chat_form_" + this.props.chat.id} onSubmit={this.handleSubmit}>
        <div className='form-group'>
          <input type='text' className='form-control'
                 placeholder='Fire it up!' name='body'
                 value={this.state.body} onChange={this.handleChange}>
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
