/*
 * Policy object, returning a single `permit` action
 *
 * @param action [String]
 * @param record [Object]
 *
 * @example
 *   if (CommentPolicy.permit('update', record)) { ... }
 *
 * @return [Boolean]
 */
var CommentPolicy = (function(currentUser, undefined) {

  var _policies = {
    update: function(record) {
      return window.currentUser.id === record.user_id;
    },
    destroy: function(record) {
      return this.update(record) || window.currentUser.role === 'admin';
    },
  };

  var permit = function(action, record) {
    return _policies[action](record);
  }

  return {
    permit: permit
  };

})(window.currentUser);
