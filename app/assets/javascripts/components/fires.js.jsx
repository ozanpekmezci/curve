var Fires = React.createClass({
  propTypes: {
    path: React.PropTypes.string
  },
  getInitialState: function() {
     let chat = JSON.parse(this.props.chat);
     return { chat: chat };
   },

   getDefaultProps: function() {
     return { fires: [] };
   },

   render: function() {
    let path = this.props.path;
    return(
      <section id='fires' data-channel='fires' data-channel-id={this.props.chat.id}>
        <h2 className='title'>
          Messages
        </h2>
        {this.state.chat.fires.map(function(fire) {
          return <Fire key={fire.id} fire={fire} path={path} />
        })}
      </section>
      <FireForm chat={this.state.chat}/>
          );
    },
    componentDidMount: function() {
      this.setupSubscription();
    },

    updateChat: function(fire) {

      let chat = JSON.parse(fire);
      this.setState({ chat: chat }, function (){
        console.log(this.state.chat);
      });
    },

    setupSubscription: function() {

      App.comments = App.cable.subscriptions.create("FiresChannel", {
        chat_id: this.state.chat.id,

        connected: function () {
          setTimeout(() => this.perform('follow', { chat_id: this.chat_id }), 1000);
        },

        received: function (data) {
          this.updateChat(data.fire);
        },

        updateChat: this.updateChat.bind(this)

      });
    }
});
