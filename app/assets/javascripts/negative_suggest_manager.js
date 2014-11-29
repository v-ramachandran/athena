var NegativeSuggest = NegativeSuggest || {};

NegativeSuggest.InputManager = function(quorum_size) {

  var blacklisted_items = [];
  var INPUT_LABEL_SELECTOR = ".text-input.negative-suggested";

  var refresh_blacklist_items = function () {
    var target_url = "/restaurant_recommendation/show_groups?minimum_frequency="+
      quorum_size.toString();
    $.get(target_url, function(data) {
      blacklisted_items = data;
    })
  }

  var block_form_submission = function(form, blacklisted_items) {

    items_to_join = blacklisted_items.slice(0,4)
    if (items_to_join.length == 1) {
      var message = "Note that the entry "+items_to_join[0]+" already exists."
    } else {
      var message = "Note that entries "+items_to_join.join(" ,")+" already exist.";
    }

    form.find(".entry-message-container").removeClass("active");
    form.find(".denial-message").text(message);
    form.find(".denial-message-container").addClass("active");
    form.find(".submit.button").prop('disabled', true);
  }

  var allow_form_submission = function(form) {
    form.find(".entry-message-container").removeClass("active");
    form.find(".allow-message-container").addClass("active");
    form.find(".submit.button").prop('disabled', false);
  }

  var display_vanilla_message = function(form) {
    form.find(".entry-message-container").removeClass("active");
    form.find(".vanilla-message-container").addClass("active");
    form.find(".submit.button").prop('disabled', true);    
  }

  var deny_blacklisted_items = function (form_selector) {
    var form = $(form_selector);
    var input_target = form.find(INPUT_LABEL_SELECTOR)

    input_target.on("keyup", function() {

      if ($.trim(this.value).length > 0) {
        var regex = new RegExp("^"+this.value,"g");
        var filtered_blacklist_items = blacklisted_items.filter(function(item) {
          return item.match(regex);
        });

        if (filtered_blacklist_items.length == 0) {
          allow_form_submission(form);
        } else {
          block_form_submission(form, filtered_blacklist_items);
        }
      } else {
        display_vanilla_message(form);
      }
    });
  }

  return {
    refresh_blacklist_items : refresh_blacklist_items,
    deny_blacklisted_items : deny_blacklisted_items
  }
};
