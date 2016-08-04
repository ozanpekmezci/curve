var Fires = React.createClass({
  propTypes: {
    path: React.PropTypes.string
  },
  getInitialState: function() {
     return { fires: this.props.fires };
   },

   getDefaultProps: function() {
     return { fires: [] };
   },
  render: function() {
    return(
      <section id='fires' data-channel='fires' data-channel-id={this.props.chat.id}>
        <h2 className='title'>
          Messages
        </h2>
        {this.state.fires.map(function(fire) {
          return <Fire key={fire.id} fire={fire} path={path} />
        })}
      </section>
);
            }
});
